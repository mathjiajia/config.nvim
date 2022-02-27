local spectre = require('spectre')

spectre.setup {}

vim.keymap.set('n', '<leader>rp', function()
	spectre.open()
end, { desc = 'Open Spectre' })
vim.keymap.set('n', '<leader>rw', function()
	spectre.open_visual { select_word = true }
end, { desc = 'search current word' })
vim.keymap.set('v', '<leader>rw', function()
	spectre.open_visual()
end, { silent = true, desc = 'search current word' })
vim.keymap.set(
	'n',
	'<leader>rf',
	'viw:lua require("spectre").open_file_search()<CR>',
	{ desc = 'search in current file' }
)
