-- Stop loading built in plugins
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.python3_host_prog = '/usr/local/bin/python3'

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

--use comma as leader key
vim.g.mapleader = ','

-- misc
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'

vim.g.clipboard = { -- clipboard
	name = 'macOS-clipboard',
	copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
	paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
	cache_enabled = 0,
}

-- indention & tab
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

-- search
vim.opt.history = 2000
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.grepprg = 'rg --vimgrep -no-heading --smart-case --hidden'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- ui
vim.opt.breakindent = true
vim.wo.cursorline = true -- Highlight the text line of the cursor
-- vim.opt.guifont = 'MesloLGS Nerd Font:h18'
vim.opt.linebreak = true -- wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen
vim.opt.fillchars = 'eob: ' -- Remove tilda from signcolumn
vim.wo.number = true
vim.opt.pumheight = 10 -- Maximum number of items to show in the popup menu
vim.wo.relativenumber = true
vim.opt.scrolloff = 5 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.showbreak = '↳ ' -- String to put at the start of lines that have been wrapped
vim.opt.showmode = false
vim.wo.signcolumn = 'yes' -- always to draw the signcolumn
vim.opt.splitbelow = true -- splitting a window will put the new window below the current one
vim.opt.splitright = true -- splitting a window will put the new window right of the current one
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]' -- move the cursor left/right to move to the previous/next line when the cursor is on the first/last character in the line

-- backups
vim.opt.autowrite = true -- Write the contents of the file, if it has been modified
vim.opt.swapfile = false -- DO NOT Use a swapfile for the buffer
vim.opt.writebackup = false -- DO NOT Make a backup before overwriting a file
vim.o.undofile = true -- automatically saves undo history to an undo file when writing a buffer to a file, and restores undo history from the same file on buffer read

-- autocomplete
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Do not select a match in the menu, force the user to select one from the menu
vim.opt.shortmess = vim.opt.shortmess + { c = true } -- don't give |ins-completion-menu| messages

-- perfomance
vim.opt.updatetime = 500

-- theme
vim.opt.termguicolors = true -- Enables 24-bit RGB color in the |TUI|
vim.cmd('colorscheme moon')
