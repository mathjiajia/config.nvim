return {

	-- filesype plugin for `LaTeX`
	{
		"mathjiajia/latex.nvim",
		ft = "tex",
		config = true,
	},

	-- inverse serach for LaTeX
	{
		"f3fora/nvim-texlabconfig",
		ft = "tex",
		build = "go build",
		config = true,
	},

	-- neorg
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		ft = "norg",
		dependencies = "nvim-neorg/neorg-telescope",
		cmd = "Neorg",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							log = "~/Documents/neorg/log",
							projects = "~/Documents/neorg/projects",
							wiki = "~/Documents/neorg/wiki",
						},
						default_workspace = "wiki",
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.presenter"] = {
					config = {
						zen_mode = "zen-mode",
					},
				},
				["core.integrations.telescope"] = {},
			},
		},
	},

	-- swift
	-- {
	-- 	"dimaportenko/telescope-simulators.nvim",
	-- 	ft = "swift",
	-- 	config = function()
	-- 		require("simulators").setup()
	-- 	end,
	-- },
}
