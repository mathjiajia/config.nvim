local aerial = require('aerial')

aerial.setup({
	show_guides = true,
	layout = {
		-- max_width = { 40, 0.2 },
		min_width = 30,
	},
})

vim.keymap.set('n', '<M-o>', aerial.toggle, { buffer = true, desc = 'Toggle Aerial' })
