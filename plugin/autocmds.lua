local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text
augroup('HighlightYank', { clear = true })
autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group    = 'HighlightYank',
	desc     = 'Highlight the yanked text',
})

-- Opens PDF files in sioyek instead of viewing the binary in Neovim
local openPDF = augroup('openPDF', {})
autocmd('BufReadPost', {
	pattern = {
		'*.pdf',
	},
	callback = function()
		vim.fn.jobstart('/Applications/sioyek.app/Contents/MacOS/sioyek "' .. vim.fn.expand('%') .. '"', {
			detach = true,
		})
		vim.api.nvim_buf_delete(0, {})
	end,
	group = openPDF,
})
