return {

	{
		"toggleterm.nvim",
		-- cmd = { "ToggleTerm" },
		-- keys = {
		-- 	{ "<C-Bslash>", desc = "Toggle Term" },
		-- 	{ "<M-g>", desc = "Toggle Lazygit" },
		-- 	{ "<M-i>", desc = "Toggle btop" },
		-- 	{ "<M-r>", desc = "Code Runner" },
		-- },
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

			-- stylua: ignore start
			vim.keymap.set({ "n", "t" }, "<M-g>", function() lazygit:toggle() end )
			vim.keymap.set({ "n", "t" }, "<M-i>", function() btop:toggle() end )
		end,
	},

	{
		"overseer.nvim",
		ft = { "bash", "c", "cpp", "lua", "markdown", "python", "r", "sh", "swift" },
		after = function()
			require("overseer").setup({
				templates = { "builtin", "user.builder", "user.runner" },
				strategy = "toggleterm",
			})

			vim.keymap.set("n", "<leader>rf", "<Cmd>OverseerRun RunFile<CR>", { silent = true })
			vim.keymap.set("n", "<leader>rr", "<Cmd>OverseerRun OpenREPL<CR>", { silent = true })
		end,
	},

	{
		"sniprun",
		ft = { "bash", "c", "cpp", "lua", "markdown", "python", "r", "sh", "swift" },
		after = function()
			require("sniprun").setup({
				selected_interpreters = { "Generic", "Lua_nvim", "Python3_fifo" },
				repl_enable = {
					"Bash_original",
					"Lua_nvim",
					"Mathematica_original",
					"Python3_fifo",
					"R_original",
					"Swift_original",
				},

				interpreter_options = {
					Generic = {
						Swift_original = {
							supported_filetypes = { "swift" },
							extension = ".swift",
							interpreter = "swift",
							boilerplate_pre = "import Foundation",
						},
					},
					-- Python3_fifo = {
					-- 	interpreter = "python",
					-- 	venv = { "venv_project1", "venv_project2", "../venv_project2" },
					-- },
					Mathematica_original = { interpreter = "wolframscript" },
				},

				display = {
					-- "Classic",
					"VirtualTextOk",
					"VirtualTextErr",
					"Terminal",
				},
			})

			vim.keymap.set("v", "<M-r>", "<Plug>SnipRun", { silent = true })
			vim.keymap.set("n", "<M-r>", "<Plug>SnipRun", { silent = true })
			-- vim.api.nvim_set_keymap("n", "<leader>f", "<Plug>SnipRunOperator", { silent = true })
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
}
