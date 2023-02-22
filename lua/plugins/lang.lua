return {

	-- filesype plugin for `LaTeX`
	{
		"ryleelyman/latex.nvim",
		opts = {
			conceals = {
				add = {
					["colon"] = ":",
					["coloneqq"] = "≔",
				},
			},
			imaps = {
				add = { ["\\emptyset"] = "0" },
				default_leader = ";",
			},
			surrounds = { enabled = true },
		},
		ft = "tex",
	},

	-- inverse serach for LaTeX
	{
		"f3fora/nvim-texlabconfig",
		config = true,
		build = "go build",
		ft = "tex",
	},

	-- neorg
	{
		"nvim-neorg/neorg",
		dependencies = "nvim-neorg/neorg-telescope",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.norg.concealer"] = {},
				["core.norg.dirman"] = {
					config = {
						workspaces = {
							log = "~/Documents/neorg/log",
							projects = "~/Documents/neorg/projects",
							wiki = "~/Documents/neorg/wiki",
						},
						default_workspace = "wiki",
					},
				},
				["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
				["core.presenter"] = { config = { zen_mode = "zen-mode" } },
				["core.integrations.telescope"] = {},
			},
		},
		build = ":Neorg sync-parsers",
		cmd = "Neorg",
		ft = "norg",
	},

	-- swift
	-- {
	-- 	"dimaportenko/telescope-simulators.nvim",
	-- 	config = function()
	-- 		require("simulators").setup()
	-- 	end,
	-- 	ft = "swift",
	-- },
}
