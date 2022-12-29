local M = {
	'neovim/nvim-lspconfig',
	dependencies = {
		'hrsh7th/cmp-nvim-lsp',
		{
			'williamboman/mason.nvim',
			config = {
				ui = { border = 'rounded' },
			},
		},
		{ 'williamboman/mason-lspconfig.nvim', config = true },
		{ 'folke/neodev.nvim', config = true },
	},
	event = 'BufReadPre',
}

function M.config()
	require('plugins.lsp.diagnostic')

	local fn, lsp = vim.fn, vim.lsp

	local on_attach = function(client, bufnr)
		vim.keymap.set('n', 'gD', lsp.buf.declaration, { buffer = bufnr, desc = 'Go to Declaration' })
		vim.keymap.set('n', 'gd', function()
			require('lspsaga.definition'):peek_definition()
		end, { buffer = bufnr, desc = 'Go to Definition' })
		vim.keymap.set('n', 'K', function()
			require('lspsaga.hover'):render_hover_doc()
		end, { buffer = bufnr, desc = 'Docs Hover' })
		vim.keymap.set('n', 'gi', lsp.buf.implementation, { buffer = bufnr, desc = 'Goto Implementation' })
		vim.keymap.set('n', '<C-k>', lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature' })
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename Symbol' })
		vim.keymap.set('n', 'gr', lsp.buf.references, { buffer = bufnr, desc = 'References' })

		require('plugins.lsp.formater').setup(client, bufnr)

		local caps = client.server_capabilities

		if caps.documentHighlightProvider then
			require('plugins.lsp.highlight').setup(bufnr)
		end
		if caps.codeActionProvider then
			require('plugins.lsp.action').setup(bufnr)
		end
		if caps.codeLensProvider then
			require('plugins.lsp.codelens').setup(bufnr)
		end
	end

	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local nvim_lsp = require('lspconfig')

	require('mason-lspconfig').setup_handlers({
		function(server_name)
			nvim_lsp[server_name].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
		['sumneko_lua'] = function()
			nvim_lsp.sumneko_lua.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					Lua = {
						workspace = {
							checkThirdParty = false,
						},
					},
				},
			})
		end,
		['texlab'] = function()
			-- local build_executable = 'tectonic'
			-- local build_args = {
			-- 	'-X',
			-- 	'compile',
			-- 	'%f',
			-- 	'--synctex',
			-- 	'--keep-logs',
			-- 	'--keep-intermediates',
			-- }
			local build_executable = 'latexmk'
			local build_args = {
				'-xelatex',
				-- '-verbose',
				'-synctex=1',
				'-interaction=nonstopmode',
				'%f',
			}

			local binary_path = fn.stdpath('data') .. '/lazy/nvim-texlabconfig/nvim-texlabconfig'
			local cache_root = fn.stdpath('cache')

			local forward_executable = 'sioyek'
			local forward_args = {
				'--inverse-search',
				binary_path .. ' -file %1 -line %2 -cache_root ' .. cache_root,
				'--reuse-window',
				'--forward-search-file',
				'%f',
				'--forward-search-line',
				'%l',
				'%p',
			}
			-- local forward_executable = '/Applications/Skim.app/Contents/SharedSupport/displayline'
			-- local forward_args = { '%l', '%p', '%f' }

			nvim_lsp.texlab.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = {
					texlab = {
						build = {
							executable = build_executable,
							args = build_args,
							-- forwardSearchAfter = true,
							onSave = true,
						},
						forwardSearch = {
							executable = forward_executable,
							args = forward_args,
						},
						-- chktex = {
						-- onOpenAndSave = true,
						-- },
						diagnostics = {
							ignoredPatterns = {
								'^Overfull',
								'^Underfull',
							},
						},
					},
				},
			})
		end
	})

	-- config sourcekit alone
	nvim_lsp.sourcekit.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
