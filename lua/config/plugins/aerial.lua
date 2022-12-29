local M = {
	'stevearc/aerial.nvim',
}

M.config = {
	backends = {
		['_'] = { 'treesitter', 'lsp', 'markdown', 'man' },
		tex   = { 'lsp' },
	},
	filter_kind = {
		['_'] = { 'Class',
			'Constructor',
			'Enum',
			'Function',
			'Interface',
			'Module',
			'Method',
			'Struct',
			'Property',
			'Variable',
		},
		tex = {
			'Enum',
			'Method',
			'Constant', --
			'Module', --
			'Variable', --
			'EnumMember', --
		},
	},
	icons = {
		Text          = '',
		Method        = '',
		Function      = '',
		Constructor   = '',
		Field         = '',
		Variable      = '',
		Class         = '',
		Interface     = '',
		Module        = '',
		Property      = '',
		Unit          = '',
		Value         = '',
		Enum          = '',
		Keyword       = '',
		Snippet       = '',
		Color         = '',
		File          = '',
		Reference     = '',
		Folder        = '',
		EnumMember    = '',
		Constant      = '',
		Struct        = '',
		Event         = '',
		Operator      = '',
		TypeParameter = '',
		Package       = ' ',
		String        = 's]',
		Collapsed     = ' ',
	},
	show_guides = true,
	layout = {
		-- max_width = { 40, 0.2 },
		min_width = 30,
	},
}

M.keys = {
	{ '<M-o>', function()
		require('aerial').toggle()
	end, desc = 'Toggle Aerial' },
}

return M
