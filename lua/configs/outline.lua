require('aerial').setup {
	default_direction = 'right',
	filter_kind = {
		-- 'Array',
		-- 'Boolean',
		'Class', --
		'Constant', --
		'Constructor', --
		'Enum', --
		'EnumMember', --
		-- 'Event',
		-- 'Field',
		-- 'File',
		'Function', --
		'Interface', --
		-- 'Key',
		'Method', --
		'Module', --
		-- 'Namespace',
		-- 'Null',
		-- 'Number',
		'Object',
		-- 'Operator',
		-- 'Package',
		-- 'Property',
		-- 'String',
		'Struct', --
		-- 'TypeParameter',
		'Variable', --
	},
	highlight_on_hover = true,
	highlight_on_jump = 150,
	min_width = 25,
	nerd_font = true,
	on_attach = function(bufnr)
		vim.keymap.set('n', '<M-o>', function()
			require('aerial').toggle()
		end, { buffer = bufnr, desc = 'Toggle aerial window' })
	end,
	show_guides = true,
	float = { relative = 'editor' },
}
