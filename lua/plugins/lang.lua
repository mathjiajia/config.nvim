return {

	{ "mathjiajia/latex.nvim" },
	{ "OXY2DEV/markview.nvim", ft = "markdown", config = true },
	{
		"folke/lazydev.nvim",
		ft = "lua",
		dependencies = { "Bilal2453/luvit-meta", lazy = true },
		opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
	},

	-- neorg
	{
		"nvim-neorg/neorg",
		ft = "norg",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.highlights"] = {},
				["core.completion"] = { config = { engine = "nvim-cmp" } },
				-- ["core.integrations.image"] = {},
				["core.integrations.nvim-cmp"] = {},
				["core.integrations.treesitter"] = {},
				-- ["core.latex.renderer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = { notes = "~/Documents/Neorg/notes" },
						default_workspace = "notes",
					},
				},
			},
		},
	},
}
