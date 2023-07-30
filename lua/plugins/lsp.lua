local api, fn, lsp = vim.api, vim.fn, vim.lsp
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

return {

	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "folke/neodev.nvim", config = true },
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			-- diagnostics signs
			local icons = require("config").icons.diagnostics
			for name, icon in pairs(icons) do
				name = "DiagnosticSign" .. name
				fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
			end

			-- diagnostic keymaps
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Float Diagnostics" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostics" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostics" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Loclist Diagnostics" })

			-- diagnostics config
			vim.diagnostic.config({
				virtual_text = { spacing = 4, prefix = "●" },
				severity_sort = true,
			})

			-- lspconfig
			local on_attach = function(client, bufnr)
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- stylua: ignore
				local keymaps = {
					{ "gd", function() require("glance").open("definitions") end, desc = "Definition", method = "definition" },
					{ "gi", function() require("glance").open("implementations") end,  desc = "Implementation", method = "implementation" },
					{ "gr", function() require("glance").open("references") end,  desc = "References", method = "references" },
					{ "gt", function() require("glance").open("type_definitions") end, desc = "Type Definition", method = "typeDefinition" },
					{ "gD", lsp.buf.declaration, desc = "Declaration", method = "declaration" },
					{ "<C-k>", lsp.buf.signature_help, desc = "Signature", method = "signatureHelp" },
					{ "<leader>rn", lsp.buf.rename, desc = "Rename Symbol", method = "rename" },
					{ "<leader>ca", lsp.buf.code_action, mode = { "n", "v" }, desc = "Code Action", method = "codeAction" },
				}

				for _, keys in ipairs(keymaps) do
					if client.supports_method("textDocument/" .. keys.method) then
						vim.keymap.set(keys.mode or "n", keys[1], keys[2], { buffer = bufnr, desc = keys.desc })
					end
				end

				if client.supports_method("textDocument/documentHighlight") then
					local group = augroup("lsp_document_highlight", {})
					autocmd({ "CursorHold", "CursorHoldI" }, {
						group = group,
						buffer = bufnr,
						callback = lsp.buf.document_highlight,
					})
					autocmd({ "CursorMoved", "CursorMovedI" }, {
						group = group,
						buffer = bufnr,
						callback = lsp.buf.clear_references,
					})
				end

				-- if client.supports_method("textDocument/inlayHint") then
				-- 	lsp.inlay_hint(bufnr, true)
				-- end

				-- if client.supports_method("textDocument/codeLens") then
				-- 	local group = augroup("lsp_document_codelens", {})
				-- 	autocmd("BufEnter", {
				-- 		group = group,
				-- 		buffer = bufnr,
				-- 		callback = lsp.codelens.refresh,
				-- 		once = true,
				-- 	})
				-- 	autocmd({ "InsertLeave", "BufWritePost", "CursorHold" }, {
				-- 		group = group,
				-- 		buffer = bufnr,
				-- 		callback = lsp.codelens.refresh,
				-- 	})
				-- end
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities(lsp.protocol.make_client_capabilities())

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
								executable = "tectonic",
								args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
								-- forwardSearchAfter = true,
								onSave = true,
							},
							forwardSearch = {
								executable = "sioyek",
								-- stylua: ignore
								args = {
									"--reuse-window",
									-- "--execute-command", "turn_on_synctex", -- Open Sioyek in synctex mode.
									"--inverse-search",
									fn.stdpath("data") ..
									"/lazy/nvim-texlabconfig/nvim-texlabconfig -file %%%1 -line %%%2 -cache_root " ..
									fn.stdpath("cache") .. " -server " .. vim.v.servername,
									"--forward-search-file", "%f",
									"--forward-search-line", "%l", "%p"
								},
							},
							chktex = { onOpenAndSave = false },
							diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
							latexFormatter = "none",
							bibtexFormatter = "latexindent",
						},
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
		event = { "BufReadPre", "BufNewFile" },
	},

	-- inject LSP
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "mason.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.diagnostics.fish,
					null_ls.builtins.diagnostics.markdownlint.with({
						args = { "--config", "~/.config/markdownlint/markdownlint.yaml", "--stdin" },
					}),
				},
			})
		end,
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({ ui = { border = "rounded" } })
			local mr = require("mason-registry")
			local tools = { "black", "debugpy", "glow", "markdownlint", "prettierd", "stylua", "tectonic" }
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

	{
		"nvimdev/guard.nvim",
		-- ft = { "c", "fish", "lua", "markdown", "python", "swift", "tex" },
		lazy = false,
		opts = {
			fmt_on_save = true,
			-- lsp_as_default_formatter = true,
			ft = {
				c = { fmt = { "lsp" } },
				fish = { fmt = { { cmd = "fish_indent", stdin = true } } },
				lua = { fmt = { "stylua" } },
				markdown = { fmt = { { cmd = "prettierd", args = { "--stdin-filepath" }, fname = true, stdin = true } } },
				python = { fmt = { "black" } },
				swift = { fmt = { cmd = "swiftformat", args = { "--stdinpath" }, fname = true, stdin = true } },
				tex = { fmt = { cmd = "latexindent", args = { "-g", "/dev/null" }, stdin = true } },
			},
		},
	},

	-- lsp enhancement
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			ui = { border = "rounded" },
			symbol_in_winbar = { enable = false },
		},
		cmd = "Lspsaga",
		-- stylua: ignore
		keys = { { "gh", function() require("lspsaga.finder"):new({}) end, silent = true, desc = "Lsp Finder" } },
	},

	{
		"dnlhc/glance.nvim",
		opts = {
			border = { enable = true },
			hooks = {
				---Don't open glance when there is only one result and it is located in the current buffer, open otherwise
				before_open = function(results, open, jump)
					local uri = vim.uri_from_bufnr(0)
					if #results == 1 then
						local target_uri = results[1].uri or results[1].targetUri

						if target_uri == uri then
							jump(results[1])
						else
							open(results)
						end
					else
						open(results)
					end
				end,
			},
		},
	},
}
