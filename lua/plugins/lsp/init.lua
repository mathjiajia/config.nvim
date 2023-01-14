return {

	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neodev.nvim", config = true },
		},
		config = function()
			-- diagnostics signs
			local icons = require("config").icons.diagnostics
			for name, icon in pairs(icons) do
				name = "DiagnosticSign" .. name
				vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
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
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local function on_attach(client, bufnr)
				require("plugins.lsp.misc").on_attach(client, bufnr)
				require("plugins.lsp.format").on_attach(client, bufnr)
			end

			local servers = {
				clangd = {},
				pyright = {},
				sumneko_lua = { settings = { Lua = { workspace = { checkThirdParty = false } } } },
				texlab = {
					settings = {
						texlab = {
							build = {
								executable = "tectonic",
								args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
								-- args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" },
								onSave = true,
							},
							forwardSearch = {
								executable = "sioyek",
								args = {
									-- "--execute-command",
									-- "turn_on_synctex",
									"--reuse-window",
									"--forward-search-file",
									"%f",
									"--forward-search-line",
									"%l",
									"%p",
								},
							},
							chktex = { onOpenAndSave = false },
							diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
							bibtexFormatter = "latexindent",
						},
					},
				},
			}
			require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
			require("mason-lspconfig").setup_handlers({
				function(server)
					local opts = servers[server] or {}
					opts.capabilities = capabilities
					opts.on_attach = on_attach
					require("lspconfig")[server].setup(opts)
				end,
			})

			require("lspconfig").sourcekit.setup({
				filetypes = { "swift", "objective-c", "objective-cpp" },
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
		event = "BufReadPre",
	},

	-- inject LSP
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = "mason.nvim",
		opts = function()
			local null_ls = require("null-ls")
			return {
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
			}
		end,
		event = "BufReadPre",
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		opts = { ui = { border = "rounded" } },
		config = function(_, opts)
			require("mason").setup(opts)

			local mr = require("mason-registry")
			local tools = require("config").ms_install
			for _, tool in ipairs(tools) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	-- lsp enhancement
	{
		"glepnir/lspsaga.nvim",
		opts = {
			ui = {
				border = "rounded",
				colors = require("config").colors,
			},
		},
		cmd = "Lspsaga",
		-- stylua: ignore
		keys = {
			{ "gh", function() require("lspsaga.finder"):lsp_finder() end, silent = true, desc = "Lsp Finder" },
			{ "<M-o>", function() require("lspsaga.outline"):outline() end, silent = true, desc = "Lsp Outline" },
		},
	},
}
