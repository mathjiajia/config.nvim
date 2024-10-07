return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"bibtex",
					"c",
					"comment",
					"diff",
					"fish",
					"latex",
					"lua",
					"luadoc",
					"luap",
					"markdown",
					"markdown_inline",
					"matlab",
					"python",
					"query",
					"regex",
					"swift",
					"toml",
					"vim",
					"vimdoc",
				},
				highlight = { enable = true },
			})
		end,
	},

	-- enhanced matchparen
	{ "lewis6991/nvim-treesitter-pairs" },
}
