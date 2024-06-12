return {

	-- filesype plugin for `LaTeX`
	{ "mathjiajia/latex.nvim", ft = "tex", config = true },

	-- viewing Markdown files in Neovim
	{ "MeanderingProgrammer/markdown.nvim", ft = "markdown", main = "render-markdown", config = true },

	-- Faster LuaLS setup for Neovim
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
				{ path = "wezterm-types", mods = { "wezterm" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{ "justinsgithub/wezterm-types", lazy = true },

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
