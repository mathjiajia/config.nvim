local M = {
	'zbirenbaum/nvim-copilot',
	enabled = false,
	dependencies = {
		'zbirenbaum/copilot_cmp',
		config = true,
	},
	config = true,
}

M.config = {
	panel = {
		enabled = true,
		auto_refresh = false,
		keymap = {
			jump_prev = '[[',
			jump_next = ']]',
			accept = '<CR>',
			refresh = 'gr',
			open = '<M-CR>'
		},
	},
	suggestion = {
		enabled = true,
		auto_trigger = false,
		debounce = 75,
		keymap = {
			accept = '<M-l>',
			accept_word = false,
			accept_line = false,
			next = '<M-]>',
			prev = '<M-[>',
			dismiss = '<C-]>',
		},
	},
	filetypes = {
		yaml = false,
		markdown = false,
		help = false,
		gitcommit = false,
		gitrebase = false,
		hgcommit = false,
		svn = false,
		cvs = false,
		['.'] = false,
	},
	copilot_node_command = 'node',
	server_opts_overrides = {},
}

return M
