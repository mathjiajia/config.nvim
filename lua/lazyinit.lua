local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--branch=stable', -- remove this if you want to bootstrap to HEAD
		'https://github.com/folke/lazy.nvim.git',
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
	defaults = { lazy = true },
	ui = { border = 'rounded' },
})
