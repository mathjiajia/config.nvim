return {

	{
		"latex.nvim",
		ft = "tex",
		after = function()
			require("latex").setup()
		end,
	},

	{
		"markview.nvim",
		ft = "markdown",
		after = function()
			require("markview").setup()
		end,
	},

	{
		"lazydev.nvim",
		ft = "lua",
		after = function()
			require("lazydev").setup()
		end,
	},
}
