require('aerial').setup({
	show_guides = true,
})

vim.keymap.set('n', '<M-o>', require('aerial').toggle, { buffer = true, desc = 'Toggle Aerial' })
