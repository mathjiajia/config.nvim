require('indent_blankline').setup({
	use_treesitter = true,
	-- show_first_indent_level = false,
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
	char = '▎',
	context_char = '▍',
	char_highlight_list = {
		'IndentBlanklineIndent1',
		'IndentBlanklineIndent2',
		'IndentBlanklineIndent3',
		'IndentBlanklineIndent4',
		'IndentBlanklineIndent5',
		'IndentBlanklineIndent6',
	},
})
