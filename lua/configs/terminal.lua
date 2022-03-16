local fterm = require('FTerm')

-- stylua: ignore start
vim.keymap.set(
	{ 'n', 't' }, '<M-i>',
	function()
		fterm.toggle()
	end,
	{ desc = 'Terminal Toggle' }
)
vim.keymap.set(
	't', '<M-S-i>',
	function()
		fterm.exit()
	end,
	{ desc = 'Terminal Exit' }
)
vim.keymap.set(
	'n', '<M-g>',
	function()
		fterm:new({ cmd = 'lazygit', dimensions = { height = 0.9, width = 0.9 } }):open()
	end,
	{ desc = 'LazyGit' }
)
-- stylua: ignore end
