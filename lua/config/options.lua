local opt = vim.opt

-- misc
opt.clipboard = "unnamedplus"
opt.confirm = true

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- Diff
opt.diffopt:append({ linematch = 60 })

-- Format
opt.formatoptions = "tcroqnlj"

-- Search
opt.ignorecase = true
opt.smartcase = true

-- Spell
opt.spelllang = "en_gb"

-- Split
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- State
opt.swapfile = false
opt.undofile = true

-- Indent
-- opt.expandtab = false
opt.shiftwidth = 4
opt.softtabstop = 4
opt.tabstop = 4

-- Time
opt.timeoutlen = 500
opt.updatetime = 200

-- UI
opt.cmdheight = 0
opt.fillchars = { eob = " ", diff = " " }
opt.laststatus = 3
opt.pumheight = 10
opt.scrolloff = 6
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- opt.cursorline = true
opt.colorcolumn = "120"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

-- Wrap
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "> "
opt.whichwrap:append("[,]")

-- Theme
opt.termguicolors = true
vim.cmd.colorscheme("vscode")
