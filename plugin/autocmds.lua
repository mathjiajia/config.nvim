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

vim.api.nvim_create_augroup('auto_cursorline', { clear = true })
vim.api.nvim_create_autocmd({ 'WinEnter' }, {
	callback = function()
		vim.wo.cursorline = true
	end,
	group    = 'auto_cursorline',
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
	callback = function()
		vim.wo.cursorline = false
	end,
	group    = 'auto_cursorline',
})
vim.api.nvim_create_autocmd({ 'FileType' }, {
	callback = function()
		vim.wo.cursorline = false
	end,
	pattern  = 'TelescopePrompt',
	group    = 'auto_cursorline',
})

vim.api.nvim_create_augroup('heirline', { clear = true })
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
	callback = function()
		require 'heirline'.reset_highlights()
		require 'utils.status'
	end,
	group    = 'heirline',
})

vim.api.nvim_create_augroup('linenumber', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
	callback = function()
		vim.wo.relativenumber = false
		vim.wo.signcolumn = 'no'
	end,
	pattern  = { 'gitcommit', 'qf' },
	group    = 'linenumber',
})
