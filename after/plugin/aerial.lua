require('aerial').setup({
	filter_kind = {
		'Class', 'Constant', 'Constructor', 'Enum',
		'EnumMember', 'Function', 'Interface', 'Method',
		'Module', 'Object', 'Struct', 'Variable',
	},
	on_attach = function(bufnr)
		vim.keymap.set('n', '<M-o>', require('aerial').toggle, { buffer = bufnr, desc = 'Toggle aerial window' })
	end,
	show_guides = true,
})
