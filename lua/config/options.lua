local opt = vim.opt

-- misc
opt.clipboard = "unnamedplus"
opt.confirm = true

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
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2

-- Time
opt.timeoutlen = 500
opt.updatetime = 200

-- UI
opt.cmdheight = 0
opt.fillchars = {
	diff = "╱",
	eob = " ",
	fold = " ",
	foldclose = "",
	foldopen = "",
	foldsep = " ",
}
opt.laststatus = 3
opt.pumheight = 10
opt.scrolloff = 5
opt.shortmess:append({ W = true, I = true, c = true })
opt.smoothscroll = true

opt.cursorline = true
opt.colorcolumn = { 120 }
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

-- folds
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = "v:lua.vim.treesitter.foldtext()"

-- Wrap
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "> "
opt.virtualedit = "block"
opt.whichwrap:append("[,]")

-- Theme
vim.cmd.colorscheme("vscode")
