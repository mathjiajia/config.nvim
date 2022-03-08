require('ui.buftab')
require('ui.status')

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

if 'Plugins' then
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

	augroup('init_nvim', { clear = true })

	-- Plugins are 'start' plugins so are loaded automatically, but to enable packer
	-- commands we need to require plugins at some point
	-- autocmd('CursorHold', {
	-- 	callback = function()
	-- 		require('core.plugins')
	-- 	end,
	-- 	pattern = '*',
	-- 	group = 'init_nvim',
	-- 	once = true,
	-- 	desc = 'Load Packer',
	-- })
	require('core.plugins')
end

if 'Options' then
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
	vim.opt.shiftwidth = 4
	vim.opt.smartindent = true
	vim.opt.softtabstop = 4
	vim.opt.tabstop = 4

	-- search
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.grepprg = 'rg --vimgrep -no-heading --smart-case --hidden'
	vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'

	-- backups
	vim.opt.autowrite = true -- Write the contents of the file, if it has been modified
	vim.opt.swapfile = false -- DO NOT Use a swapfile for the buffer
	vim.opt.writebackup = false -- DO NOT Make a backup before overwriting a file
	vim.o.undofile = true -- automatically saves undo history to an undo file when writing a buffer to a file,
	-- and restores undo history from the same file on buffer read

	-- force the user to select one from the menu
	vim.opt.shortmess = vim.opt.shortmess + { c = true } -- don't give |ins-completion-menu| messages

	-- perfomance
	vim.opt.updatetime = 250

	-- ui
	vim.opt.breakindent = true
	vim.wo.cursorline = true -- Highlight the text line of the cursor
	-- vim.opt.guifont = 'MesloLGS Nerd Font:h18'
	vim.opt.linebreak = true -- wrap long lines at a character in 'breakat' rather than
	-- at the last character that fits on the screen
	vim.opt.fillchars = 'eob: ' -- Remove tilda from signcolumn
	vim.wo.number = true
	vim.opt.pumheight = 10 -- Maximum number of items to show in the popup menu
	vim.wo.relativenumber = true
	vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
	vim.opt.showbreak = '↳ ' -- String to put at the start of lines that have been wrapped
	vim.wo.signcolumn = 'yes' -- always to draw the signcolumn
	vim.opt.splitbelow = true -- splitting a window will put the new window below the current one
	vim.opt.splitright = true -- splitting a window will put the new window right of the current one
	vim.opt.whichwrap = 'b,s,h,l,<,>,[,]' -- move the cursor left/right to move to the previous/next line
	-- when the cursor is on the first/last character in the line

	-- theme and UI
	vim.opt.termguicolors = true -- Enables 24-bit RGB color in the |TUI|
end

if 'Mappings' then
	--use comma as leader key
	vim.g.mapleader = ','

	-- cursor movements
	vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to Left Window' })
	vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to Right Window' })
	vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to Bottom Window' })
	vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to Upper Window' })
	--Remap for dealing with word wrap
	vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, desc = 'Move Cursor Down' })
	vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, desc = 'Move Cursor Up' })
	-- buffer navigation
	vim.keymap.set('n', '<leader>bp', '<Cmd>bprev<CR>', { desc = 'Previous Buffer' })
	vim.keymap.set('n', '<leader>bn', '<Cmd>bnext<CR>', { desc = 'Next Buffer' })
	-- Insert
	vim.keymap.set('i', '<C-f>', '<Right>', { desc = 'Move Forward a Char' })
	vim.keymap.set('i', '<C-b>', '<Left>', { desc = 'Move Backward a Char' })

	vim.keymap.set({ 'n', 't' }, '<M-i>', function()
		require('packer').loader('FTerm.nvim')
		require('FTerm').toggle()
	end, { desc = 'Terminal Toggle' })

	vim.keymap.set('n', '<M-g>', function()
		require('packer').loader('FTerm.nvim')
		require('FTerm'):new({ cmd = 'lazygit', dimensions = { height = 0.9, width = 0.9 } }):open()
	end, { desc = 'LazyGit' })

	vim.keymap.set('n', '<M-o>', function()
		require('packer').loader('symbols-outline.nvim')
		require('symbols-outline').toggle_outline()
	end, { desc = 'Symbols Outline' })
end

vim.cmd('colorscheme moon')

augroup('HighlightYank', { clear = true })
autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank {}
	end,
	pattern = '*',
	group = 'HighlightYank',
	desc = 'Highlight the yanked text',
})

autocmd('BufEnter', {
	command = 'silent! lcd %:p:h',
	pattern = '*',
	group = 'init_nvim',
	desc = 'change the working directory',
})

require('core.autocmd')

-- COMMANDS -------------------------------------------------
vim.api.nvim_add_user_command('Files', function()
	require('telescope.builtin').find_files { hidden = true }
end, {})
vim.api.nvim_add_user_command('Grep', function()
	require('telescope.builtin').live_grep()
end, {})
vim.api.nvim_add_user_command('Oldfiles', function()
	require('telescope.builtin').oldfiles()
end, {})
