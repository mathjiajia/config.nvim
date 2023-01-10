-- leader key
vim.g.mapleader = " "

-- misc
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Diff
-- vim.opt.diffopt:append("linematch:60")

-- Folding
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Spell
vim.o.spelllang = "en_gb"

-- Split
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.splitkeep = "screen"

-- State
vim.opt.swapfile = false
vim.opt.undofile = true

-- Tabs
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- Time
vim.opt.timeoutlen = 500
vim.opt.updatetime = 200

-- UI
vim.opt.cmdheight = 0
vim.opt.fillchars = { eob = " ", diff = " " }
vim.opt.laststatus = 3
vim.opt.pumheight = 10
vim.opt.scrolloff = 6
vim.opt.shortmess:append("c")
vim.opt.winblend = 10

-- vim.opt.cursorline = true
vim.opt.colorcolumn = "120"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
-- vim.opt.statuscolumn = "%=%l%s%C"

-- Wrap
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.showbreak = "> "
vim.opt.whichwrap:append("[,]")

-- Theme
vim.opt.termguicolors = true
vim.cmd.colorscheme("vscode")
