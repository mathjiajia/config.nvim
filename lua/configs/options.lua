local o = vim.opt

-- global
vim.o.clipboard = 'unnamedplus'
vim.o.cmdheight = 0
vim.o.fillchars = 'eob: ,diff: '
vim.o.laststatus = 3
vim.o.pumheight = 10
vim.o.scrolloff = 6
vim.o.showbreak = '> '
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = 'screen'
vim.o.termguicolors = true
vim.o.updatetime = 200

-- opt
o.diffopt:append('linematch:60')
o.shortmess:append('c')
o.whichwrap:append('[,]')

-- Completion
vim.opt.completeopt = 'menu,menuone,noselect'

-- Search
vim.o.ignorecase = true
-- vim.o.hlsearch = false
vim.o.smartcase = true

-- Tabs
local indent = 4
vim.o.shiftwidth = indent
vim.o.softtabstop = indent
vim.o.tabstop = indent

-- local to buffer
vim.bo.smartindent = true
vim.bo.spelllang = 'en_gb'
vim.bo.swapfile = false
vim.bo.undofile = true

-- local to window
vim.wo.breakindent = true
vim.wo.colorcolumn = '120'
vim.wo.cursorline = true
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldenable = false
vim.wo.linebreak = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = 'yes'

-- Theme
vim.cmd.colorscheme('vscode')
