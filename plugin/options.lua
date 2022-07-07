vim.opt.clipboard = 'unnamedplus'
vim.g.clipboard = {
	name          = 'macOS-clipboard',
	copy          = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
	paste         = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
	cache_enabled = 0,
}

vim.opt.undofile = true
vim.opt.autowrite = true
vim.opt.breakindent = true
vim.opt.cmdheight = 0
vim.opt.completeopt = 'menu,menuone,noselect'
vim.wo.cursorline = true
vim.o.ignorecase = true
vim.opt.laststatus = 3
vim.wo.linebreak = true
vim.o.mouse = 'n'
vim.wo.number = true
vim.opt.pumheight = 10
vim.wo.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showbreak = '> '
vim.opt.showmode = false
vim.wo.signcolumn = 'yes'
vim.o.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.bo.swapfile = false
vim.opt.tabstop = 4
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.writebackup = false

-- vim.g.theme_style = 'hard'
vim.cmd 'colorscheme mariana'

-- PACKER PLUGINS
vim.defer_fn(function()
	require 'plugins'
end, 1000)
