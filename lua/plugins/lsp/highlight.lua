local M = {}

---@param client table
---@param bufnr integer
function M.on_attach(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_augroup("lsp_document_highlight", {})
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			callback = vim.lsp.buf.document_highlight,
			group = "lsp_document_highlight",
			buffer = bufnr,
		})
		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			callback = vim.lsp.buf.clear_references,
			group = "lsp_document_highlight",
			buffer = bufnr,
		})
	end
end

return M
