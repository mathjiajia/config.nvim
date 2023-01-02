local M = {}

M.autoformat = false

function M.toggle()
	M.autoformat = not M.autoformat
	vim.notify(M.autoformat and 'Enabled format on save' or 'Disabled format on save')
end

function M.format()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.bo[buf].filetype
	local have_nls = #require('null-ls.sources').get_available(ft, 'NULL_LS_FORMATTING') > 0

	vim.lsp.buf.format({
		bufnr = buf,
		filter = function(client)
			if have_nls then
				return client.name == 'null-ls'
			end
			return client.name ~= 'null-ls'
		end,
	})
end

function M.on_attach(client, bufnr)
	local caps = client.server_capabilities
	-- document formatting
	if caps.documentFormattingProvider then
		vim.keymap.set('n', '<leader>lf', M.format, { buffer = bufnr, desc = 'Format Document' })
	end
	if caps.documentRangeFormattingProvider then
		vim.keymap.set('x', '<leader>lf', M.format, { buffer = bufnr, desc = 'Format Range' })
	end

	if client.supports_method('textDocument/formatting') then
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = vim.api.nvim_create_augroup('LspFormat.' .. bufnr, {}),
			buffer = bufnr,
			callback = function()
				if M.autoformat then
					M.format()
				end
			end,
		})
	end
end

return M
