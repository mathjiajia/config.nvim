return {

	-- terminal
	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		keys = { "<M-g>", "<M-i>" },
		config = function()
			require("toggleterm").setup({
				float_opts = { border = "rounded" },
			})

			local Terminal = require("toggleterm.terminal").Terminal

			local lazygit = Terminal:new({ cmd = "lazygit", dir = "git_dir", hidden = true, direction = "float" })
			local btop = Terminal:new({ cmd = "btop", hidden = true, direction = "float" })

			-- stylua: ignore start
			vim.keymap.set({ "n", "t" }, "<M-g>", function() lazygit:toggle() end, { desc = "Toggle Lazygit" })
			vim.keymap.set({ "n", "t" }, "<M-i>", function() btop:toggle() end, { desc = "Toggle btop" })
		end,
	},

	-- session management
	{
		"glepnir/dbsession.nvim",
		config = true,
		cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
	},

	-- code runner
	{
		"CRAG666/code_runner.nvim",
		opts = {
			filetype = {
				lua = "nvim -l",
				markdown = "glow",
				python = "python3 -u",
				swift = "swift",
			},
		},
		-- stylua: ignore
		keys = { { "<M-r>", function() require("code_runner.commands").run_filetype() end, desc = "Run file" } },
		cmd = { "RunCode", "RunFile", "RunProject" },
	},

	-- library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
}
