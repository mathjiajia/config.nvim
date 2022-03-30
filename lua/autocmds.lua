vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	pattern = '*',
	group = 'HighlightYank',
	desc = 'Highlight the yanked text',
})

vim.api.nvim_create_augroup('init_nvim', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
	command = 'silent! lcd %:p:h',
	pattern = '*',
	group = 'init_nvim',
	desc = 'change the working directory',
})
vim.api.nvim_create_autocmd('CursorHold', {
	callback = function()
		require('plugins')
	end,
	pattern = '*',
	group = 'init_nvim',
	once = true,
})

vim.api.nvim_create_augroup('auto_cursorline', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
	callback = function()
		vim.wo.cursorline = true
	end,
	pattern = '*',
	group = 'auto_cursorline',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
	callback = function()
		vim.wo.cursorline = false
	end,
	pattern = '*',
	group = 'auto_cursorline',
})
vim.api.nvim_create_autocmd({ 'FileType' }, {
	callback = function()
		vim.wo.cursorline = false
	end,
	pattern = 'TelescopePrompt',
	group = 'auto_cursorline',
})
