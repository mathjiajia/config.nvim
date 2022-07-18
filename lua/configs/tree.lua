require('nvim-tree').setup()

vim.keymap.set('n', '<M-t>', function()
	require('nvim-tree').toggle(false, false)
end)
