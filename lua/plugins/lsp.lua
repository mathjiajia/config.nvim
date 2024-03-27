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
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = function()
			require("lspconfig.ui.windows").default_options.border = "rounded"

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

			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				basedpyright = {},
				clangd = {},
				lua_ls = {
					settings = {
						Lua = {
							workspace = { checkThirdParty = false },
							hint = { enable = true },
							completion = { callSnippet = "Replace" },
							telemetry = { enable = false },
						},
					},
				},
				texlab = {
					settings = {
						texlab = {
							build = {
								-- executable = "tectonic",
								-- args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
								-- forwardSearchAfter = true,
								args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
								onSave = true,
							},
							forwardSearch = {
								executable = "sioyek",
								args = {
									"--reuse-window",
									"--execute-command",
									"turn_on_synctex", -- Open Sioyek in synctex mode.
									"--inverse-search",
									vim.fn.stdpath("data")
										.. [[/lazy/nvim-texlabconfig/nvim-texlabconfig -file %%%1 -line %%%2 -cache_root ]]
										.. vim.fn.stdpath("cache")
										.. " -server "
										.. vim.v.servername,
									"--forward-search-file",
									"%f",
									"--forward-search-line",
									"%l",
									"%p",
								},
								-- executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
								-- args = { "%l", "%p", "%f" },
							},
							chktex = { onOpenAndSave = false },
							diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
							latexFormatter = "none",
							bibtexFormatter = "latexindent",
						},
					},
				},
				-- typst_lsp = {
				-- 	settings = {
				-- 		exportPdf = "onSave",
				-- 	},
				-- },
			}

			require("mason-lspconfig").setup({
				ensure_installed = vim.tbl_keys(servers),
				handlers = {
					function(server)
						local opts = servers[server]
						opts.capabilities = capabilities
						require("lspconfig")[server].setup(opts)
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
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
					height = 0.8,
				},
			})
			local mr = require("mason-registry")
			mr:on("package:install:success", function()
				vim.defer_fn(function()
					require("lazy.core.handler.event").trigger({
						event = "FileType",
						buf = vim.api.nvim_get_current_buf(),
					})
				end, 100)
			end)
			local tools = {
				"bibtex-tidy",
				"black",
				"clang-format",
				"commitlint",
				"debugpy",
				"glow",
				-- "latexindent",
				"markdownlint-cli2",
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
            { "gh",    function() require("lspsaga.finder"):new({}) end,   silent = true, desc = "Lsp Finder" },
            { "<M-o>", function() require("lspsaga.symbol"):outline() end, silent = true, desc = "Lspsaga Outline" },
        },
	},

	{
		"dnlhc/glance.nvim",
		cmd = "Glance",
		opts = {
			border = { enable = true },
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
