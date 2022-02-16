require('hop').setup {
	keys = 'etovxqpdygfblzhckisuran',
	quit_key = '<Esc>',
	perm_method = require('hop.perm').TrieBacktrackFilling,
	reverse_distribution = false,
	teasing = true,
	jump_on_sole_occurrence = true,
	case_insensitive = true,
	create_hl_autocmd = true,
	current_line_only = false,
	inclusive_jump = false,
	uppercase_labels = false,
	multi_windows = false,
}
