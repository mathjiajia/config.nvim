-- DIAGNOSTIC
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Float diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostics' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Loclist diagnostics' })

local signs = { Error = '', Warn = '', Info = '', Hint = '' }
for sign, icon in pairs(signs) do
	vim.fn.sign_define('DiagnosticSign' .. sign, {
		text = icon,
		texthl = 'Diagnostic' .. sign,
		linehl = false,
		numhl = 'Diagnostic' .. sign,
	})
end

local on_attach = function(client, bufnr)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Declaration' })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Docs Hover' })
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature' })
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, {
		buffer = bufnr,
		desc = 'Add Workspace Folder',
	})
	vim.keymap.set(
		'n',
		'<leader>wr',
		vim.lsp.buf.remove_workspace_folder,
		{ buffer = bufnr, desc = 'Remove Workspace Folder' }
	)
	vim.keymap.set('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { desc = 'List Workspace Folders' })
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })

	local tb = require('telescope.builtin')
	local themes = require('telescope.themes')

	vim.keymap.set('n', 'gd', function()
		tb.lsp_definitions(themes.get_dropdown {})
	end, { buffer = bufnr, desc = 'Go to Definitions' })
	vim.keymap.set('n', 'gr', function()
		tb.lsp_references(themes.get_dropdown {})
	end, { buffer = bufnr, desc = 'Go to References' })
	vim.keymap.set('n', 'gi', function()
		tb.lsp_implementations(themes.get_dropdown {})
	end, { buffer = bufnr, desc = 'Go to Implementations' })
	vim.keymap.set('n', '<leader>D', function()
		tb.lsp_type_definitions(themes.get_dropdown {})
	end, { buffer = bufnr, desc = 'Type Definitions' })

	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_create_augroup('lsp_document_highlight', { clear = true })
		vim.api.nvim_clear_autocmds { buffer = bufnr, group = 'lsp_document_highlight' }
		vim.api.nvim_create_autocmd('CursorHold', {
			callback = vim.lsp.buf.document_highlight,
			buffer = bufnr,
			group = 'lsp_document_highlight',
			desc = 'Document Highlight',
		})
		vim.api.nvim_create_autocmd('CursorMoved', {
			callback = vim.lsp.buf.clear_references,
			buffer = bufnr,
			group = 'lsp_document_highlight',
			desc = 'Clear All the References',
		})
	end

	if client.resolved_capabilities.code_action then
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Actions' })
		vim.keymap.set(
			'v',
			'<leader>ca',
			vim.lsp.buf.range_code_action,
			{ buffer = bufnr, desc = 'Range Code Actions' }
		)

		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			callback = function()
				require('nvim-lightbulb').update_lightbulb()
			end,
			buffer = bufnr,
			desc = 'Update the LightBulb',
		})
	end

	if client.resolved_capabilities.document_formatting then
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, { buffer = bufnr, desc = 'Formmating' })
	end
	if client.resolved_capabilities.document_range_formatting then
		vim.keymap.set('v', '<leader>lf', vim.lsp.buf.range_formatting, { buffer = bufnr, desc = 'Range Formmating' })
	end

	-- if client.resolved_capabilities.code_lens then
	-- 	vim.api.nvim_create_augroup('lsp_codelens', { clear = true })
	-- 	vim.api.nvim_create_autocmd('BufEnter', {
	-- 		callback = require('vim.lsp.codelens').refresh,
	-- 		buffer = bufnr,
	-- 		group = 'lsp_codelens',
	-- 		once = true,
	-- 		desc = 'Refresh CodeLens',
	-- 	})
	-- 	vim.api.nvim_create_autocmd({ 'BufWritePost', 'CursorHold' }, {
	-- 		callback = require('vim.lsp.codelens').refresh,
	-- 		buffer = bufnr,
	-- 		group = 'lsp_codelens',
	-- 		desc = 'Refresh CodeLens',
	-- 	})
	-- end

	require('aerial').on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs { 'pyright', 'sumneko_lua', 'texlab' } do
	require('lsp.' .. server).setup(on_attach, capabilities)
end
