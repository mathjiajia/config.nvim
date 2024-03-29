return {

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		keys = { "<M-g>", "<M-i>", "<M-r>" },
		config = function()
			require("toggleterm").setup({
				float_opts = { border = "rounded" },
			})

			local Terminal = require("toggleterm.terminal").Terminal

			local lazygit = Terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				hidden = true,
				direction = "float",
				float_opts = { width = vim.o.columns, height = vim.o.lines },
			})
			local btop = Terminal:new({
				cmd = "btop",
				hidden = true,
				direction = "float",
				float_opts = { width = vim.o.columns, height = vim.o.lines },
			})

			local cmd = require("code_runner.commands").get_filetype_command()
			local code_runner = Terminal:new({ cmd = cmd, hidden = true, direction = "float", close_on_exit = false })

			-- stylua: ignore start
			vim.keymap.set({ "n", "t" }, "<M-g>", function() lazygit:toggle() end, { desc = "Toggle Lazygit" })
			vim.keymap.set({ "n", "t" }, "<M-i>", function() btop:toggle() end, { desc = "Toggle btop" })
			vim.keymap.set("n", "<M-r>", function() code_runner:open() end, { desc = "Code Runner" })
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
				markdown = "glow",
				python = "python3 -u",
				swift = "swift",
			},
		},
	},

	-- library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
}
