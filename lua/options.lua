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
vim.g.loaded_python3_provider = 0
-- vim.g.python3_host_prog = '/usr/local/bin/python3'

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

---- OPTIONS ----
vim.opt.clipboard = 'unnamedplus'
vim.opt.mouse = 'a'
vim.g.clipboard = {
	name = 'macOS-clipboard',
	copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
	paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
	cache_enabled = 0,
}

-- indention & tab
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- backups
vim.opt.autowrite = true
vim.opt.swapfile = false
vim.opt.writebackup = false
vim.o.undofile = true

-- performance
vim.opt.updatetime = 250

-- ui
vim.opt.breakindent = true
-- vim.wo.cursorline = true
vim.opt.fillchars = 'eob: '
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.pumheight = 10
vim.opt.scrolloff = 8
vim.opt.showbreak = '↳ '
vim.wo.signcolumn = 'yes'
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.whichwrap = 'b,s,<,>,[,]'

---- THEMS & LINES ----
-- vim.cmd('colorscheme moon')
-- vim.cmd('colorscheme gruvbox')
-- vim.cmd('colorscheme sonokai')
require('my_colors').init()
-- require('ui.buftab')
-- require('ui.status')
require('ui.buftabline')
require('ui.statusline')
