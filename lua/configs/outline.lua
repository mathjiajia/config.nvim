require('aerial').setup {
	default_direction = 'right',
	filter_kind = {
		'Class', 'Constant', 'Constructor', 'Enum',
		'EnumMember', 'Function', 'Interface', 'Method',
		'Module', 'Object', 'Struct', 'Variable',
	},
	highlight_on_hover = true,
	highlight_on_jump = 150,
	min_width = 25,
	nerd_font = true,
	on_attach = function(bufnr)
		vim.keymap.set('n', '<M-o>',
			function()
				require('aerial').toggle()
			end,
			{ buffer = bufnr, desc = 'Toggle aerial window' })
	end,
	show_guides = true,
	float = { relative = 'editor' },
}
