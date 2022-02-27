require('aerial').setup {
	backends = {
		_ = { 'lsp', 'treesitter' },
		markdown = { 'treesitter', 'markdown' },
	},
	filter_kind = {
		_ = {
			'Class',
			'Constructor',
			'Enum',
			'Function',
			'Interface',
			'Module',
			'Method',
			'Struct',
		},
		markdown = {
			'Interface',
		},
		tex = {
			'Enum',
			'Module',
			'Variable',
		},
		-- 'Array','Boolean',
		-- 'Class', 'ﴯ',
		-- 'Constant', '',
		-- 'Constructor', '',
		-- 'Enum', '',
		-- 'EnumMember', '',
		-- 'Event', '',
		-- 'Field', 'ﰠ',
		-- 'File', '',
		-- 'Function', '',
		-- 'Interface', ''
		-- 'Key',
		-- 'Method', '',
		-- 'Module', '',
		-- 'Namespace','Null','Number','Object',
		-- 'Operator', '',
		-- 'Package',
		-- 'Property', 'ﰠ',
		-- 'String',
		-- 'Struct', 'פּ',
		-- 'TypeParameter', '',
		-- 'Variable', ''
	},
}
