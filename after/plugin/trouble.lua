require('trouble').setup()

vim.keymap.set('n', '<leader>xx', require('trouble').toggle, { desc = 'Toggle Trouble' })
