local M = {}

function M.setup(bufnr)
	local api, lsp = vim.api, vim.lsp
	local augroup = api.nvim_create_augroup
	local autocmd = api.nvim_create_autocmd

	augroup('lsp_document_highlight', { clear = false })
	api.nvim_clear_autocmds({
		buffer = bufnr,
		group = 'lsp_document_highlight',
	})
	autocmd('CursorHold', {
		callback = lsp.buf.document_highlight,
		buffer = bufnr,
		group = 'lsp_document_highlight',
	})
	autocmd('CursorMoved', {
		callback = lsp.buf.clear_references,
		buffer = bufnr,
		group = 'lsp_document_highlight',
	})
end

return M
