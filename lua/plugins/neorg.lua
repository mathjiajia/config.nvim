local M = {
	'nvim-neorg/neorg',
	-- dependencies = 'nvim-neorg/neorg-telescope',
	ft = 'norg',
}

function M.build()
	pcall(require('nvim-treesitter.install').commands.TSInstallSync['run!']('norg', 'norg_meta'))
end

M.config = {
	load = {
		['core.defaults'] = {},
		['core.norg.dirman'] = {
			config = {
				workspaces = {
					gtd  = '~/Documents/neorg/gtd/',
					work = '~/Documents/neorg/work/',
				},
			},
		},
		['core.norg.completion'] = {
			config = { engine = 'nvim-cmp' }
		},
		['core.norg.concealer'] = {},
		-- ['core.export'] = {},
		-- ['core.presenter'] = {},
		-- ['core.integrations.telescope'] = {},
	},
}

return M
