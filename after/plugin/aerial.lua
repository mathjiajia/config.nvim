require('aerial').setup({
	filter_kind = {
		'Class', 'Constant', 'Constructor', 'Enum',
		'EnumMember', 'Function', 'Interface', 'Method',
		'Module', 'Object', 'Struct', 'Variable',
	},
	show_guides = true,
})

vim.keymap.set(
	'n',
	'<M-o>',
	require('aerial').toggle,
	{ buffer = true, desc = 'Toggle Aerial' }
)
