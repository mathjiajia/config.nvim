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
