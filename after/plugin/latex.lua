require('latex').setup({
	conceals = {
		enabled = {
			'greek',
			'math',
			'script',
			'delim',
			'font',
		},
		add = {}
	},
	imaps = {
		enabled = true,
		add = {
			['\\emptyset'] = '0',
		},
		default_leader = ';'
	}
})
