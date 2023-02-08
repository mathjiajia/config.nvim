return {

	-- measure startuptime
	{
		"dstein64/vim-startuptime",
		enabled = false,
		config = function()
			vim.g.startuptime_tries = 10
		end,
		cmd = "StartupTime",
	},

	-- session management
	{
		"folke/persistence.nvim",
		enabled = false,
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
		event = "BufReadPre",
		-- stylua: ignore
		keys = {
			{ "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
			{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
			{ "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
		},
	},

	-- library used by other plugins
	"nvim-lua/plenary.nvim",
	"kkharji/sqlite.lua",
}
