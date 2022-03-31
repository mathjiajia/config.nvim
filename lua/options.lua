---- STOP LOADING BUILT IN PLUGINS ----
vim.g.loaded_gzip = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_zipPlugin = 1

vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

---- OPTIONS ----
vim.opt.clipboard = 'unnamedplus'
vim.g.clipboard = {
	name = 'macOS-clipboard',
	copy = { ['+'] = 'pbcopy', ['*'] = 'pbcopy' },
	paste = { ['+'] = 'pbpaste', ['*'] = 'pbpaste' },
	cache_enabled = 0,
}

vim.opt.undofile = true
vim.opt.autowrite = true
vim.opt.breakindent = true
vim.opt.completeopt = 'menu,menuone,noselect'
vim.wo.cursorline = true
vim.opt.fillchars = 'eob: '
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
vim.opt.ignorecase = true
vim.opt.laststatus = 3
vim.opt.linebreak = true
vim.opt.mouse = 'n'
vim.wo.number = true
vim.opt.pumheight = 10
vim.wo.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showbreak = '↳ '
vim.wo.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.updatetime = 250
vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.writebackup = false

vim.notify = require('notify')
vim.g.theme_style = 'hard'
vim.cmd('colorscheme gruvbox')
require('ui.buftabline')
require('ui.statusline')
