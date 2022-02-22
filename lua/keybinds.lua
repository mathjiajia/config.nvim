-- cursor movements
vim.keymap.set('n', '<M-h>', '<C-w>h', { desc = 'Move to Left Window' })
vim.keymap.set('n', '<M-l>', '<C-w>l', { desc = 'Move to Right Window' })
vim.keymap.set('n', '<M-j>', '<C-w>j', { desc = 'Move to Bottom Window' })
vim.keymap.set('n', '<M-k>', '<C-w>k', { desc = 'Move to Upper Window' })
--Remap for dealing with word wrap
vim.keymap.set('n', 'k', 'v:count == 0 ? "gk" : "k"', { expr = true, desc = 'Move Cursor Down' })
vim.keymap.set('n', 'j', 'v:count == 0 ? "gj" : "j"', { expr = true, desc = 'Move Cursor Up' })
-- Insert
vim.keymap.set('i', '<C-f>', '<Right>', { desc = 'Move forward a character' })
vim.keymap.set('i', '<C-b>', '<Left>', { desc = 'Move back a character' })
