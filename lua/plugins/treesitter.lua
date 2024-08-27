return {

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = {
			ensure_install = {
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
				"toml",
				"vim",
				"vimdoc",
			},
		},
	},

	-- enhanced matchparen
	{ "lewis6991/nvim-treesitter-pairs" },
}
