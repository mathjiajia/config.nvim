local spectre = require('spectre')

vim.keymap.set('n', '<leader>rp', function()
	spectre.open()
end, { desc = 'Open Spectre' })
vim.keymap.set('n', '<leader>rw', function()
	spectre.open_visual { select_word = true }
end, { desc = 'Search the Current Word' })
vim.keymap.set('v', '<leader>rw', function()
	spectre.open_visual()
end, { silent = true, desc = 'Search the Current Word' })
vim.keymap.set('n', '<leader>rf', function()
	spectre.open_file_search()
end, { desc = 'Search in the Current File' })
