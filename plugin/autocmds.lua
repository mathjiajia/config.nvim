vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group    = 'HighlightYank',
	desc     = 'Highlight the yanked text',
})

vim.api.nvim_create_augroup('init_nvim', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
	command = 'silent! lcd %:p:h',
	group   = 'init_nvim',
	desc    = 'change the working directory',
})

vim.api.nvim_create_augroup('heirline', { clear = true })
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
	callback = function()
		require 'heirline'.reset_highlights()
		require 'lines.status'
	end,
	group    = 'heirline',
})
