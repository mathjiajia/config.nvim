local M = {
	'ryleelyman/latex.nvim',
	ft = 'tex',
}

M.config = {
	conceals = {
		enabled = {
			'greek',
			'math',
			'script',
			'delim',
			'font'
		},
		add = {
			['colon'] = ':',
			['coloneqq'] = '≔',
		}
	},
	imaps = {
		add = {
			['\\emptyset'] = '0',
		},
		default_leader = ';'
	},
	surrounds = {
		enabled = true,
		command = 'c',
		environment = 'e',
	},
}

return M
