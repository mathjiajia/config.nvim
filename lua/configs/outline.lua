require('aerial').setup {
	filter_kind = {
		'Class', 'Constant', 'Constructor', 'Enum',
		'EnumMember', 'Function', 'Interface', 'Method',
		'Module', 'Object', 'Struct', 'Variable',
	},
	on_attach = function(bufnr)
		vim.keymap.set('n', '<M-o>', function()
			require('aerial').toggle()
		end, { buffer = bufnr, desc = 'Toggle aerial window' })
	end,
	show_guides = true,
}
