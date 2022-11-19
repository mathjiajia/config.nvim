local aerial = require('aerial')

aerial.setup({
	show_guides = true,
})

vim.keymap.set('n', '<M-o>', aerial.toggle, { buffer = true, desc = 'Toggle Aerial' })
