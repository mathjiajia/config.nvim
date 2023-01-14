return {

	-- better vim.notify
	{
		"rcarriga/nvim-notify",
		init = function()
			-- lazy-load notify here. Will be overriden by Noice when it loads
			---@diagnostic disable-next-line: duplicate-set-field
			vim.notify = function(...)
				return require("notify").notify(...)
			end
		end,
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
	},

	-- better vim.ui
	{
		"stevearc/dressing.nvim",
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

	-- floating winbar
	-- {
	-- 	"b0o/incline.nvim",
	-- 	opts = {
	-- 		window = { margin = { vertical = 0, horizontal = 1 } },
	-- 		render = function(props)
	-- 			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
	-- 			local icon, color = require("nvim-web-devicons").get_icon_color(filename)
	-- 			return { { icon, guifg = color }, { " " }, { filename } }
	-- 		end,
	-- 	},
	-- 	event = "BufReadPre",
	-- },

	{
		"luukvbaal/statuscol.nvim",
		opts = { setopt = true },
		event = "UIEnter",
	},

	-- statusline/tabline
	{
		"rebelot/heirline.nvim",
		config = function()
			require("util.heirline")
		end,
		event = "UIEnter",
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		opts = {
			use_treesitter = true,
			show_trailing_blankline_indent = false,
			filetype_exclude = require("config").ft_exclude,
		},
		event = "BufReadPre",
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = require("config").ft_exclude,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
		opts = { options = { try_as_border = true } },
		event = "BufReadPre",
	},

	-- noicer ui
	{
		"folke/noice.nvim",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
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
			{ "<c-f>", function()
				if not require("noice.lsp").scroll(4) then return "<c-f>" end
			end, silent = true, expr = true, desc = "Scroll forward" },
			{ "<c-b>", function()
				if not require("noice.lsp").scroll(-4) then return "<c-b>" end
			end, silent = true, expr = true, desc = "Scroll backward" },
		},
		event = "VeryLazy",
	},

	-- start screen
	{
		"goolord/alpha-nvim",
		opts = function()
			local startify = require("alpha.themes.startify")

			startify.section.top_buttons.val = {
				startify.button("e", "New file", "<cmd>ene <BAR> startinsert<CR>"),
			}
			startify.section.bottom_buttons.val = {
				startify.button("u", "Update Plugins", "<cmd>Lazy update<CR>"),
				startify.button("q", "Quit", "<cmd>q<CR>"),
			}

			startify.config.layout = {
				startify.section.top_buttons,
				startify.section.mru_cwd,
				startify.section.mru,
				{ type = "padding", val = 1 },
				startify.section.bottom_buttons,
			}
			return startify.config
		end,
		config = function(_, opts)
			require("alpha").setup(opts)
		end,
		event = "VimEnter",
	},

	-- better quickfix
	{
		"kevinhwang91/nvim-bqf",
		dependencies = {
			"junegunn/fzf",
			-- stylua: ignore
			build = function() vim.fn["fzf#install"]() end,
		},
		opts = { preview = { win_height = 5, win_vheight = 5 } },
		ft = "qf",
	},

	-- Zen mode
	{
		"folke/zen-mode.nvim",
		opts = {
			plugins = {
				gitsigns = true,
				kitty = { enabled = false, font = "+2" },
			},
		},
		cmd = "ZenMode",
	},

	-- alternative to matchparen neovim plugin
	{
		"monkoose/matchparen.nvim",
		config = true,
		event = "BufReadPost",
	},

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- ui components
	"MunifTanjim/nui.nvim",
}
