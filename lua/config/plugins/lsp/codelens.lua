local M = {}

function M.setup(bufnr)
	local api = vim.api
	local augroup = api.nvim_create_augroup
	local autocmd = api.nvim_create_autocmd

	augroup('lsp_codelens', { clear = true })
	autocmd('BufEnter', {
		callback = require('lsp.codelens').refresh,
		buffer   = bufnr,
		group    = 'lsp_codelens',
		once     = true,
	})
	autocmd({ 'BufWritePost', 'CursorHold' }, {
		callback = require('lsp.codelens').refresh,
		buffer   = bufnr,
		group    = 'lsp_codelens',
	})
end

return M
