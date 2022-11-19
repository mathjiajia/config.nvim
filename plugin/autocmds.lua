local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('HighlightYank', { clear = true })
autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group    = 'HighlightYank',
	desc     = 'Highlight the yanked text',
})

autocmd('FileType', {
	callback = function()
		vim.keymap.set('n', 'q', '<Cmd>close<CR>', { buffer = true, silent = true })
		vim.keymap.set('n', '<Esc>', '<Cmd>close<CR>', { buffer = true, silent = true })
	end,
	pattern = { 'help', 'man', 'qf', 'tsplaygound' }
})
