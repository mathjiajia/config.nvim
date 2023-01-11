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
		servers = nil,
		config = function()
			-- diagnostics
			require("plugins.lsp.diagnostic")

			-- lspconfig
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			local function on_attach(client, bufnr)
				require("plugins.lsp.format").on_attach(client, bufnr)
				require("plugins.lsp.keymaps").on_attach(client, bufnr)
				require("plugins.lsp.highlight").on_attach(client, bufnr)
				-- require('plugins.lsp.codelens').on_attach(client, bufnr)
			end

			local servers = require("plugins.lsp.servers")
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
		event = "BufReadPre",
		config = function()
			local null_ls = require("null-ls")

			local function on_attach(client, bufnr)
				require("plugins.lsp.format").on_attach(client, bufnr)
			end

			null_ls.setup({
				on_attach = on_attach,
				sources = {
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.fish_indent,
					null_ls.builtins.formatting.latexindent,
					null_ls.builtins.formatting.prettierd.with({
						filetypes = { "css", "javascript", "yaml", "markdown" },
					}),
					null_ls.builtins.formatting.stylua,
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
		opts = {
			ui = { border = "rounded" },
			ensure_installed = {
				"black",
				"cpptools",
				"debugpy",
				"markdownlint",
				"prettierd",
				"stylua",
				"tectonic",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
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
		branch = "version_2.3",
		opts = {
			ui = { border = "rounded" },
		},
		config = function(_, opts)
			require("lspsaga").init_lsp_saga(opts)
		end,
		cmd = "Lspsaga",
		-- stylua: ignore
		keys = {
			{ "gh", function() require("lspsaga.finder"):lsp_finder() end, silent = true, desc = "Lsp Finder" },
			{ "<M-o>", function() require("lspsaga.outline"):outline() end, silent = true, desc = "Lsp Outline" },
		},
	},
}
