-- CURSOR MOVEMENTS
vim.keymap.set('n', '<M-h>', '<cmd>wincmd h<CR>', { desc = 'Move to Left Window' })
vim.keymap.set('n', '<M-l>', '<cmd>wincmd l<CR>', { desc = 'Move to Right Window' })
vim.keymap.set('n', '<M-j>', '<cmd>wincmd j<CR>', { desc = 'Move to Bottom Window' })
vim.keymap.set('n', '<M-k>', '<cmd>wincmd k<CR>', { desc = 'Move to Upper Window' })
-- REMAP FOR DEALING WITH WORD WRAP
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- INSERT
vim.keymap.set('i', '<C-f>', '<Right>', { desc = 'Move Forward a Char' })
vim.keymap.set('i', '<C-b>', '<Left>', { desc = 'Move Backward a Char' })
