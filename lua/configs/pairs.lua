local opts = {
	pairs = {
		norg = { { '`', '`' } },
		tex = {
			{ '``', "''" },
		},
	},
	space = { enable_mapping = false },
}

require('pairs'):setup(opts)
