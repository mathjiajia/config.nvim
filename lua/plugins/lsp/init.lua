local servers = require('plugins.lsp.servers')

local function on_attach(client, bufnr)
	require('plugins.lsp.format').on_attach(client, bufnr)
	require('plugins.lsp.keymaps').on_attach(client, bufnr)
	require('plugins.lsp.highlight').on_attach(client, bufnr)
	require('plugins.lsp.codelens').on_attach(client, bufnr)
end

return {
	-- lspconfig
	{
		'neovim/nvim-lspconfig',
		event = 'BufReadPre',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			{
				'williamboman/mason.nvim',
				config = { ui = { border = 'rounded' } },
			},
			{ 'folke/neodev.nvim', config = true },
		},
		config = function()
			require('plugins.lsp.diagnostic')

			-- lspconfig
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

			for server, opts in pairs(servers) do
				opts.capabilities = capabilities
				opts.on_attach = on_attach
				require('lspconfig')[server].setup(opts)
			end
		end,
	},

	-- inject LSP
	{
		'jose-elias-alvarez/null-ls.nvim',
		event = 'BufReadPre',
		config = function()
			local null_ls = require('null-ls')
			local b = null_ls.builtins

			null_ls.setup({
				on_attach = function(client, bufnr)
					require('plugins.lsp.format').on_attach(client, bufnr)
				end,
				sources = {
					b.formatting.black,
					b.formatting.fish_indent,
					b.formatting.latexindent,
					b.formatting.prettierd.with({ filetypes = { 'css', 'javascript', 'yaml', 'markdown' } }),
					b.diagnostics.fish,
					b.diagnostics.markdownlint.with({
						args = { '--config', '~/.config/markdownlint/markdownlint.yaml', '--stdin' }
					}),
				},
			})
		end,
	},

	-- lsp enhancement
	{
		'glepnir/lspsaga.nvim',
		branch = 'version_2.3',
		config = function()
			local saga = require('lspsaga')

			saga.init_lsp_saga({
				ui = {
					border = 'rounded',
					winblend = 20,
				},
				custom_kind = require('configs.icons').lspsaga,
			})
		end,
		cmd = 'Lspsaga',
		keys = {
			{ 'gh', function()
				require('lspsaga.finder'):lsp_finder()
			end, silent = true, desc = 'Lsp Finder' },

			{ '<leader>cd', function()
				require('lspsaga.diagnostic').show_line_diagnostics()
			end, silent = true, desc = 'Line Diagnostic' },

			{ '<leader>o', function()
				require('lspsaga.outline'):render_outline()
			end, silent = true, 'Lsp Outline' },
		},
	},
}
