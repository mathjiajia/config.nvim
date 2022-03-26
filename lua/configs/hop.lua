local hop = require('hop')
hop.setup()

vim.keymap.set('n', '<localleader>w', function()
	hop.hint_words()
end, { desc = 'Hop Words' })
vim.keymap.set('n', '<localleader>g', function()
	hop.hint_lines()
end, { desc = 'Hop Lines' })
vim.keymap.set('n', '<localleader>/', function()
	hop.hint_patterns()
end, { desc = 'Hop Patterns' })
