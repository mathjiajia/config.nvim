return {

	-- colorschemes
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "storm",
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	{
		"ribru17/bamboo.nvim",
		priority = 1000,
		config = function()
			require("bamboo").setup({ transparent = true })
			require("bamboo").load()
		end,
	},

	-- better vim.notify
	{
		"rcarriga/nvim-notify",
		-- stylua: ignore
		keys = { { "<leader>un", function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "Delete All Notifications" } },
		---@module "notify"
		---@class notify.Config
		opts = {
			-- background_colour = "#000000",
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
		},
	},

	-- better vim.ui
	{ "stevearc/dressing.nvim", config = true },

	-- highlight patterns in text
	{
		"brenoprata10/nvim-highlight-colors",
		opts = { exclude_buftypes = { "nofile" } },
	},

	-- winbar
	{ "Bekaboo/dropbar.nvim", config = true },

	-- statuscolumn
	{ "luukvbaal/statuscol.nvim", config = true },

	-- statusline
	{
		"sschleemilch/slimline.nvim",
		opts = {
			verbose_mode = true,
			style = "fg",
			hl = {
				base = "StatusLine",
				primary = "StatusLine",
				secondary = "StatusLine",
			},
		},
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@type ibl.config
		opts = {
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
		},
		config = function(_, opts)
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

			vim.g.rainbow_delimiters = { highlight = opts.highlight }
			require("ibl").setup(opts)

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},

	-- noicer ui
	{
		"folke/noice.nvim",
		config = function()
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

	-- start screen
	{
		"mathjiajia/dashboard-nvim",
		branch = "mini-icons",
		opts = {
			config = {
				week_header = { enable = true },
				disable_move = true,
				-- stylua: ignore
				shortcut = {
					{ desc = "󰚰 Update", group = "Identifier", action = "Lazy update", key = "u" },
					{ desc = "󰀶 Files", group = "Directory", action = "FzfLua files", key = "f" },
					{ desc = " Quit", group = "String", action = function() vim.api.nvim_input("<Cmd>qa<CR>") end, key = "q" },
				},
				project = { action = "FzfLua files cwd=" },
				mru = { cwd_only = true },
			},
			-- preview = {
			-- 	command = "cat",
			-- 	file_path = vim.fn.stdpath("config") .. "/neovim.cat",
			-- 	file_height = 10,
			-- 	file_width = 70,
			-- },
		},
	},

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		dependencies = { "folke/twilight.nvim", config = true },
		---@module "zen-mode"
		---@class ZenOptions
		opts = { plugins = { gitsigns = true } },
	},

	-- rainbow delimiters
	{
		"HiPhish/rainbow-delimiters.nvim",
		submodules = false,
		init = function()
			vim.g.rainbow_delimiters = { query = { latex = "rainbow-delimiters" } }
		end,
	},

	-- icons
	{
		"echasnovski/mini.icons",
		lazy = true,
		config = function()
			local mini_icons = require("mini.icons")
			mini_icons.mock_nvim_web_devicons()
			mini_icons.setup({
				lsp = {
					["function"] = { glyph = "" },
					object = { glyph = "" },
					value = { glyph = "" },
				},
			})
		end,
	},
}
