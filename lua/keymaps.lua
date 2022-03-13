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

-- FTerm
vim.keymap.set({ 'n', 't' }, '<M-i>', function()
	require('FTerm').toggle()
end, { desc = 'Terminal Toggle' })
vim.keymap.set('t', '<M-S-i>', function()
	require('FTerm').exit()
end, { desc = 'Terminal Exit' })
vim.keymap.set('n', '<M-g>', function()
	require('FTerm'):new({ cmd = 'lazygit', dimensions = { height = 0.9, width = 0.9 } }):open()
end, { desc = 'LazyGit' })

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

-- NvimTree
vim.keymap.set('n', '<M-t>', function()
	require('nvim-tree').toggle()
end, { desc = 'Toggle NvimTree' })

-- Spectre
vim.keymap.set('n', '<leader>rp', function()
	require('spectre').open()
end, { desc = 'Open Spectre' })
vim.keymap.set('n', '<leader>rw', function()
	require('spectre').open_visual { select_word = true }
end, { desc = 'Search the Current Word' })
vim.keymap.set('v', '<leader>rw', function()
	require('spectre').open_visual()
end, { silent = true, desc = 'Search the Current Word' })
vim.keymap.set('n', '<leader>rf', function()
	require('spectre').open_file_search()
end, { desc = 'Search in the Current File' })

-- SymbolsOutline
vim.keymap.set('n', '<M-o>', function()
	require('symbols-outline').toggle_outline()
end, { desc = 'Symbols Outline' })

-- Telescope
vim.keymap.set('n', '<leader><leader>', function()
	require('telescope.builtin').buffers()
end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fc', function()
	require('telescope.builtin').commands()
end, { desc = 'Command Pallete' })
vim.keymap.set('n', '<leader>fd', function()
	require('telescope.builtin').diagnostics()
end, { desc = 'Workspace Diagnostics' })
vim.keymap.set('n', '<leader>ff', function()
	require('telescope.builtin').find_files { hidden = true }
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function()
	require('telescope.builtin').grep_string()
end, { desc = 'Grep Strings' })
vim.keymap.set('n', '<leader>fl', function()
	require('telescope.builtin').live_grep()
end, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fn', function()
	require('telescope.builtin').find_files { cwd = '~/.config/nvim', prompt_title = 'Nvim Configs' }
end, { desc = 'Neovim Config Files' })
vim.keymap.set('n', '<leader>fo', function()
	require('telescope.builtin').oldfiles()
end, { desc = 'Old Files' })
vim.keymap.set('n', '<leader>fs', function()
	require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = 'Current Buffer Fuzzy Find' })

vim.keymap.set('n', '<leader><space>', function()
	require('telescope').extensions.file_browser.file_browser {}
end, { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fp', function()
	require('telescope').extensions.project.project {}
end, { desc = 'Projects' })
vim.keymap.set('n', '<leader>fr', function()
	require('telescope').extensions.frecency.frecency {}
end, { desc = 'Frecency' })

-- treesitter
vim.keymap.set('n', '<leader>th', function()
	require('nvim-treesitter-playground.hl-info').show_hl_captures()
end, { desc = 'Highlight captures under cursor' })
vim.keymap.set('n', '<leader>tp', function()
	require('nvim-treesitter-playground.internal').toggle()
end, { desc = 'Tree-Sitter Playground' })

vim.api.nvim_add_user_command('Files', function()
	require('telescope.builtin').find_files { hidden = true }
end, {})
vim.api.nvim_add_user_command('Grep', function()
	require('telescope.builtin').live_grep()
end, {})
vim.api.nvim_add_user_command('Oldfiles', function()
	require('telescope.builtin').oldfiles()
end, {})
