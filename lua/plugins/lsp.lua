local M = {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'folke/neodev.nvim',
	},
	event = 'BufReadPre',
}

function M.config()
	local api, fn = vim.api, vim.fn
	local augroup = api.nvim_create_augroup
	local autocmd = api.nvim_create_autocmd
	local lsp = vim.lsp

	local on_attach = function(client, bufnr)
		vim.keymap.set('n', 'gD', lsp.buf.declaration, { buffer = bufnr, desc = 'Go to Declaration' })
		vim.keymap.set('n', 'gd', lsp.buf.definition, { buffer = bufnr, desc = 'Go to Definition' })
		vim.keymap.set('n', 'K', lsp.buf.hover, { buffer = bufnr, desc = 'Docs Hover' })
		vim.keymap.set('n', 'gi', lsp.buf.implementation, { buffer = bufnr, desc = 'Go to Implementation' })
		vim.keymap.set('n', '<C-k>', lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature' })
		vim.keymap.set('n', '<leader>rn', lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })
		vim.keymap.set('n', 'gr', lsp.buf.references, { buffer = bufnr, desc = 'Telescope References' })

		local caps = client.server_capabilities

		if caps.documentHighlightProvider then
			augroup('lsp_document_highlight', { clear = false })
			api.nvim_clear_autocmds({
				buffer = bufnr,
				group = 'lsp_document_highlight',
			})
			autocmd('CursorHold', {
				callback = lsp.buf.document_highlight,
				buffer   = bufnr,
				group    = 'lsp_document_highlight',
			})
			autocmd('CursorMoved', {
				callback = lsp.buf.clear_references,
				buffer   = bufnr,
				group    = 'lsp_document_highlight',
			})
		end

		-- if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
		-- 	local augroup = augroup('SemanticTokens', {})
		-- 	autocmd('TextChanged', {
		-- 		group = augroup,
		-- 		buffer = bufnr,
		-- 		callback = function()
		-- 			lsp.buf.semantic_tokens_full()
		-- 		end,
		-- 	})
		-- 	-- fire it first time on load as well
		-- 	lsp.buf.semantic_tokens_full()
		-- end

		if caps.codeActionProvider then
			vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
				require('lspsaga.codeaction'):code_action()
			end, { buffer = bufnr, desc = '(Range) Code Actions' })
		end

		if caps.documentFormattingProvider then
			vim.keymap.set('n', '<leader>lf', function()
				lsp.buf.format({ bufnr = bufnr, async = true })
			end, { buffer = bufnr, desc = 'Formmating' })
		end
		if caps.documentRangeFormattingProvider then
			vim.keymap.set('x', '<leader>lf', function()
				lsp.buf.format({ bufnr = bufnr, async = true })
			end, { buffer = bufnr, desc = 'Range Formmating' })
		end

		-- if caps.codeLensProvider then
		-- 	augroup('lsp_codelens', { clear = true })
		-- 	autocmd('BufEnter', {
		-- 		callback = require('lsp.codelens').refresh,
		-- 		buffer   = bufnr,
		-- 		group    = 'lsp_codelens',
		-- 		once     = true,
		-- 	})
		-- 	autocmd({ 'BufWritePost', 'CursorHold' }, {
		-- 		callback = require('lsp.codelens').refresh,
		-- 		buffer   = bufnr,
		-- 		group    = 'lsp_codelens',
		-- 	})
		-- end
	end

	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local nvim_lsp = require('lspconfig')

	require('neodev').setup()

	require('mason').setup({
		ui = { border = 'rounded' }
	})

	require('mason-lspconfig').setup()

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
						telemetry = {
							enable = false,
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
				'%p'
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
							args = forward_args
						},
						diagnostics = {
							ignoredPatterns = {
								'^Overfull',
								'^Underfull',
							}
						}
					},
				},
			})

			vim.keymap.set('n', '<M-b>', vim.cmd.TexlabBuild, { desc = 'Build LaTeX' })
			vim.keymap.set('n', '<M-f>', vim.cmd.TexlabForward, { desc = 'Forward Search' })
		end
	})

	-- config sourcekit alone
	nvim_lsp.sourcekit.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

return M
