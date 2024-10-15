return {

	{
		"toggleterm.nvim",
		cmd = { "ToggleTerm" },
		keys = {
			{ "<C-Bslash>", desc = "Toggle Term" },
			{ "<M-g>", desc = "Toggle Lazygit" },
			{ "<M-i>", desc = "Toggle btop" },
			{ "<M-r>", desc = "Code Runner" },
		},
		after = function()
			require("toggleterm").setup({
				open_mapping = "<C-Bslash>",
				float_opts = { border = "rounded" },
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local float_opts = { width = vim.o.columns, height = vim.o.lines }

			local lazygit = Terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				hidden = true,
				direction = "float",
				float_opts = float_opts,
			})
			local btop = Terminal:new({
				cmd = "btop",
				hidden = true,
				direction = "float",
				float_opts = float_opts,
			})

			local cmd = require("code_runner.commands").get_filetype_command()
			local code_runner = Terminal:new({ cmd = cmd, hidden = true, direction = "float", close_on_exit = false })

			-- stylua: ignore start
			vim.keymap.set({ "n", "t" }, "<M-g>", function() lazygit:toggle() end )
			vim.keymap.set({ "n", "t" }, "<M-i>", function() btop:toggle() end )
			vim.keymap.set("n", "<M-r>", function() code_runner:open() end )
		end,
	},

	{
		"resession.nvim",
		after = function()
			require("resession").setup({})
		end,
		-- stylua: ignore
		keys = {
			{ "<leader>ss", function() require("resession").save() end, desc = "Save Session" },
			{ "<leader>sl", function() require("resession").load() end, desc = "Load Session" },
			{ "<leader>sd", function() require("resession").delete() end, desc = "Delete Session" },
		},
	},

	{
		"code_runner.nvim",
		cmd = { "RunCode", "RunFile", "RunProject" },
		after = function()
			require("code_runner").setup({
				filetype = {
					lua = "nvim -l",
					python = "python3 -u",
					swift = "swift",
				},
			})
		end,
	},
}
