return {

	-- better vim.notify
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	-- highlight patterns in text
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		config = function()
			local hi = require("mini.hipatterns")
			hi.setup({
				highlighters = {
					hex_color = hi.gen_highlighter.hex_color(),
				},
			})
		end,
	},

	-- winbar
	{
		"Bekaboo/dropbar.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- statuscolumn
	{
		"luukvbaal/statuscol.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- statusline/tabline
	{
		"rebelot/heirline.nvim",
		event = "VeryLazy",
		config = function()
			require("util.heirline")
		end,
	},

	-- lazy
	-- {
	-- 	"sontungexpt/sttusline",
	-- 	branch = "table_version",
	-- 	event = "BufEnter",
	-- 	config = true,
	-- },

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
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
				scope = { highlight = highlight },
				exclude = {
					filetypes = { "conf", "markdown" },
				},
			})

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},

	-- minimap
	{
		"gorbit99/codewindow.nvim",
		keys = {
			{
				"<leader>mm",
				function()
					require("codewindow").toggle_minimap()
				end,
				desc = "Toggle Minimap",
			},
			{
				"<leader>mf",
				function()
					require("codewindow").toggle_focus()
				end,
				desc = "Focus Minimap",
			},
		},
		opts = {
			show_cursor = false,
			screen_bounds = "background",
			window_border = "none",
		},
	},

	-- noicer ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				hover = { enabled = false },
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
			},
		},
		keys = {
			{
				"<C-f>",
				function()
					if not require("noice.lsp").scroll(4) then
						return "<C-f>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll forward",
				mode = { "i", "n", "s" },
			},
			{
				"<C-b>",
				function()
					if not require("noice.lsp").scroll(-4) then
						return "<C-b>"
					end
				end,
				silent = true,
				expr = true,
				desc = "Scroll backward",
				mode = { "i", "n", "s" },
			},
		},
	},

	-- start screen
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = {
			config = {
				disable_move = true,
				shortcut = {
					{ desc = "󰚰 Update", group = "Identifier", action = "Lazy update", key = "u" },
					{ desc = "󰀶 Files", group = "Directory", action = "Telescope find_files", key = "f" },
					{ desc = " Quit", group = "String", action = "quitall", key = "q" },
				},
				project = { limit = 4 },
				mru = { cwd_only = true },
			},
			preview = {
				command = "cat",
				file_path = (vim.fn.stdpath("config") .. "/neovim.cat"),
				file_height = 10,
				file_width = 70,
			},
		},
	},

	-- edgy
	{
		"folke/edgy.nvim",
		event = "VeryLazy",
		-- stylua: ignore
		keys = {
			{ "<leader>ue", function() require("edgy").toggle() end, desc = "Edgy Toggle" },
			{ "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
		},
		opts = {
			bottom = {
				{
					ft = "noice",
					size = { height = 0.4 },
					filter = function(_, win)
						return vim.api.nvim_win_get_config(win).relative == ""
					end,
				},
				{
					ft = "lazyterm",
					title = "LazyTerm",
					size = { height = 0.4 },
					filter = function(buf)
						return not vim.b[buf].lazyterm_cmd
					end,
				},
				{ ft = "qf", title = "QuickFix" },
				{
					ft = "help",
					size = { height = 20 },
					-- don't open help files in edgy that we're editing
					filter = function(buf)
						return vim.bo[buf].buftype == "help"
					end,
				},
				{ title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
			},
			left = {
				{
					title = "Neo-Tree",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "filesystem"
					end,
					pinned = true,
					open = function()
						require("neo-tree.command").execute({ dir = require("util").root() })
					end,
					size = { height = 0.5 },
				},
				{
					title = "Neo-Tree Git",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "git_status"
					end,
					pinned = true,
					open = "Neotree position=right git_status",
				},
				{
					title = "Neo-Tree Buffers",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "buffers"
					end,
					pinned = true,
					open = "Neotree position=top buffers",
				},
				"neo-tree",
			},
			right = {
				{
					title = "Aerial",
					ft = "aerial",
					pinned = true,
					open = function()
						require("aerial").open()
					end,
				},
			},
			keys = {
				["<M-Right>"] = function(win)
					win:resize("width", 2)
				end,
				["<M-Left>"] = function(win)
					win:resize("width", -2)
				end,
				["<M-Up>"] = function(win)
					win:resize("height", 2)
				end,
				["<M-Down>"] = function(win)
					win:resize("height", -2)
				end,
			},
		},
	},

	-- better quickfix
	-- {
	-- 	"kevinhwang91/nvim-bqf",
	-- 	ft = "qf",
	-- 	dependencies = {
	-- 		"junegunn/fzf",
	-- 		build = function()
	-- 			vim.fn["fzf#install"]()
	-- 		end,
	-- 	},
	-- 	opts = {
	-- 		preview = {
	-- 			win_height = 5,
	-- 			win_vheight = 5,
	-- 		},
	-- 	},
	-- },

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
		dependencies = { "folke/twilight.nvim", config = true },
		opts = { plugins = { gitsigns = true } },
	},

	{
		"HiPhish/rainbow-delimiters.nvim",
		event = { "BufReadPost", "BufNewFile" },
		init = function()
			vim.g.rainbow_delimiters = { query = { latex = "rainbow-delimiters" } }
		end,
	},

	-- Enhanced matchparen
	{
		"utilyre/sentiment.nvim",
		event = "BufReadPost",
		config = true,
	},

	-- icons
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },
}
