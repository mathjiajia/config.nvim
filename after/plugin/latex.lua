require('latex').setup({
	conceals = {
		enabled = {
			'greek',
			'math',
			'script',
			'delim',
			'font'
		},
		add = {
			['coloneqq'] = '≔',
		}
	},
	imaps = {
		add = {
			['\\emptyset'] = '0',
		},
		default_leader = ';'
	}
})
