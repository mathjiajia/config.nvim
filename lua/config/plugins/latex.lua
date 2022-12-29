local M = {
	'ryleelyman/latex.nvim',
	ft = 'tex',
}

M.config = {
	conceals = {
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
	},
}

return M
