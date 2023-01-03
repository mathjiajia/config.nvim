return {
	'nvim-neorg/neorg',
	config = {
		load = {
			['core.defaults'] = {},
			['core.norg.concealer'] = {},
			['core.norg.completion'] = { config = { engine = 'nvim-cmp' } },
		},
	},
	ft = 'norg',
}
