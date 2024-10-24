return {

	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		keys = {
			{ "<C-Bslash>", desc = "Toggle Terminal", mode = { "n", "i" } },
			{ "<leader>tg", desc = "Toggle Lazygit" },
			{ "<leader>ti", desc = "Toggle btop" },
		},
		config = function()
			require("toggleterm").setup({
				open_mapping = "<C-Bslash>",
				float_opts = { border = "rounded" },
			})

			local Terminal = require("toggleterm.terminal").Terminal
			local float_opts = { width = vim.o.columns, height = vim.o.lines }

			local btop = Terminal:new({ cmd = "btop", hidden = true, direction = "float", float_opts = float_opts })
			local lazygit = Terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				hidden = true,
				direction = "float",
				float_opts = float_opts,
			})

			-- stylua: ignore start
			vim.keymap.set({ "n", "t" }, "<leader>ti", function() btop:toggle() end )
			vim.keymap.set({ "n", "t" }, "<leader>tg", function() lazygit:toggle() end )
		end,
	},

	{
		"stevearc/resession.nvim",
		config = true,
		-- stylua: ignore
		keys = {
			{ "<leader>ss", function() require("resession").save() end, desc = "Save Session" },
			{ "<leader>sl", function() require("resession").load() end, desc = "Load Session" },
			{ "<leader>sd", function() require("resession").delete() end, desc = "Delete Session" },
		},
	},

	{
		"stevearc/overseer.nvim",
		keys = {
			{ "<leader>rf", "<Cmd>OverseerRun RunFile<CR>", silent = true, desc = "Run File" },
			{ "<leader>rr", "<Cmd>OverseerRun OpenREPL<CR>", silent = true, desc = "Open REPL" },
		},
		---@module "overseer"
		---@type overseer.Config
		opts = {
			templates = { "builtin", "user.builder", "user.runner" },
			strategy = "toggleterm",
			dap = false,
		},
	},

	{
		"michaelb/sniprun",
		build = "sh ./install.sh",
		keys = { { "<leader>rs", "<Plug>SnipRun", mode = { "n", "v" }, silent = true, desc = "Snip Run" } },
		opts = {
			selected_interpreters = { "Generic", "Lua_nvim", "Python3_fifo" },
			repl_enable = { "Bash_original", "Lua_nvim", "Python3_fifo", "R_original" },
			interpreter_options = {
				Generic = {
					Swift_original = {
						supported_filetypes = { "swift" },
						extension = ".swift",
						interpreter = "swift",
						boilerplate_pre = "import Foundation",
					},
				},
			},
			display = { "VirtualTextOk", "VirtualTextErr", "Terminal" },
		},
	},
}
