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
					"norg",
					"python",
					"query",
					"regex",
					"toml",
					"vim",
					"vimdoc",
				},
				highlight = { enable = true },
			})

			-- vim.api.nvim_create_autocmd("User", {
			-- 	pattern = "ts_attach",
			-- 	callback = function()
			-- 		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			-- 	end,
			-- })
		end,
	},

	-- enhanced matchparen
	{ "lewis6991/nvim-treesitter-pairs" },
}
