local M = {
	'stevearc/aerial.nvim',
}

M.config = {
	backends = {
		'lsp', 'treesitter', 'markdown', 'man'
	},
	filter_kind = {
		'Array',
		'Boolean',
		'Class',
		'Constant',
		'Constructor',
		'Enum',
		'EnumMember',
		'Event',
		'Field',
		'File',
		'Function',
		'Interface',
		'Key',
		'Method',
		'Module',
		'Namespace',
		'Null',
		'Number',
		'Object',
		'Operator',
		'Package',
		'Property',
		'String',
		'Struct',
		'TypeParameter',
		'Variable',
	},
	icons = {
		Array         = ' ',
		Boolean       = ' ',
		Class         = ' ',
		Collapsed     = ' ',
		Constant      = ' ',
		Constructor   = ' ',
		Enum          = ' ',
		EnumMember    = ' ',
		Event         = ' ',
		Field         = ' ',
		File          = ' ',
		Function      = ' ',
		Interface     = ' ',
		Key           = ' ',
		Method        = ' ',
		Module        = ' ',
		Namespace     = ' ',
		Null          = '  ',
		Number        = ' ',
		Object        = ' ',
		Operator      = ' ',
		Package       = '  ',
		Property      = ' ',
		String        = ' ',
		Struct        = ' ',
		TypeParameter = ' ',
		Variable      = ' ',
	},
	show_guides = true,
	layout = {
		min_width = 30,
	},
}

M.keys = {
	{ '<M-o>', function()
		require('aerial').toggle()
	end, desc = 'Toggle Aerial' },
}

return M
