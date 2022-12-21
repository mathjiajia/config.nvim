local fn = vim.fn
local uv = vim.loop

local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not uv.fs_stat(lazypath) then
	fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'--single-branch',
		'https://github.com/folke/lazy.nvim.git',
		lazypath,
	})
end

vim.opt.runtimepath:prepend(lazypath)

-- load lazy
require('lazy').setup('plugins', {
	defaults = { lazy = true },
	-- checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				'gzip',
				'matchit',
				'matchparen',
				'netrwPlugin',
				'remote_plugins',
				'shada_plugin',
				'tarPlugin',
				'2html_plugin',
				'tutor',
				'zipPlugin',
			},
		},
	},
})
