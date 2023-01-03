return {

	-- filesype plugin for `latex`
	{
		'ryleelyman/latex.nvim',
		config = {
			conceals = {
				add = {
					['colon'] = ':',
					['coloneqq'] = '≔',
				}
			},
			imaps = {
				add = { ['\\emptyset'] = '0' },
				default_leader = ';'
			},
			surrounds = { enabled = true },
		},
		ft = 'tex',
	},

	-- inverse serach for latex
	{
		'f3fora/nvim-texlabconfig',
		build = 'go build',
		config = true,
		ft = 'tex',
	}
}
