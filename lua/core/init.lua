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
vim.opt.grepprg = 'rg --vimgrep -no-heading --smart-case --hidden'
vim.opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'

-- backups
vim.opt.autowrite = true
vim.opt.swapfile = false -- DO NOT Use a swapfile for the buffer
vim.opt.writebackup = false -- DO NOT Make a backup before overwriting a file
vim.o.undofile = true -- automatically saves undo history to an undo file when writing a buffer to a file,
-- and restores undo history from the same file on buffer read

vim.opt.shortmess = vim.opt.shortmess + { c = true } -- don't give |ins-completion-menu| messages
vim.opt.updatetime = 250

-- ui
vim.opt.breakindent = true
vim.wo.cursorline = true
vim.opt.linebreak = true -- wrap long lines at a character in 'breakat' rather than
-- at the last character that fits on the screen
vim.opt.fillchars = 'eob: ' -- Remove tilda from signcolumn
vim.wo.number = true
vim.opt.pumheight = 10 -- Maximum number of items to show in the popup menu
vim.wo.relativenumber = true
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor
vim.opt.showbreak = '↳ ' -- String to put at the start of lines that have been wrapped
vim.wo.signcolumn = 'yes' -- always to draw the signcolumn
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.whichwrap = 'b,s,h,l,<,>,[,]' -- move the cursor left/right to move to the previous/next line
-- when the cursor is on the first/last character in the line
vim.opt.termguicolors = true

---- KEYBINDINGS ----
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

-- hop
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hw', function()
	require('hop').hint_words()
end, { desc = 'Hop Words' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hl', function()
	require('hop').hint_lines()
end, { desc = 'Hop Lines' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>/', function()
	require('hop').hint_patterns()
end, { desc = 'Hop Patterns' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>1', function()
	require('hop').hint_char1()
end, { desc = 'Hop 1-char' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>2', function()
	require('hop').hint_char2()
end, { desc = 'Hop 2-char' })

vim.api.nvim_add_user_command('Files', function()
	require('telescope.builtin').find_files { hidden = true }
end, {})
vim.api.nvim_add_user_command('Grep', function()
	require('telescope.builtin').live_grep()
end, {})
vim.api.nvim_add_user_command('Oldfiles', function()
	require('telescope.builtin').oldfiles()
end, {})

---- THEMS & LINES ----
vim.cmd('colorscheme moon')
require('ui.buftab')
require('ui.status')

---- AUTOCOMMANDS ----
vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank {}
	end,
	pattern = '*',
	group = 'HighlightYank',
	desc = 'Highlight the yanked text',
})

local function lastplace()
	local function find_pattern_match(tbl, val)
		return next(vim.tbl_filter(function(pattern)
			return val:match(pattern)
		end, tbl))
	end

	if find_pattern_match({ '^help$', '^nofile$', '^quickfix$' }, vim.bo.buftype) then
		return
	end
	if find_pattern_match({ '^gitcommit$', '^gitrebase$' }, vim.bo.filetype) then
		vim.api.nvim_command([[normal! gg]])
		return
	end

	if vim.fn.line([['"]]) > 0 and vim.fn.line([['"]]) <= vim.fn.line('$') then
		if vim.fn.line('w$') == vim.fn.line('$') then
			vim.api.nvim_command([[normal! g`"]])
		elseif vim.fn.line('$') - vim.fn.line([['"]]) > ((vim.fn.line('w$') - vim.fn.line('w0')) / 2) - 1 then
			vim.api.nvim_command([[normal! g`"zz]])
		else
			vim.api.nvim_command([[normal! G'"<c-e>]])
		end
	end
	if vim.fn.foldclosed('.') ~= -1 then
		vim.api.nvim_command([[normal! zvzz]])
	end
end

local init_nvim = vim.api.nvim_create_augroup('init_nvim', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
	command = 'silent! lcd %:p:h',
	pattern = '*',
	group = init_nvim,
	desc = 'change the working directory',
})
vim.api.nvim_create_autocmd('BufReadPost', {
	callback = lastplace,
	pattern = '*',
	group = init_nvim,
	desc = 'restore the cursor position',
})
vim.api.nvim_create_autocmd('CursorHold', {
	callback = function()
		require('core.plugins')
	end,
	pattern = '*',
	group = init_nvim,
	once = true,
	desc = 'Load Packer',
})
