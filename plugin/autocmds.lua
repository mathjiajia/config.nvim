vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group    = 'HighlightYank',
	desc     = 'Highlight the yanked text',
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

vim.api.nvim_create_augroup('mdtex', { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
	callback = function()
		vim.wo.conceallevel = 2
		vim.opt_local.spell = true
		vim.bo.spelllang = 'en_gb'
		vim.keymap.set('i', '<M-l>',
			'<C-g>u<Esc>[s1z=`]a<C-g>u',
			{ buffer = true, desc = 'Fix Last Miss-Spelling' })
	end,
	pattern  = { 'tex', 'markdown' },
	group    = 'mdtex',
})

vim.api.nvim_create_augroup('heirline', { clear = true })
vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
	callback = function()
		require 'heirline'.reset_highlights()
		require 'utils.status'
	end,
	group    = 'heirline',
})
