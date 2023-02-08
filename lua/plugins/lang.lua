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
		opts = {
			load = {
				["core.defaults"] = {},
				["core.norg.concealer"] = {},
				["core.norg.dirman"] = { config = { workspaces = { work = "~/Documents/neorg/work" } } },
				["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
				["core.presenter"] = { config = { zen_mode = "zen-mode" } },
			},
		},
		build = ":Neorg sync-parsers",
		ft = "norg",
	},
}
