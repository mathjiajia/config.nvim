require('nvim-tree').setup {
	disable_netrw = true
}

vim.keymap.set('n', '<M-t>', function()
	require('nvim-tree').toggle(false, false)
end)
