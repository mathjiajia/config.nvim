require('neorg').setup {
	load = {
		['core.defaults'] = {}, -- Load all the default modules
		['core.keybinds'] = { -- Configure core.keybinds
			config = {
				default_keybinds = true, -- Generate the default keybinds
				neorg_leader = '<LocalLeader>',
			},
		},
		['core.norg.concealer'] = {}, -- Allows for use of icons
		['core.norg.dirman'] = { -- Manage your directories with Neorg
			config = {
				workspaces = {
					gtd = '~/Documents/neorg/gtd/',
					work = '~/Documents/neorg/work/',
				},
			},
		},
		['core.gtd.base'] = { config = { workspace = 'gtd' } },
		['core.gtd.ui'] = {},
		['core.norg.completion'] = { config = { engine = 'nvim-cmp' } },
		['core.norg.qol.toc'] = {},
		['core.integrations.telescope'] = {}, -- Enable the telescope module
	},
}
