-- Normal
vim.keymap.set('n', '<Cmd><M-q><CR>', 'quit', { desc = 'Write and Quit' })
vim.keymap.set('n', '<Cmd><M-S-q><CR>', 'quit!', { desc = 'Force Quit' })
-- fixlist
vim.keymap.set('n', '<leader>xl', '<Cmd>lopen<CR>', { desc = 'Open Location List' })
vim.keymap.set('n', '<leader>xq', '<Cmd>copen<CR>', { desc = 'Open Quickfix List' })
-- cursor movements
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to Left Window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to Right Window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to Bottom Window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to Upper Window' })
--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = 'Move Cursor Down' })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = 'Move Cursor Up' })
-- Insert
vim.keymap.set('i', '<C-a>', '<ESC>^i', { desc = 'Move to the beginning of line' })
vim.keymap.set('i', '<C-f>', '<Right>', { desc = 'Move forward a character' })
vim.keymap.set('i', '<C-b>', '<Left>', { desc = 'Move back a character' })

-- Diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Float diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostics' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Loclist diagnostics' })

-- Aerial
vim.keymap.set('n', '<M-o>', '<Cmd>AerialToggle<CR>', { desc = 'Aerial code outline' })

-- hop
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hw', function()
	require('hop').hint_words()
end, { desc = 'Hop Words' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hl', function()
	require('hop').hint_lines()
end, { desc = 'Hop Lines' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h/', function()
	require('hop').hint_patterns()
end, { desc = 'Hop Patterns' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h1', function()
	require('hop').hint_char1()
end, { desc = 'Hop 1-char' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h2', function()
	require('hop').hint_char2()
end, { desc = 'Hop 2-char' })

-- nvim-tree
vim.keymap.set('n', '<M-t>', function()
	require('nvim-tree').toggle(false)
end, { desc = 'NvimTree Toggle' })
vim.keymap.set('n', '<M-r>', function()
	require('nvim-tree.lib').refresh_tree()
end, { desc = 'NvimTree Refresh' })

-- Packer
vim.keymap.set('n', '<leader>ps', '<Cmd>PackerSync<CR>', { desc = 'Packer Sync' })
vim.keymap.set('n', '<leader>pS', function()
	require('packer').status()
end, { desc = 'Packer Status' })

-- session
vim.keymap.set('n', '<leader>sd', function()
	require('session_manager.commands').run_command('delete_session')
end, { desc = 'Select and Delete a Session' })
vim.keymap.set('n', '<leader>sl', function()
	require('session_manager.commands').run_command('load_last_session')
end, { desc = 'Restore last session' })
vim.keymap.set('n', '<leader>sr', function()
	require('session_manager.commands').run_command('load_session')
end, { desc = 'Select and load session' })
vim.keymap.set('n', '<leader>ss', function()
	require('session_manager.commands').run_command('save_current_session')
	vim.notify('Current Session Saved', 'info', { title = 'Session Manager' })
end, { desc = 'Save current session' })

-- Spectre
vim.keymap.set('n', '<leader>S', function()
	require('spectre').open()
end, { desc = 'Open Spectre' })
vim.keymap.set('n', '<leader>sw', function()
	require('spectre').open_visual { select_word = true }
end, { desc = 'search current word' })
vim.keymap.set('v', '<leader>sw', function()
	require('spectre').open_visual()
end, { silent = true, desc = 'search current word' })
vim.keymap.set(
	'n',
	'<leader>sp',
	'viw:lua require("spectre").open_file_search()<CR>',
	{ desc = 'search in current file' }
)

-- Telescope
vim.keymap.set('n', '<leader><space>', function()
	require('telescope.builtin').buffers()
end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fd', function()
	require('telescope.builtin').grep_string()
end, { desc = 'Grep Strings' })
vim.keymap.set('n', '<leader>ff', function()
	require('telescope.builtin').find_files { hidden = true }
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function()
	require('telescope.builtin').live_grep()
end, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fh', function()
	require('telescope.builtin').help_tags()
end, { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fk', function()
	require('telescope.builtin').keymaps()
end, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fl', function()
	require('telescope.builtin').highlights()
end, { desc = 'Highlight Groups' })
vim.keymap.set('n', '<leader>fo', function()
	require('telescope.builtin').oldfiles()
end, { desc = 'Old Files' })
vim.keymap.set('n', '<leader>fs', function()
	require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = 'Current Buffer Fuzzy Find' })
vim.keymap.set('n', '<leader>ft', function()
	require('telescope.builtin').tags()
end, { desc = 'Tags' })
vim.keymap.set('n', '<leader>fx', function()
	require('telescope.builtin').diagnostics()
end, { desc = 'Workspace Diagnostics' })

vim.keymap.set('n', '<leader>fb', function()
	require('telescope').extensions.file_browser.file_browser {}
end, { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fc', function()
	require('telescope').extensions.bibtex.bibtex {}
end, { desc = 'bibtex' })
vim.keymap.set('n', '<leader>fp', function()
	require('telescope').extensions.project.project {}
end, { desc = 'Projects' })
vim.keymap.set('n', '<leader>fr', function()
	require('telescope').extensions.frecency.frecency {}
end, { desc = 'Frecency' })
