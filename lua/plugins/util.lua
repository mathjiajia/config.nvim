return {

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		keys = { "<C-Bslash>", "<M-r>" },
		config = function()
			require("toggleterm").setup({
				open_mapping = "<C-Bslash>",
				float_opts = { border = "rounded" },
			})

			vim.keymap.set("n", "<M-r>", function()
				require("toggleterm.terminal").Terminal
					:new({
						cmd = require("code_runner.commands").get_filetype_command(),
						hidden = true,
						direction = "float",
						close_on_exit = false,
					})
					:open()
			end, { desc = "Code Runner" })
		end,
	},

	-- session management
	{
		"glepnir/dbsession.nvim",
		cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
		config = true,
	},

	-- code runner
	{
		"CRAG666/code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunProject" },
		opts = {
			filetype = {
				lua = "nvim -l",
				python = "python3 -u",
				swift = "swift",
			},
		},
	},

	-- library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
}
