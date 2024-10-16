return {

	{
		"bamboo.nvim",
		colorscheme = "bamboo",
		after = function()
			require("bamboo").setup({ transparent = true })
		end,
	},

	{
		"nvim-notify",
		after = function()
			---@diagnostic disable-next-line: missing-fields
			require("notify").setup({
				max_height = function()
					return math.floor(vim.o.lines * 0.75)
				end,
				max_width = function()
					return math.floor(vim.o.columns * 0.75)
				end,
				on_open = function(win)
					vim.api.nvim_win_set_config(win, { zindex = 100 })
				end,
				timeout = 3000,
			})

			-- stylua: ignore
			vim.keymap.set("n", "<leader>un", function() require("notify").dismiss({ silent = true, pending = true }) end, { desc = "Delete All Notifications" } )
		end,
	},

	{
		"dressing.nvim",
		after = function()
			require("dressing").setup()
		end,
	},

	{
		"nvim-highlight-colors",
		after = function()
			require("nvim-highlight-colors").setup({ exclude_buftypes = { "nofile" } })
		end,
	},

	{
		"dropbar.nvim",
		after = function()
			require("dropbar").setup()
		end,
	},

	{
		"statuscol.nvim",
		after = function()
			require("statuscol").setup()
		end,
	},

	{
		"heirline.nvim",
		after = function()
			require("configs.heirline")
		end,
	},

	{
		"indent-blankline.nvim",
		after = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require("ibl.hooks")
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup({
				exclude = { filetypes = { "conf", "dashboard", "markdown" } },
				scope = { highlight = highlight },
			})

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},

	{
		"noice.nvim",
		after = function()
			require("noice").setup({
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				routes = {
					{
						filter = {
							event = "msg_show",
							any = {
								{ find = "%d+L, %d+B" },
								{ find = "; after #%d+" },
								{ find = "; before #%d+" },
							},
						},
						view = "mini",
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					lsp_doc_border = true,
				},
			})

			-- stylua: ignore start
			vim.keymap.set({ "i", "n", "s" }, "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, { silent = true, expr = true, desc = "Scroll Forward" })
			vim.keymap.set({ "i", "n", "s" }, "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, { silent = true, expr = true, desc = "Scroll Backward" })
		end,
	},

	{
		"dashboard-nvim",
		after = function()
			require("dashboard").setup({
				disable_move = true,
				shuffle_letter = true,
				config = {
					week_header = { enable = true },
					packages = { enable = false },
					-- stylua: ignore
					shortcut = {
						{ desc = " Files", group = "Directory", action = "FzfLua files", key = "f" },
						{ desc = "󰤖 Directory", group = "Float", action = "Oil --float", key = "d" },
						{ desc = " Quit", group = "String", action = function() vim.api.nvim_input("<Cmd>qa<CR>") end, key = "q" },
					},
					project = { action = "FzfLua files cwd=" },
					mru = { cwd_only = true },
				},
			})
		end,
	},

	{
		"zen-mode.nvim",
		cmd = "ZenMode",
		before = function()
			require("twilight").setup()
		end,
		after = function()
			require("zen-mode").setup({ plugins = { gitsigns = { enabled = false } } })
		end,
	},

	{
		"rainbow-delimiters.nvim",
		before = function()
			vim.g.rainbow_delimiters = { query = { latex = "rainbow-delimiters" } }
		end,
	},

	{
		"mini.icons",
		after = function()
			require("mini.icons").setup({
				lsp = {
					["function"] = { glyph = "" },
					object = { glyph = "" },
					value = { glyph = "" },
				},
			})
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
}
