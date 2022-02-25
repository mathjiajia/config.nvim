require('indent_blankline').setup {
	char_list = {},
	space_char_blankline = ' ',
	use_treesitter = true,
	indent_level = 10,
	show_first_indent_level = true,
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
	filetype_exclude = { 'lspinfo', 'packer', 'checkhealth', 'help', '' },
	buftype_exclude = { 'terminal', 'nofile' },
}
