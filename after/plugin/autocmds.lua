local api, fn = vim.api, vim.fn
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

-- Highlight yanked text
augroup('HighlightYank', { clear = true })
autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = 'HighlightYank',
	desc = 'Highlight the yanked text',
})

-- Opens PDF files in sioyek instead of viewing the binary in Neovim
local openPDF = augroup('openPDF', {})
autocmd('BufReadPost', {
	pattern = '*.pdf',
	callback = function()
		fn.jobstart('sioyek "' .. fn.expand('%') .. '"', { detach = true })
		api.nvim_buf_delete(0, {})
	end,
	group = openPDF,
})
