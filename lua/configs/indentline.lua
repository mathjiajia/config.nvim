vim.g.indent_blankline_context_char = '┃'

require('indent_blankline').setup {
	use_treesitter = true,
	show_trailing_blankline_indent = false,
	buftype_exclude = { 'terminal', 'nofile' },
	show_current_context = true,
	show_current_context_start = true,
}
