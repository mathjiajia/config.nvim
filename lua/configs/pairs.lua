local opts = {
	pairs = {
		['*'] = {
			{ '(', ')' },
			{ '[', ']' },
			{ '{', '}' },
			-- {"'", "'"},
			{ '"', '"' },
		},
		lua = {
			{ "'", "'" },
		},
		markdown = {
			{ "'", "'" },
		},
		norg = {
			{ '`', '`' },
			{ "'", "'" },
		},
		tex = {
			{ '``', "''" },
		},
	},
	space = {
		enable_mapping = false,
	},
	enter = {
		enable_mapping = false, -- TODO
	},
}

require('pairs'):setup(opts)
