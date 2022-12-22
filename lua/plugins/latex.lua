local M = {
	'ryleelyman/latex.nvim',
	ft = 'tex',
}

function M.config()
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
	})
end

return M
