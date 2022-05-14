local surround = require 'nvim-surround'

vim.keymap.set('n', 'ys',
	function()
		surround.insert_surround()
	end,
	{ desc = 'Surrounds a text object with a delimiter pair' })
vim.keymap.set('n', 'ds',
	function() surround.delete_surround()
	end,
	{ desc = 'Delete a surrounding delimiter' })
vim.keymap.set('n', 'cs',
	function() surround.change_surround()
	end,
	{ desc = 'Changes the surrounding delimiter' })
vim.keymap.set('x', 'S',
	function() surround.insert_surround()
	end,
	{ desc = 'Surrounds a visual selection with a delimiter' })
