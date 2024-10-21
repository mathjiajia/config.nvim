return {

	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},
	{ "nvchad/volt", lazy = true },
	{ "nvchad/menu", lazy = true },
	{ "nvchad/minty", cmd = { "Shades", "Huefy" } },
	{ "nvchad/timerly", cmd = "TimerlyToggle" },
	{ "nvchad/showkeys", cmd = "ShowkeysToggle" },

	{
		"rcarriga/nvim-notify",
		config = function()
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

			-- stylua: ignore start
			vim.keymap.set("n", "<leader>tn", function() require("notify").dismiss({ silent = true, pending = true }) end, { desc = "Delete All Notifications" })
		end,
	},

	{ "stevearc/dressing.nvim", config = true },

	{ "Bekaboo/dropbar.nvim", config = true },

	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
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

			require("ibl").setup({
				exclude = { filetypes = { "conf", "dashboard", "markdown" } },
				scope = {
					highlight = {
						"RainbowRed",
						"RainbowYellow",
						"RainbowBlue",
						"RainbowOrange",
						"RainbowGreen",
						"RainbowViolet",
						"RainbowCyan",
					},
				},
			})
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},

	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				lsp = {
					signature = { enabled = false },
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

			vim.keymap.set({ "n", "i", "s" }, "<C-f>", function()
				if not require("noice.lsp").scroll(4) then
					return "<C-f>"
				end
			end, { silent = true, expr = true })
			vim.keymap.set({ "n", "i", "s" }, "<C-b>", function()
				if not require("noice.lsp").scroll(-4) then
					return "<C-b>"
				end
			end, { silent = true, expr = true })
		end,
	},

	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		dependencies = { "folke/twilight.nvim", config = true },
		---@module "zen-mode"
		---@type ZenOptions
		opts = { plugins = { gitsigns = { enabled = false } } },
	},

	{ "HiPhish/rainbow-delimiters.nvim" },

	{
		"echasnovski/mini.icons",
		config = function()
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
