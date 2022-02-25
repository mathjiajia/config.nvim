local opts = {
	pairs = {
		['*'] = {
			{ '(', ')' },
			{ '[', ']' },
			{ '{', '}' },
			{ "'", "'" },
			{ '"', '"' },
		},
		lua = {
			{ '(', ')', { ignore = { '%(', '%)', '%%' } } },
			{ '[', ']', { ignore = { '%[', '%]', '%%' } } },
			{ '{', '}', { ignore = { '%{', '%}', '%%' } } },
		},
		python = {
			{ "'", "'", { triplet = true } },
			{ '"', '"', { triplet = true } },
		},
		markdown = {
			{ '`', '`', { triplet = true } },
		},
		norg = {
			{ '`', '`' },
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
