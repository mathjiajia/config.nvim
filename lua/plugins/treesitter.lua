return {

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				ensure_install = {
					"bash",
					"bibtex",
					"comment",
					"diff",
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
					"vim",
					"vimdoc",
				},
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "ts_attach",
				callback = function()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},

	-- enhanced matchparen
	{ "lewis6991/nvim-treesitter-pairs" },
}
