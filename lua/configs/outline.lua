vim.api.nvim_set_hl(0, 'FocusedSymbol', { link = 'Search' })

local outline = require('symbols-outline')

outline.setup {
	auto_preview = false,
	relative_width = false,
	width = 30,
	preview_bg_highlight = 'NormalFloat',
	actions = 'a',
	lsp_blacklist = { 'null-ls' },
	symbol_blacklist = { 'Null' },
	symbols = {
		File = { icon = '', hl = 'Include' },
		Module = { icon = '', hl = 'Include' }, --
		Namespace = { icon = '', hl = 'TSNamespace' },
		Package = { icon = '', hl = 'Include' },
		Class = { icon = '', hl = 'Type' }, --
		Method = { icon = '', hl = 'TSMethod' }, --
		Property = { icon = '', hl = 'TSProperty' },
		Field = { icon = '', hl = 'TSField' }, --
		Constructor = { icon = '', hl = 'TSConstructor' },
		Enum = { icon = '', hl = 'Type' }, --
		Interface = { icon = '', hl = 'Type' },
		Function = { icon = '', hl = 'Function' }, --
		Variable = { icon = '', hl = 'TSVariableBuiltin' }, --
		Constant = { icon = '', hl = 'Constant' }, --
		String = { icon = '', hl = 'String' },
		Number = { icon = '', hl = 'Number' },
		Boolean = { icon = '', hl = 'Boolean' },
		Array = { icon = '', hl = 'Constant' },
		Object = { icon = '', hl = 'TSField' },
		Key = { icon = '', hl = 'Type' },
		Null = { icon = '', hl = 'Type' },
		EnumMember = { icon = '', hl = 'TSField' }, --
		Struct = { icon = '', hl = 'TSField' },
		Event = { icon = '', hl = 'Type' },
		Operator = { icon = '', hl = 'Operator' },
		TypeParameter = { icon = '', hl = 'TSParameter' },
	},
}

vim.keymap.set('n', '<M-o>', function()
	outline.toggle_outline()
end, { desc = 'Symbols Outline' })
