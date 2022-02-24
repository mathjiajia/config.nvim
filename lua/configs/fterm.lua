local FTerm = require('FTerm')

FTerm.setup {}

-- stylua: ignore start
vim.keymap.set({ 'n', 't' }, '<M-i>', function() FTerm.toggle() end, { desc = 'Terminal Toggle' })
vim.keymap.set('t', '<M-S-i>', function() FTerm.exit() end, { desc = 'Terminal Exit' })
vim.keymap.set(
	'n',
	'<M-g>',
	function()
		FTerm:new({ cmd = 'lazygit', dimensions = { height = 0.9, width = 0.9 } }):open()
	end,
	{ desc = 'LazyGit' }
)
-- stylua: ignore start
