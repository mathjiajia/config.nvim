require('packer').loader('cmp-nvim-lsp')

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

-- lsp info
vim.keymap.set('n', '<leader>li', function()
	require('lspconfig.ui.lspinfo')()
end, { desc = 'Lsp Info' })

local on_attach = function(client, bufnr)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Declaration' })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Docs Hover' })
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature' })
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = 'Add Workspace Folder' })
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

	vim.keymap.set('n', 'gd', function()
		require('telescope.builtin').lsp_definitions()
	end, { buffer = bufnr, desc = 'Definitions' })
	vim.keymap.set('n', 'gr', function()
		require('telescope.builtin').lsp_references()
	end, { buffer = bufnr, desc = 'References' })
	vim.keymap.set('n', 'gi', function()
		require('telescope.builtin').lsp_implementations()
	end, { buffer = bufnr, desc = 'Implementations' })
	vim.keymap.set('n', '<leader>so', function()
		require('telescope.builtin').lsp_document_symbols()
	end, { buffer = bufnr, desc = 'Document Symbols' })
	vim.keymap.set('n', '<leader>D', function()
		require('telescope.builtin').lsp_type_definitions()
	end, { buffer = bufnr, desc = 'Type Definitions' })

	if client.resolved_capabilities.document_highlight then
		vim.cmd(
			[[
				augroup lsp_document_highlight
					autocmd! * <buffer>
					autocmd CursorHold,CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
					autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
				augroup END
			]],
			false
		)
	end

	if client.resolved_capabilities.code_action then
		vim.keymap.set('n', '<leader>ca', function()
			require('telescope.builtin').lsp_code_actions()
		end, { buffer = bufnr, desc = 'Code Actions' })
		vim.keymap.set('v', '<leader>ca', function()
			require('telescope.builtin').lsp_range_code_actions()
		end, { buffer = bufnr, desc = 'Range Code Actions' })

		vim.cmd([[
			augroup lsp_code_action
				autocmd! * <buffer>
				autocmd CursorHold,CursorHoldI <buffer> lua require('nvim-lightbulb').update_lightbulb()
			augroup END
    ]])
	end

	if client.resolved_capabilities.document_formatting then
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, { buffer = bufnr, desc = 'Formmating' })
	end
	if client.resolved_capabilities.document_range_formatting then
		vim.keymap.set('v', '<leader>lf', vim.lsp.buf.range_formatting, { buffer = bufnr, desc = 'Range Formmating' })
	end

	require('aerial').on_attach(client, bufnr)
end

local null_on_attach = function(client, bufnr)
	if client.resolved_capabilities.document_formatting then
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, { buffer = bufnr, desc = 'Formmating' })
	end
	if client.resolved_capabilities.document_range_formatting then
		vim.keymap.set('v', '<leader>lf', vim.lsp.buf.range_formatting, { buffer = bufnr, desc = 'Range Formmating' })
	end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

for _, server in ipairs { 'pyright', 'sumneko_lua', 'texlab' } do
	require('lsp.' .. server).setup(on_attach, capabilities)
end
require('lsp.null-ls').setup(null_on_attach)
