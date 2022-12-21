local M = {
	'nvim-neorg/neorg',
	build = ':Neorg sync-parsers',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-neorg/neorg-telescope'
	},
	ft = 'norg',
	enabled = false,
}

M.config = function()
	require('neorg').setup({
		load = {
			['core.defaults'] = {},
			['core.keybinds'] = {},
			['core.norg.concealer'] = {},
			['core.norg.dirman'] = {
				config = {
					workspaces = {
						gtd  = '~/Documents/neorg/gtd/',
						work = '~/Documents/neorg/work/',
					},
				},
			},
			['core.gtd.base'] = { config = { workspace = 'gtd' } },
			['core.gtd.ui'] = {},
			['core.norg.completion'] = { config = { engine = 'nvim-cmp' } },
			['core.norg.qol.toc'] = {},
			['core.integrations.telescope'] = {},
		},
	})
end

return M
