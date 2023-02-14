return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = { "HiPhish/nvim-ts-rainbow2" },
	config = function(_, opts)
		-- Folding
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
		vim.opt.foldenable = false

		-- require("nvim-treesitter.install").compilers = { "gcc-12" }
		require("nvim-treesitter.configs").setup(opts)
	end,
	opts = {
		ensure_installed = require("config").ts_install,
		highlight = { enable = true },
		incremental_selection = { enable = true },
		indent = { enable = true },
		rainbow = {
			enable = true,
			query = { latex = "rainbow-parens" },
		},
	},
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
}
