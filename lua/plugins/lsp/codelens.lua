local M = {}

---@param client table
---@param bufnr integer
function M.on_attach(client, bufnr)
	if client.server_capabilities.codeLensProvider then
		vim.api.nvim_create_augroup('lsp_document_codelens', {})
		vim.api.nvim_create_autocmd('BufEnter', {
			callback = vim.lsp.codelens.refresh,
			buffer = bufnr,
			group = 'lsp_document_codelens',
			once = true,
		})
		vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufWritePost', 'CursorHold' }, {
			callback = vim.lsp.codelens.refresh,
			buffer = bufnr,
			group = 'lsp_document_codelens',
		})
	end
end

return M
