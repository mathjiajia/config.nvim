require('buftabline').setup {}

-- buffer navigation
vim.keymap.set('n', '<leader>bp', '<Cmd>BufPrev<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bn', '<Cmd>BufNext<CR>', { desc = 'Next Buffer' })
