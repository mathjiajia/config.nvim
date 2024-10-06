return {

	-- filesype plugin for `LaTeX`
	{ "mathjiajia/latex.nvim", config = true },

	-- viewing Markdown files in Neovim
	{ "OXY2DEV/markview.nvim", config = true },

	-- Faster LuaLS setup for Neovim
	{
		"folke/lazydev.nvim",
		ft = "lua",
		dependencies = { "Bilal2453/luvit-meta", lazy = true },
		---@module "lazydev"
		---@class lazydev.Config
		opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
	},

	-- neorg
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	ft = "norg",
	-- 	opts = {
	-- 		load = {
	-- 			["core.defaults"] = {},
	-- 			["core.concealer"] = {},
	-- 			["core.highlights"] = {},
	-- 			["core.integrations.treesitter"] = {},
	-- 			["core.completion"] = { config = { engine = "nvim-cmp" } },
	-- 			["core.dirman"] = {
	-- 				config = {
	-- 					workspaces = { notes = "~/Documents/neorg/notes" },
	-- 					default_workspace = "notes",
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },

	-- {
	-- 	"HakonHarnes/img-clip.nvim",
	-- 	ft = { "markdown", "tex", "typst" },
	-- 	config = true,
	--     -- stylua: ignore
	--     keys = { { "<leader>p", function() require("img-clip").pasteImage() end, desc = "Paste clipboard image" } },
	-- },
}
