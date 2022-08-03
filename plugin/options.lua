vim.o.clipboard = 'unnamedplus'
vim.g.clipboard = {
	name          = 'macOS-clipboard',
	copy          = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
	paste         = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
	cache_enabled = 0,
}

vim.o.undofile = true
vim.o.autowrite = true
vim.o.breakindent = true
vim.o.cmdheight = 0
vim.o.completeopt = 'menu,menuone,noselect'
vim.wo.cursorline = true
vim.o.ignorecase = true
vim.o.laststatus = 3
vim.wo.linebreak = true
vim.wo.number = true
vim.o.pumheight = 10
vim.wo.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 4
vim.o.showbreak = '> '
vim.wo.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.bo.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.updatetime = 250
vim.o.whichwrap = 'b,s,<,>,[,]'
vim.o.writebackup = false

vim.g.theme_style = 'hard'
vim.cmd 'colorscheme gruvbox'
