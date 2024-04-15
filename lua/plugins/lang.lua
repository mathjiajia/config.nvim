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

	-- {
	-- 	"vhyrro/luarocks.nvim",
	-- 	priority = 1000,
	-- 	config = true,
	-- },
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	ft = "norg",
	-- 	cmd = "Neorg",
	-- 	dependencies = { "luarocks.nvim" },
	-- 	opts = {
	-- 		load = {
	-- 			["core.defaults"] = {},
	-- 			["core.concealer"] = {},
	-- 			["core.dirman"] = {
	-- 				config = {
	-- 					workspaces = {
	-- 						log = "~/Documents/neorg/log",
	-- 						projects = "~/Documents/neorg/projects",
	-- 						wiki = "~/Documents/neorg/wiki",
	-- 					},
	-- 					default_workspace = "wiki",
	-- 				},
	-- 			},
	-- 			["core.completion"] = {
	-- 				config = { engine = "nvim-cmp" },
	-- 			},
	-- 			["core.presenter"] = {
	-- 				config = { zen_mode = "zen-mode" },
	-- 			},
	-- 			["core.integrations.telescope"] = {},
	-- 		},
	-- 	},
	-- },

	-- Typst
	-- {
	-- 	"kaarmu/typst.vim",
	-- 	ft = "typst",
	-- },

	-- swift
	-- {
	-- 	"dimaportenko/telescope-simulators.nvim",
	-- 	ft = "swift",
	-- 	config = function()
	-- 		require("simulators").setup()
	-- 	end,
	-- },

	-- {
	-- 	"HakonHarnes/img-clip.nvim",
	-- 	ft = { "markdown", "tex", "typst" },
	-- 	config = true,
	--     -- stylua: ignore
	--     keys = { { "<leader>p", function() require("img-clip").pasteImage() end, desc = "Paste clipboard image" } },
	-- },
}
