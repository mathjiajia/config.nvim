local function map(mode, key, fun, opts)
	vim.keymap.set(mode, key, fun, opts)
end
local function nmap(key, fun, opts)
	vim.keymap.set('n', key, fun, opts)
end
local function nmap_cmd(key, fun, opts)
	local rhs = string.format('<Cmd>%s<CR>', fun)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set('n', key, rhs, opts)
end

-- Normal
nmap_cmd('<M-q>', 'quit', { silent = false, desc = 'Write and Quit' })
nmap_cmd('<M-S-q>', 'quit!', { silent = false, desc = 'Force Quit' })
-- resize
nmap_cmd('<M-[>', 'vertical resize -5', { desc = 'Width -5' })
nmap_cmd('<M-]>', 'vertical resize +5', { desc = 'Width +5' })
nmap_cmd('<M-;>', 'resize -2', { desc = 'Height -2' })
nmap_cmd("<M-'>", 'resize +2', { desc = 'Height +2' })
-- fixlist
nmap_cmd('<leader>xl', 'lopen', { desc = 'Open Location List' })
nmap_cmd('<leader>xq', 'copen', { desc = 'Open Quickfix List' })
-- cursor movements
nmap('<M-h>', '<C-w>h', { desc = 'Move to Left Window' })
nmap('<M-l>', '<C-w>l', { desc = 'Move to Right Window' })
nmap('<M-j>', '<C-w>j', { desc = 'Move to Bottom Window' })
nmap('<M-k>', '<C-w>k', { desc = 'Move to Upper Window' })
--Remap for dealing with word wrap
nmap('k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = 'Move Cursor Down' })
nmap('j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = 'Move Cursor Up' })
-- Insert
map('i', '<C-a>', '<ESC>^i', { silent = true, desc = 'Move to the beginning of line' })
map('i', '<C-f>', '<Right>', { silent = true, desc = 'Move forward a character' })
map('i', '<C-b>', '<Left>', { silent = true, desc = 'Move back a character' })
-- Command line
map('c', '<C-t>', '<C-R>=expand("%:p:h") . "/" <CR>', { desc = 'Expand Current Path' })
-- Visual
map('v', '<', '<gv', { desc = 'Shift Text Left' })
map('v', '>', '>gv', { desc = 'Shift Text Right' })

-- Diagnostic
map('n', '<leader>e', vim.diagnostic.open_float, { silent = true, desc = 'Float diagnostics' })
map('n', '[d', vim.diagnostic.goto_prev, { silent = true, desc = 'Previous diagnostics' })
map('n', ']d', vim.diagnostic.goto_next, { silent = true, desc = 'Next diagnostics' })
map('n', '<leader>q', vim.diagnostic.setloclist, { silent = true, desc = 'Loclist diagnostics' })

-- Aerial
nmap_cmd('<M-o>', 'AerialToggle', { silent = true, desc = 'Aerial code outline' })

-- stylua: ignore
-- hop
map({ 'n', 'x', 'o' }, '<leader>hw', function() 				require('hop').hint_lines()
end, { desc = 'Hop Words' })
map({ 'n', 'x', 'o' }, '<leader>hl', function()
	require('hop').hint_lines()
end, { desc = 'Hop Lines' })
map({ 'n', 'x', 'o' }, '<leader>h/', function()
	require('hop').hint_patterns()
end, { desc = 'Hop Patterns' })
map({ 'n', 'x', 'o' }, '<leader>h1', function()
	require('hop').hint_char1()
end, { desc = 'Hop 1-char' })
map({ 'n', 'x', 'o' }, '<leader>h2', function()
	require('hop').hint_char2()
end, { desc = 'Hop 2-char' })

-- nvim-tree
nmap('<M-t>', function()
	require('nvim-tree').toggle(false)
end, { desc = 'NvimTree Toggle' })
nmap('<M-r>', function()
	require('nvim-tree.lib').refresh_tree()
end, { desc = 'NvimTree Refresh' })

-- Packer
nmap('<leader>pc', function()
	require('packer').clean()
end, { desc = 'Packer Clean' })
nmap_cmd('<leader>ps', 'PackerSync', { desc = 'Packer Sync' })
nmap('<leader>pS', function()
	require('packer').status()
end, { desc = 'Packer Status' })
nmap_cmd('<leader>pu', 'PackerUpdate', { desc = 'Packer Update' })

-- session
nmap('<leader>sd', function()
	require('session_manager.commands').run_command('delete_session')
end, { desc = 'Select and delete session' })
nmap('<leader>sl', function()
	require('session_manager.commands').run_command('load_last_session')
end, { desc = 'Restore last session' })
nmap('<leader>sr', function()
	require('session_manager.commands').run_command('load_session')
end, { desc = 'Select and load session' })
nmap('<leader>ss', function()
	require('session_manager.commands').run_command('save_current_session')
end, { desc = 'Save current session' })

-- Spectre
nmap('<leader>S', function()
	require('spectre').open()
end, { silent = true, desc = 'Open Spectre' })
nmap('<leader>sw', function()
	require('spectre').open_visual { select_word = true }
end, { silent = true, desc = 'search current word' })
map('v', '<leader>sw', function()
	require('spectre').open_visual()
end, { silent = true, desc = 'search current word' })
nmap(
	'<leader>sp',
	'viw:lua require("spectre").open_file_search()<CR>',
	{ silent = true, desc = 'search in current file' }
)

-- Telescope
nmap('<leader><space>', function()
	require('telescope.builtin').buffers()
end, { silent = true, desc = 'Buffers' })
nmap('<leader>fd', function()
	require('telescope.builtin').grep_string()
end, { silent = true, desc = 'Grep Strings' })
nmap('<leader>ff', function()
	require('telescope.builtin').find_files { hidden = true }
end, { silent = true, desc = 'Find Files' })
nmap('<leader>fg', function()
	require('telescope.builtin').live_grep()
end, { silent = true, desc = 'Live Grep' })
nmap('<leader>fh', function()
	require('telescope.builtin').help_tags()
end, { silent = true, desc = 'Help Tags' })
nmap('<leader>fk', function()
	require('telescope.builtin').keymaps()
end, { silent = true, desc = 'Keymaps' })
nmap('<leader>fl', function()
	require('telescope.builtin').highlights()
end, { desc = 'Highlight Groups' })
nmap('<leader>fo', function()
	require('telescope.builtin').oldfiles()
end, { silent = true, desc = 'Old Files' })
nmap('<leader>fs', function()
	require('telescope.builtin').current_buffer_fuzzy_find()
end, { silent = true, desc = 'Current Buffer Fuzzy Find' })
nmap('<leader>ft', function()
	require('telescope.builtin').tags()
end, { silent = true, desc = 'Tags' })

nmap('<leader>fb', function()
	require('telescope').extensions.file_browser.file_browser {}
end, { silent = true, desc = 'File Browser' })
-- nmap('<leader>fc', function()
-- 	require('telescope').extensions.bibtex.bibtex {}
-- end, { silent = true, desc = 'bibtex' })
nmap('<leader>fp', function()
	require('telescope').extensions.project.project {}
end, { silent = true, desc = 'Projects' })
nmap('<leader>fr', function()
	require('telescope').extensions.frecency.frecency {}
end, { silent = true, desc = 'Frecency' })
