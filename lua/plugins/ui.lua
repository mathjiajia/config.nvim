return {

	-- colorschemes
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	priority = 1000,
	-- 	-- opts = { style = "night" },
	-- 	config = function()
	-- 		require("tokyonight").setup({
	-- 			style = "night",
	-- 			transparent = true,
	-- 		})
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end,
	-- },
	{
		"ribru17/bamboo.nvim",
		priority = 1000,
		config = function()
			require("bamboo").setup()
			require("bamboo").load()
		end,
	},
	-- {
	-- 	"Mofiqul/vscode.nvim",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		vim.cmd.colorscheme("vscode")
	-- 	end,
	-- },
	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- 	config = function()
	-- 		vim.cmd.colorscheme("onedark")
	-- 	end,
	-- },
	-- {
	-- 	"catppuccin/nvim",
	-- 	name = "catppuccin",
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("catppuccin").setup({
	-- 			-- flavour = "latte", -- latte, frappe, macchiato, mocha
	-- 			-- transparent_background = true,
	-- 			term_colors = true,
	-- 			dim_inactive = {
	-- 				enabled = true,
	-- 				shade = "dark",
	-- 				percentage = 0.15,
	-- 			},
	-- 			styles = {
	-- 				comments = { "italic" },
	-- 				conditionals = { "italic" },
	-- 				loops = {},
	-- 				functions = {},
	-- 				keywords = {},
	-- 				strings = {},
	-- 				variables = {},
	-- 				numbers = {},
	-- 				booleans = {},
	-- 				properties = {},
	-- 				types = {},
	-- 				operators = {},
	-- 			},
	-- 			integrations = {
	-- 				alpha = false,
	-- 				dap = false,
	-- 				dap_ui = false,
	-- 				diffview = true,
	-- 				lsp_saga = true,
	-- 				markdown = false,
	-- 				neogit = false,
	-- 				nvimtree = false,
	-- 				ufo = false,
	-- 				treesitter_context = false,
	-- 				illuminate = { enabled = false },
	-- 			},
	-- 		})
	--
	-- 		-- setup must be called before loading
	-- 		vim.cmd.colorscheme("catppuccin")
	-- 	end,
	-- },

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
	{
		"luukvbaal/statuscol.nvim",
		config = true,
	},

	-- statusline/tabline
	{
		"rebelot/heirline.nvim",
		dependencies = {
			"Zeioth/heirline-components.nvim",
			opts = { icons = { ActiveLSP = "◍" } },
		},
		config = function()
			local heirline = require("heirline")
			local lib = require("heirline-components.all")

			local opts = {
				tabline = { -- UI upper bar
					lib.component.tabline_conditional_padding(),
					lib.component.tabline_buffers(),
					lib.component.fill({ hl = { bg = "tabline_bg" } }),
					lib.component.tabline_tabpages(),
				},
				statusline = { -- UI statusbar
					hl = { fg = "fg", bg = "bg" },
					lib.component.mode(),
					lib.component.git_branch(),
					lib.component.file_info(),
					lib.component.git_diff(),
					lib.component.diagnostics(),
					lib.component.fill(),
					lib.component.cmd_info(),
					lib.component.fill(),
					lib.component.lsp({ lsp_progress = false }),
					lib.component.virtual_env(),
					lib.component.nav(),
					lib.component.mode({ surround = { separator = "right" } }),
				},
			}

			-- Setup
			lib.init.subscribe_to_events()
			heirline.load_colors(lib.hl.get_colors())
			heirline.setup(opts)

			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "HeirlineComponentsTablineBuffersUpdated",
				callback = function()
					if #vim.t.bufs > 1 then
						vim.opt.showtabline = 2
					else
						vim.opt.showtabline = 1
					end
				end,
			})
		end,
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
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
		event = { "VeryLazy" },
		---@module "noice"
		---@class NoiceConfig
		opts = {
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
		},
		-- stylua: ignore
		keys = {
			{ "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
			{ "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
		},
	},

	-- start screen
	{
		"nvimdev/dashboard-nvim",
		opts = {
			config = {
				week_header = { enable = true },
				disable_move = true,
				-- stylua: ignore
				shortcut = {
					{ desc = "󰚰 Update", group = "Identifier", action = "Lazy update", key = "u" },
					{ desc = "󰀶 Files", group = "Directory", action = "Telescope find_files", key = "f" },
					{ desc = " Quit", group = "String", action = function() vim.api.nvim_input("<Cmd>qa<CR>") end, key = "q" },
				},
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
	{ "nvim-tree/nvim-web-devicons", lazy = true },
}
