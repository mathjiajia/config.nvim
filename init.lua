vim.loader.enable()

---------- LAZYINIT ----------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.uv.fs_stat(lazypath) then
-- 	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
-- 	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
-- end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = { import = "plugins" },
	ui = { border = "rounded" },
	change_detection = { notify = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"rplugin",
				"shada",
				"spellfile",
				"tarPlugin",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
