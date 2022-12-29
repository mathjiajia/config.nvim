local M = {
	'lukas-reineke/indent-blankline.nvim',
	event = 'BufReadPre',
}

M.config = {
	use_treesitter = true,
	-- use_treesitter_scope = true,
	buftype_exclude = { 'terminal', 'nofile' },
	filetype_exclude = {
		'help',
		'norg',
		'neo-tree',
		'Trouble',
	},
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
	-- char = '▎',
	-- context_char = '▍',
	char_highlight_list = {
		'IndentBlanklineIndent1',
		'IndentBlanklineIndent2',
		'IndentBlanklineIndent3',
		'IndentBlanklineIndent4',
		'IndentBlanklineIndent5',
		'IndentBlanklineIndent6',
	},
	-- space_char_highlight_list = {
	-- 	'IndentBlanklineIndent1',
	-- 	'IndentBlanklineIndent2',
	-- 	'IndentBlanklineIndent3',
	-- 	'IndentBlanklineIndent4',
	-- },
}

return M
