local o = vim.opt

-- leader key
vim.g.mapleader = " "

-- global
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 0
vim.o.confirm = true
vim.o.fillchars = "eob: ,diff: "
vim.o.grepformat = "%f:%l:%c:%m"
vim.o.grepprg = "rg --vimgrep"
vim.o.laststatus = 3
vim.o.pumheight = 10
vim.o.scrolloff = 6
vim.o.showbreak = "> "
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.splitkeep = "screen"
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.updatetime = 200

-- opt
o.diffopt:append("linematch:60")
o.shortmess:append("IcC")
o.whichwrap:append("[,]")

-- Completion
vim.o.completeopt = "menu,menuone,noselect"

-- Search
vim.o.ignorecase = true
-- vim.o.hlsearch = false
vim.o.smartcase = true

-- Session
vim.o.sessionoptions = "buffers,curdir,tabpages,winsize"

-- local to buffer
vim.bo.smartindent = true
vim.bo.spelllang = "en_gb"
vim.bo.swapfile = false
vim.bo.undofile = true

-- Tabs
vim.bo.expandtab = true -- Use spaces instead of tabs
vim.bo.smartindent = true
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.tabstop = 2

-- local to window
vim.wo.breakindent = true
vim.wo.colorcolumn = "120"
vim.wo.cursorline = true
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldenable = false
vim.wo.linebreak = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"

-- Theme
vim.cmd.colorscheme("catppuccin")
