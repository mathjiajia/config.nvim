local opt = vim.opt

-- 1 important

-- 2 moving around, searching and patterns
opt.whichwrap:append("[,]")
opt.ignorecase = true
opt.smartcase = true

-- 3 tags

-- 4 displaying text
opt.smoothscroll = true
opt.scrolloff = 12
opt.linebreak = true
opt.breakindent = true
opt.showbreak = "> "
opt.fillchars = { diff = "╱", eob = " ", fold = " " }
opt.cmdheight = 0
opt.number = true
opt.relativenumber = true

-- 5 syntax, highlighting and spelling
opt.colorcolumn = "120"
opt.cursorline = true
opt.spelllang = "en_gb"

-- 6 multiple windows
opt.laststatus = 3
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true

-- 7 multiple tab pages

-- 8 terminal

-- 9 using the mouse

-- 10 messages and info
opt.shortmess:append({ W = true, I = true, c = true })
opt.confirm = true

-- 11 selecting text
opt.clipboard = "unnamedplus"

-- 12 editing text
opt.undofile = true
opt.formatoptions = "tcroqnlj"
opt.pumheight = 10

-- 13 tabs and indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

-- 14 folding
opt.foldlevel = 99
opt.foldtext = " "

-- 15 diff mode
opt.diffopt:append({ linematch = 60 })

-- 16 mapping
opt.timeoutlen = 500

-- 17 reading and writing files

-- 18 the swap file
opt.swapfile = false
opt.updatetime = 200

-- 19 command line editing

-- 20 executing external commands

-- 21 running make and jumping to errors (quickfix)

-- 22 language specific

-- 23 multi-byte characters

-- 24 various
opt.virtualedit = "block"
opt.signcolumn = "yes"

-- Remove "How-to disable mouse" from right-click menu
pcall(vim.cmd.aunmenu, [[PopUp.How-to\ disable\ mouse]])
pcall(vim.cmd.aunmenu, [[PopUp.-1-]])
