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
}

require('pairs'):setup(opts)
