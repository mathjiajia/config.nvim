return {
	{
		"nvim-treesitter/nvim-treesitter",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"bibtex",
				"c",
				"comment",
				"diff",
				"fish",
				"html",
				"latex",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"matlab",
				"nix",
				"python",
				"query",
				"regex",
				"swift",
				"toml",
				"vim",
				"vimdoc",
			},
			highlight = { enable = true },
		},
	},

	-- enhanced matchparen
	{ "lewis6991/nvim-treesitter-pairs" },
}
