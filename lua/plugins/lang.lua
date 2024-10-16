return {

	-- filesype plugin for `LaTeX`
	"mathjiajia/latex.nvim",

	-- viewing Markdown files in Neovim
	{ "OXY2DEV/markview.nvim", ft = "markdown", config = true },

	-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
	-- used for completion, annotations and signatures of Neovim apis
	{ "folke/lazydev.nvim", ft = "lua", config = true },

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
