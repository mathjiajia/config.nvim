return {

	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason.nvim" },
		config = function()
			require("lspconfig.ui.windows").default_options.border = "rounded"

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

			local settings = {
				basedpyright = {},
				clangd = {},
				lua_ls = {
					Lua = {
						workspace = { checkThirdParty = false },
						hint = { enable = true },
						completion = { callSnippet = "Replace" },
						telemetry = { enable = false },
					},
				},
				matlab_ls = {
					MATLAB = {
						indexWorkspace = true,
						installPath = "/Applications/MATLAB_R2024a.app",
						telemetry = false,
					},
				},
				taplo = {},
				texlab = {
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
								vim.fn.stdpath("data") .. "/mason/bin/texlab inverse-search -i %%1 -l %%2",
								"--forward-search-file",
								"%f",
								"--forward-search-line",
								"%l",
								"%p",
							},
							-- executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
							-- args = { "-r", "%l", "%p", "%f" },
						},
						chktex = { onOpenAndSave = false },
						diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
					},
				},
			}

			for _, server in pairs(vim.tbl_keys(settings)) do
				require("lspconfig")[server].setup({
					capabilities = capabilities,
					settings = settings[server],
				})
			end

			require("lspconfig").sourcekit.setup({
				filetypes = { "swift", "objective-c", "objective-cpp" },
				capabilities = capabilities,
			})
		end,
	},

	-- cmdline tools and lsp servers
	{
		"williamboman/mason.nvim",
		-- dependencies = {
		-- 	"WhoIsSethDaniel/mason-tool-installer.nvim",
		-- 	opts = {
		-- 		ensure_installed = {
		-- 			-- lsp
		-- 			"basedpyright",
		-- 			"clangd",
		-- 			"lua-language-server",
		-- 			"matlab-language-server",
		-- 			"taplo",
		-- 			"texlab",
		-- 			-- dap
		-- 			"codelldb",
		-- 			"debugpy",
		-- 			-- linter
		-- 			"commitlint",
		-- 			"markdownlint-cli2",
		-- 			"shellcheck",
		-- 			-- formatter
		-- 			"bibtex-tidy",
		-- 			"black",
		-- 			"clang-format",
		-- 			"latexindent",
		-- 			"prettierd",
		-- 			"shfmt",
		-- 			"stylua",
		-- 			-- others
		-- 			-- "tectonic",
		-- 		},
		-- 	},
		-- },
		opts = { ui = { border = "rounded", height = 0.8 } },
	},

	-- lsp enhancement
	{
		"nvimdev/lspsaga.nvim",
		event = { "LspAttach" },
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = { enable = false },
				lightbulb = { enable = false },
				outline = { auto_preview = false },
				floaterm = { height = 1, width = 1 },
			})

			vim.keymap.set("n", "gh", function()
				require("lspsaga.finder"):new({})
			end, { desc = "Lsp Finder" })

			vim.keymap.set("n", "<M-o>", function()
				require("lspsaga.symbol"):outline()
			end, { desc = "Lspsaga Outline" })
		end,
	},

	-- formatting
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					bib = { "bibtex-tidy" },
					c = { "clang-format" },
					css = { "prettierd" },
					html = { "prettierd" },
					javascript = { "prettierd" },
					json = { "prettierd" },
					jsonc = { "prettierd" },
					markdown = { "prettierd" },
					["markdown.mdx"] = { "prettierd" },
					yaml = { "prettierd" },
					fish = { "fish_indent" },
					lua = { "stylua" },
					python = { "black" },
					sh = { "shfmt" },
					swift = { "swift_format" },
					tex = { "latexindent" },
					toml = { "taplo" },
				},
				format_on_save = {
					timeout_ms = 3000,
					lsp_fallback = true,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>cF", function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 2000 })
			end, { desc = "Format Injected Langs" })
		end,
	},

	-- linting
	{
		"mfussenegger/nvim-lint",
		-- ft = { "bash", "fish", "gitcommit", "markdown", "zsh" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				bash = { "shellcheck" },
				fish = { "fish" },
				gitcommit = { "commitlint" },
				markdown = { "markdownlint-cli2" },
				zsh = { "shellcheck" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
