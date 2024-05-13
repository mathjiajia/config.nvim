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
		config = function()
			require("lspconfig.ui.windows").default_options.border = "rounded"

			-- diagnostic keymaps
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

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			require("mason-lspconfig").setup({
				ensure_installed = {
					"basedpyright",
					"clangd",
					"lua_ls",
					"texlab",
				},
				handlers = {
					function(server_name) -- default handler (optional)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
						})
					end,

					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									workspace = { checkThirdParty = false },
									hint = { enable = true },
									completion = { callSnippet = "Replace" },
									telemetry = { enable = false },
								},
							},
						})
					end,

					["texlab"] = function()
						require("lspconfig").texlab.setup({
							filetypes = { "tex", "bib" },
							capabilities = capabilities,
							settings = {
								texlab = {
									build = {
										forwardSearchAfter = false,
										executable = "latexmk",
										args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
										onSave = true,
									},
									forwardSearch = {
										executable = "sioyek",
										args = {
											"--reuse-window",
											"--execute-command",
											"turn_on_synctex",
											"--inverse-search",
											vim.fn.stdpath("data")
												.. "/mason/packages/texlab/texlab inverse-search --input %%1 --line %%2",
											"--forward-search-file",
											"%f",
											"--forward-search-line",
											"%l",
											"%p",
										},
									},
									chktex = { onOpenAndSave = false },
									diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
									latexFormatter = "none",
									bibtexFormatter = "latexindent",
								},
							},
						})
					end,
				},
			})

			require("lspconfig").sourcekit.setup({
				filetypes = { "swift", "objective-c", "objective-cpp" },
				capabilities = capabilities,
			})
		end,
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		-- dependencies = {
		-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- 	opts = {
		-- 		ensure_installed = {
		-- 			-- linter
		-- 			"commitlint",
		-- 			"markdownlint-cli2",
		-- 			"shellcheck",
		-- 			-- formatter
		-- 			"bibtex-tidy",
		-- 			"black",
		-- 			"clang-format",
		-- 			"prettierd",
		-- 			"shfmt",
		-- 			"stylua",
		-- 			-- others
		-- 			-- "tectonic",
		-- 		},
		-- 	},
		-- },
		opts = {
			ui = {
				border = "rounded",
				height = 0.8,
			},
		},
	},

	-- lsp enhancement
	{
		"nvimdev/lspsaga.nvim",
		event = { "LspAttach" },
		opts = {
			symbol_in_winbar = { enable = false },
			lightbulb = { enable = false },
			outline = { auto_preview = false },
		},
        -- stylua: ignore
        keys = {
            { "gh", function() require("lspsaga.finder"):new({}) end, silent = true, desc = "Lsp Finder" },
            { "<M-o>", function() require("lspsaga.symbol"):outline() end, silent = true, desc = "Lspsaga Outline" },
        },
	},

	{
		"folke/trouble.nvim",
		branch = "dev",
		cmd = { "TroubleToggle", "Trouble" },
		config = true,
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			-- {
			-- 	"<leader>cs",
			-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
			-- 	desc = "Symbols (Trouble)",
			-- },
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
