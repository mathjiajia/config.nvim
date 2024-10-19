return {

	{ "mathjiajia/latex.nvim" },
	{ "OXY2DEV/markview.nvim", ft = "markdown", config = true },
	{ "folke/lazydev.nvim", ft = "lua", config = true },

	-- neorg
	{
		"nvim-neorg/neorg",
		ft = "norg",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.highlights"] = {},
				["core.integrations.treesitter"] = {},
				["core.completion"] = { config = { engine = "nvim-cmp" } },
				["core.dirman"] = {
					config = {
						workspaces = { notes = "~/Documents/neorg/notes" },
						default_workspace = "notes",
					},
				},
			},
		},
	},
}
