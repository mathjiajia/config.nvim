return {
	{
		"nvim-treesitter",
		after = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {},
				highlight = { enable = true },
			})
		end,
	},

	-- enhanced matchparen
	-- { "nvim-treesitter-pairs" },
}
