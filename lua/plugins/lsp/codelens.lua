local M = {}

function M.setup(client, bufnr)
	local api = vim.api
	local augroup = api.nvim_create_augroup
	local autocmd = api.nvim_create_autocmd

	local caps = client.server_capabilities

	if caps.codeLensProvider then
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
end

return M
