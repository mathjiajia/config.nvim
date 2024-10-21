return {

	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		keys = {
			{ "<C-Bslash>", desc = "Toggle Term" },
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
			{ "<leader>rf", "<Cmd>OverseerRun RunFile<CR>", silent = true },
			{ "<leader>rr", "<Cmd>OverseerRun OpenREPL<CR>", silent = true },
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

	{
		"folke/which-key.nvim",
		-- keys = { "<leader>", "<c-w>", "[", "]", "g", "y", "z" },
		opts = {
			spec = {
				{
					{ "<leader>b", group = "buffer", icon = " " },
					{ "<leader>c", group = "code", icon = " " },
					{ "<leader>d", group = "dap", icon = " " },
					{ "<leader>f", group = "file/find" },
					{ "<leader>h", group = "hunks", icon = " " },
					{ "<leader>q", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
					{ "<leader>r", group = "runners", icon = " " },
					{ "<leader>s", group = "search" },
					{ "<leader>t", group = "toggle" },
					{ "<C-w>", group = "window" },
					{ "[", group = "prev" },
					{ "]", group = "next" },
					{ "g", group = "goto" },
					{ "gr", group = "lsp" },
					{ "ys", group = "surround" },
					{ "z", group = "fold" },
				},
				{
					mode = "v",
					{ "<leader>c", group = "format" },
					{ "<leader>d", group = "dap", icon = " " },
					{ "<leader>h", group = "hunks", icon = " " },
					{ "<leader>r", group = "runners", icon = " " },
					{ "<leader>s", group = "search" },
				},
			},
		},
	},
}
