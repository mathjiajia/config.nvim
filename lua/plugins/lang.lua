return {

	-- filesype plugin for `LaTeX`
	{
		"mathjiajia/latex.nvim",
		ft = "tex",
		config = true,
	},

	{
		"MeanderingProgrammer/markdown.nvim",
		ft = "markdown",
		config = function()
			require("render-markdown").setup({})
		end,
	},

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
