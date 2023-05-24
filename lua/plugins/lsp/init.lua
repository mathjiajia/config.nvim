local fn = vim.fn

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
			local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function on_attach(client, bufnr)
				require("plugins.lsp.misc").on_attach(client, bufnr)
				require("plugins.lsp.format").on_attach(client, bufnr)
			end

			local servers = {
				clangd = {},
				pyright = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
						},
					},
				},
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
								-- executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
								-- args = { "%l", "%p", "%f" },
								executable = "sioyek",
								-- stylua: ignore
								args = {
									"--reuse-window",
									"--execute-command", "turn_on_synctex", -- Open Sioyek in synctex mode.
									"--inverse-search",
									fn.stdpath("data") .. "/lazy/nvim-texlabconfig/nvim-texlabconfig -file %1 -line %2 -cache_root " .. fn.stdpath("cache") .. " -server " .. vim.v.servername,
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
						opts.capabilities = capabilities
						opts.on_attach = on_attach
						require("lspconfig")[server].setup(opts)
					end,
				},
			})

			require("lspconfig").sourcekit.setup({
				filetypes = { "swift", "objective-c", "objective-cpp" },
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
		event = { "BufReadPre", "BufNewFile" },
	},

	-- inject LSP
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "mason.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				on_attach = function(client, bufnr)
					require("plugins.lsp.format").on_attach(client, bufnr)
				end,
				sources = {
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.fish_indent,
					null_ls.builtins.formatting.latexindent,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.swiftformat,
					null_ls.builtins.diagnostics.fish,
					null_ls.builtins.diagnostics.markdownlint.with({
						args = { "--config", "~/.config/markdownlint/markdownlint.yaml", "--stdin" },
					}),
				},
			})
		end,
		event = { "BufReadPre", "BufNewFile" },
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
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

	-- lsp enhancement
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			ui = { border = "rounded" },
			symbol_in_winbar = { enable = false },
		},
		cmd = "Lspsaga",
		-- stylua: ignore
		keys = { { "gh", function() require("lspsaga.finder"):lsp_finder() end, silent = true, desc = "Lsp Finder" } },
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
