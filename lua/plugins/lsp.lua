return {

	{
		"nvim-lspconfig",
		after = function()
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
						installPath = "/Applications/MATLAB_R2024b.app",
						telemetry = false,
					},
				},
				nil_ls = {},
				sourcekit = {},
				taplo = {},
				texlab = {
					texlab = {
						build = {
							args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
							forwardSearchAfter = false,
							onSave = true,
						},
						forwardSearch = {
							executable = "/Applications/sioyek.app/Contents/MacOS/sioyek",
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
		end,
	},

	{
		"mason.nvim",
		after = function()
			require("mason").setup({ ui = { border = "rounded", height = 0.8 } })
		end,
	},

	-- {
	-- 	"mason-tool-installer.nvim",
	-- 	after = function()
	-- 		require("mason-tool-installer").setup({
	-- 			ensure_installed = {
	-- 				-- lsp
	-- 				"basedpyright",
	-- 				"clangd",
	-- 				"lua-language-server",
	-- 				"matlab-language-server",
	-- 				"nil",
	-- 				"texlab",
	-- 				-- dap
	-- 				"codelldb",
	-- 				"debugpy",
	-- 				-- linter
	-- 				"commitlint",
	-- 				"markdownlint-cli2",
	-- 				"shellcheck",
	-- 				-- formatter
	-- 				"bibtex-tidy",
	-- 				"black",
	-- 				"clang-format",
	-- 				"latexindent",
	-- 				"prettierd",
	-- 				"shfmt",
	-- 				"stylua",
	-- 				-- others
	-- 				"tectonic",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"conform.nvim",
		after = function()
			require("conform").setup({
				formatters_by_ft = {
					bib = { "bibtex-tidy" },
					c = { "clang-format" },
					css = { "prettierd" },
					html = { "prettierd" },
					javascript = { "prettierd" },
					json = { "prettierd" },
					jsonc = { "prettierd" },
					fish = { "fish_indent" },
					markdown = { "prettierd" },
					["markdown.mdx"] = { "prettierd" },
					yaml = { "prettierd" },
					lua = { "stylua" },
					nix = { "nixfmt" },
					python = { "black" },
					sh = { "shfmt" },
					swift = { "swift_format" },
					tex = { "latexindent" },
					toml = { "taplo" },
				},
				formatters = {
					latexindent = {
						prepend_args = { "-c", "./.aux", "-m" },
					},
					["bibtex-tidy"] = {
						prepend_args = {
							"--curly",
							"--tab",
							"--trailing-commas",
							"--sort-fields=author,year,month,day,title,shorttitle",
							"--remove-braces",
						},
					},
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 2000,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>cF", function()
				require("conform").format({ formatters = { "injected" }, timeout_ms = 2000 })
			end, { desc = "Format Injected Langs" })
		end,
	},

	{
		"nvim-lint",
		ft = { "bash", "fish", "gitcommit", "markdown", "zsh" },
		after = function()
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
