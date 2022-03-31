local opts = {
	pairs = {
		norg = { { '`', '`' } },
		tex = {
			{ "'", "'", { ignore_pre = '\\v(\\\\|\\S)' } },
			{ '``', "''" },
		},
	},
	space = { enable_mapping = false },
}

require('pairs'):setup(opts)
