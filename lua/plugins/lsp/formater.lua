local M = {}

function M.setup(client, bufnr)
	local lsp = vim.lsp
	local caps = client.server_capabilities

	if caps.documentFormattingProvider then
		vim.keymap.set('n', '<leader>lf', function()
			lsp.buf.format({ bufnr = bufnr, async = true })
		end, { buffer = bufnr, desc = 'Formmating' })
	end
	if caps.documentRangeFormattingProvider then
		vim.keymap.set('x', '<leader>lf', function()
			lsp.buf.format({ bufnr = bufnr, async = true })
		end, { buffer = bufnr, desc = 'Range Formmating' })
	end
end

return M
