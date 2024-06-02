return {

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		keys = {
			{ "<C-Bslash>", desc = "Toggle Term" },
			{ "<M-g>", desc = "Toggle Lazygit" },
			{ "<M-i>", desc = "Toggle btop" },
			{ "<M-r>", desc = "Code Runner" },
		},
		config = function()
			require("toggleterm").setup({
				open_mapping = "<C-Bslash>",
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
 			vim.keymap.set({ "n", "t" }, "<M-g>", function() lazygit:toggle() end )
 			vim.keymap.set({ "n", "t" }, "<M-i>", function() btop:toggle() end )
 			vim.keymap.set("n", "<M-r>", function() code_runner:open() end )
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
