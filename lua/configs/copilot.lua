vim.keymap.set(
	'i',
	'<C-j>',
	'copilot#Accept("\\<CR>")',
	{ silent = true, script = true, expr = true, desc = 'Copilot Accept' }
)

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
