local on_attach = function(client, bufnr)
	vim.keymap.set(
		'n',
		'K',
		function()
			require('lspsaga.hover'):render_hover_doc()
		end,
		{ buffer = bufnr, desc = 'Docs Hover' }
	)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature' })
	vim.keymap.set(
		'n',
		'<leader>rn',
		function()
			require('lspsaga.rename'):lsp_rename()
		end,
		{ buffer = bufnr, desc = 'Rename' }
	)
	vim.keymap.set(
		'n',
		'gd',
		function()
			require('lspsaga.definition'):peek_definition()
		end,
		{ buffer = bufnr, desc = 'Go to Definition' }
	)
	vim.keymap.set(
		'n',
		'gh',
		function()
			require('lspsaga.finder'):lsp_finder()
		end,
		{ buffer = bufnr, desc = 'Telescope References' }
	)
	vim.keymap.set(
		'n',
		'gr',
		require('telescope.builtin').lsp_references,
		{ buffer = bufnr, desc = 'Telescope References' }
	)

	local caps = client.server_capabilities

	if caps.documentHighlightProvider then
		vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
		vim.api.nvim_clear_autocmds({
			buffer = bufnr,
			group = 'lsp_document_highlight',
		})
		vim.api.nvim_create_autocmd('CursorHold', {
			callback = vim.lsp.buf.document_highlight,
			buffer   = bufnr,
			group    = 'lsp_document_highlight',
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			callback = vim.lsp.buf.clear_references,
			buffer   = bufnr,
			group    = 'lsp_document_highlight',
		})
	end

	-- if caps.semanticTokensProvider and caps.semanticTokensProvider.full then
	-- 	local augroup = vim.api.nvim_create_augroup('SemanticTokens', {})
	-- 	vim.api.nvim_create_autocmd('TextChanged', {
	-- 		group = augroup,
	-- 		buffer = bufnr,
	-- 		callback = function()
	-- 			vim.lsp.buf.semantic_tokens_full()
	-- 		end,
	-- 	})
	-- 	-- fire it first time on load as well
	-- 	vim.lsp.buf.semantic_tokens_full()
	-- end

	if caps.codeActionProvider then
		vim.keymap.set(
			{ 'n', 'x' },
			'<leader>ca',
			function()
				require('lspsaga.codeaction'):code_action()
			end,
			{ buffer = bufnr, desc = '(Range) Code Actions' }
		)
	end

	if caps.documentFormattingProvider then
		vim.keymap.set(
			'n',
			'<leader>lf',
			function()
				vim.lsp.buf.format({ bufnr = bufnr, async = true })
			end,
			{ buffer = bufnr, desc = 'Formmating' }
		)
	end
	if caps.documentRangeFormattingProvider then
		vim.keymap.set(
			'x',
			'<leader>lf',
			function()
				vim.lsp.buf.format({ bufnr = bufnr, async = true })
			end,
			{ buffer = bufnr, desc = 'Range Formmating' }
		)
	end

	-- if caps.codeLensProvider then
	-- 	vim.api.nvim_create_augroup('lsp_codelens', { clear = true })
	-- 	vim.api.nvim_create_autocmd('BufEnter', {
	-- 		callback = require('vim.lsp.codelens').refresh,
	-- 		buffer   = bufnr,
	-- 		group    = 'lsp_codelens',
	-- 		once     = true,
	-- 	})
	-- 	vim.api.nvim_create_autocmd({ 'BufWritePost', 'CursorHold' }, {
	-- 		callback = require('vim.lsp.codelens').refresh,
	-- 		buffer   = bufnr,
	-- 		group    = 'lsp_codelens',
	-- 	})
	-- end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local nvim_lsp = require('lspconfig')

require('neodev').setup()

require('mason').setup()
require('mason-lspconfig').setup()

local binary_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/nvim-texlabconfig/nvim-texlabconfig'
local cache_root = vim.fn.stdpath('cache')

local executable = '/Applications/sioyek.app/Contents/MacOS/sioyek'
local args = {
	'--inverse-search',
	binary_path .. ' -file %1 -line %2 -cache_root ' .. cache_root,
	'--reuse-instance',
	'--forward-search-file',
	'%f',
	'--forward-search-line',
	'%l',
	'%p'
}
-- local executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
-- local args = { '%l', '%p', '%f' },

require('mason-lspconfig').setup_handlers {
	function(server_name)
		nvim_lsp[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
	['sumneko_lua'] = function()
		nvim_lsp.sumneko_lua.setup {
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
		}
	end,
	['texlab'] = function()
		nvim_lsp.texlab.setup {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				texlab = {
					build = {
						args = {
							'-xelatex',
							-- '-verbose',
							'-synctex=1',
							'-interaction=nonstopmode',
							'%f',
						},
						-- forwardSearchAfter = true,
						-- onSave = false,
					},
					forwardSearch = {
						executable = executable,
						args = args
					},
				},
			},
		}
	end
}

-- config sourcekit alone
nvim_lsp.sourcekit.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
