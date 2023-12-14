return {

	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neodev.nvim", config = true, ft = { "lua", "vim" } },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- diagnostic keymaps
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Float Diagnostics" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostics" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostics" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Loclist Diagnostics" })

			-- diagnostics config
			vim.diagnostic.config({
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = " ",
						[vim.diagnostic.severity.WARN] = " ",
						[vim.diagnostic.severity.INFO] = " ",
						[vim.diagnostic.severity.HINT] = " ",
					},
				},
			})

			-- lspconfig
			local on_attach = function(client, bufnr)
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

				local methods = vim.lsp.protocol.Methods

				local keymaps = {
					{ "gD", vim.lsp.buf.declaration, method = methods.textDocument_declaration },
					{ "<C-k>", vim.lsp.buf.signature_help, method = methods.textDocument_signatureHelp },
					{ "<leader>rn", vim.lsp.buf.rename, method = methods.textDocument_rename },
					{ "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" }, method = methods.textDocument_codeAction },
					-- stylua: ignore start
					{ "gd", function() require("glance").open("definitions") end, method = methods.textDocument_definition },
					{ "gi", function() require("glance").open("implementations") end, method = methods.textDocument_implementation },
					{ "gr", function() require("glance").open("references") end, method = methods.textDocument_references },
					{ "gt", function() require("glance").open("type_definitions") end, method = methods.textDocument_typeDefinition },
				}

				for _, keys in ipairs(keymaps) do
					if client.supports_method(keys.method) then
						vim.keymap.set(keys.mode or "n", keys[1], keys[2], { buffer = bufnr, desc = keys.method })
					end
				end

				if client.supports_method(methods.textDocument_documentHighlight) then
					local group = vim.api.nvim_create_augroup("lsp_document_highlight", {})
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						group = group,
						buffer = bufnr,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						group = group,
						buffer = bufnr,
						callback = vim.lsp.buf.clear_references,
					})
				end

				if client.supports_method(methods.textDocument_inlayHint) then
					vim.lsp.inlay_hint.enable(bufnr, true)
				end

				if client.supports_method(methods.textDocument_codeLens) then
					local group = vim.api.nvim_create_augroup("lsp_document_codelens", {})
					vim.api.nvim_create_autocmd("BufEnter", {
						group = group,
						buffer = bufnr,
						callback = vim.lsp.codelens.refresh,
						once = true,
					})
					vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "CursorHold" }, {
						group = group,
						buffer = bufnr,
						callback = vim.lsp.codelens.refresh,
					})
				end
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				clangd = {},
				pyright = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							hint = { enable = true },
							telemetry = { enable = false },
						},
					},
				},
				matlab_ls = {},
				texlab = {
					settings = {
						texlab = {
							build = {
								-- executable = "tectonic",
								-- args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
								args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
								-- forwardSearchAfter = true,
								onSave = true,
							},
							forwardSearch = {
								-- executable = "sioyek",
								-- args = {
								-- 	"--reuse-window",
								-- 	-- "--execute-command", "turn_on_synctex", -- Open Sioyek in synctex mode.
								-- 	"--inverse-search",
								-- 	vim.fn.stdpath("data")
								-- 		.. "/lazy/nvim-texlabconfig/nvim-texlabconfig -file %%%1 -line %%%2 -cache_root "
								-- 		.. vim.fn.stdpath("cache")
								-- 		.. " -server "
								-- 		.. vim.v.servername,
								-- 	"--forward-search-file",
								-- 	"%f",
								-- 	"--forward-search-line",
								-- 	"%l",
								-- 	"%p",
								-- },
								executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
								args = { "%l", "%p", "%f" },
							},
							chktex = { onOpenAndSave = false },
							diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
							latexFormatter = "none",
							bibtexFormatter = "latexindent",
						},
					},
				},
				typst_lsp = {
					settings = {
						exportPdf = "onSave",
					},
				},
			}

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server)
						local opts = servers[server]
						opts.on_attach = on_attach
						opts.capabilities = capabilities
						require("lspconfig")[server].setup(opts)
					end,
				},
			})

			require("lspconfig").sourcekit.setup({
				filetypes = { "swift", "objective-c", "objective-cpp" },
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		config = function()
			require("mason").setup({})
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					-- trigger FileType event to possibly load this newly installed LSP server
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)
			local tools = {
				"black",
				"clang-format",
				"debugpy",
				"glow",
				"latexindent",
				"markdownlint",
				"prettierd",
				"shellcheck",
				"shfmt",
				"stylua",
				-- "tectonic",
			}
			local function ensure_installed()
				for _, tool in ipairs(tools) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},

	-- lsp enhancement
	{
		"nvimdev/lspsaga.nvim",
		event = { "LspAttach" },
		opts = {
			symbol_in_winbar = { enable = false },
			lightbulb = { enable = false },
		},
		-- stylua: ignore
		keys = {
			{ "gh", function() require("lspsaga.finder"):new({}) end, silent = true, desc = "Lsp Finder" },
			{ "<M-o>", function() require("lspsaga.symbol"):outline() end, silent = true, desc = "Lspsaga Outline" },
		},
	},

	{
		"dnlhc/glance.nvim",
		cmd = "Glance",
		opts = {
			hooks = {
				before_open = function(results, open, jump)
					local uri = vim.uri_from_bufnr(0)
					if #results == 1 then
						local target_uri = results[1].uri or results[1].targetUri
						if target_uri == uri then
							jump(results[1])
						end
					else
						open(results)
					end
				end,
			},
		},
	},
}
