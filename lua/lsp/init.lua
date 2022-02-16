require('packer').loader('cmp-nvim-lsp')

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
-- 'pyright', 'sumneko_lua', 'texlab'
-- local servers = { 'taplo' }

-- lsp info
vim.keymap.set('n', '<leader>li', function()
	require('lspconfig.ui.lspinfo')()
end, { desc = 'Lsp Info' })

local on_attach = function(client, bufnr)
	local function map(mode, key, fun, opts)
		opts = opts or {}
		opts.buffer = bufnr
		opts.silent = true
		vim.keymap.set(mode, key, fun, opts)
	end

	map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Declaration' })
	map('n', 'K', vim.lsp.buf.hover, { desc = 'Docs Hover' })
	map('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Signature' })
	map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add Workspace Folder' })
	map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove Workspace Folder' })
	map('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { desc = 'List Workspace Folders' })
	map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })

	map('n', 'gd', function()
		require('telescope.builtin').lsp_definitions()
	end, { desc = 'Definitions' })
	map('n', 'gr', function()
		require('telescope.builtin').lsp_references()
	end, { desc = 'References' })
	map('n', 'gi', function()
		require('telescope.builtin').lsp_implementations()
	end, { desc = 'Implementations' })
	map('n', '<leader>so', function()
		require('telescope.builtin').lsp_document_symbols()
	end, { desc = 'Document Symbols' })
	map('n', '<leader>D', function()
		require('telescope.builtin').lsp_type_definitions()
	end, { desc = 'Type Definitions' })

	if client.resolved_capabilities.document_formatting then
		map('n', '<leader>lf', vim.lsp.buf.formatting, { desc = 'Formmating' })
	end
	if client.resolved_capabilities.document_range_formatting then
		map('v', '<leader>lf', vim.lsp.buf.range_formatting, { desc = 'Range Formmating' })
	end

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
		map('n', '<leader>ca', function()
			require('telescope.builtin').lsp_code_actions()
		end, { desc = 'Code Actions' })
		map('v', '<leader>ca', function()
			require('telescope.builtin').lsp_range_code_actions()
		end, { desc = 'Range Code Actions' })

		vim.cmd([[
				augroup lsp_code_action
					autocmd! * <buffer>
					autocmd CursorHold,CursorHoldI <buffer> lua require('nvim-lightbulb').update_lightbulb()
				augroup END
      ]])
	end

	require('aerial').on_attach(client, bufnr)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Enable the following language servers
-- for _, lsp in ipairs(servers) do
-- 	lspconfig[lsp].setup {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 		flags = {
-- 			debounce_text_changes = 150,
-- 		},
-- 	}
-- end

for _, server in
	ipairs {
		'null-ls',
		'pyright',
		'sumneko_lua',
		'texlab',
	}
do
	require('lsp.' .. server).setup(on_attach, capabilities)
end

-- suppress lspconfig messages
local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match('%[lspconfig%]') then
		return
	end
	notify(msg, ...)
end
