local on_attach = function(client, bufnr)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'Declaration' })
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = 'Docs Hover' })
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature' })
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { buffer = bufnr, desc = 'Add Workspace Folder' })
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
		{ buffer = bufnr, desc = 'Remove Workspace Folder' })
	vim.keymap.set('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, { desc = 'List Workspace Folders' })
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename' })

	local tb = require 'telescope.builtin'
	local themes = require 'telescope.themes'

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

	if client.server_capabilities.documentHighlightProvider then
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

	if client.server_capabilities.codeActionProvider then
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr, desc = 'Code Actions' })
		vim.keymap.set('v', '<leader>ca', vim.lsp.buf.range_code_action, { buffer = bufnr, desc = 'Range Code Actions' })

		vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
			callback = function()
				require('nvim-lightbulb').update_lightbulb()
			end,
			buffer = bufnr,
		})
	end

	if client.server_capabilities.documentFormattingProvider then
		vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { buffer = bufnr, desc = 'Formmating' })
	end
	if client.server_capabilities.documentRangeFormattingProvider then
		vim.keymap.set('v', '<leader>lf', vim.lsp.buf.range_formatting, { buffer = bufnr, desc = 'Range Formmating' })
	end

	-- if client.server_capabilities.codeLensProvider then
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

	require('aerial').on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require 'lspconfig'

require('mason-lspconfig').setup {
	ensure_installed = { 'pyright', 'sumneko_lua', 'texlab' }
}
require('mason-lspconfig').setup_handlers {
	function(server_name)
		nvim_lsp[server_name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end,
	['sumneko_lua'] = function()
		nvim_lsp.sumneko_lua.setup(require('lua-dev').setup {
			lspconfig = {
				on_attach = on_attach,
				capabilities = capabilities,
			}
		})
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
						executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
						args = { '%l', '%p', '%f' },
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