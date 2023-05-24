return {

	-- better vim.notify
	{
		"rcarriga/nvim-notify",
		init = function()
			-- when noice is not enabled, install notify on VeryLazy
			local Util = require("util")
			if not Util.has("noice.nvim") then
				Util.on_very_lazy(function()
					vim.notify = require("notify")
				end)
			end
		end,
		config = true,
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

	-- winbar
	{
		"utilyre/barbecue.nvim",
		opts = { show_modified = true },
		dependencies = { "SmiteshP/nvim-navic" },
		event = "UIEnter",
	},

	-- statuscolumn
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
		event = { "BufReadPost", "BufNewFile" },
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = require("config").ft_exclude,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		opts = { options = { try_as_border = true } },
		event = { "BufReadPre", "BufNewFile" },
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
			routes = {
				{
					filter = {
						event = "msg_show",
						find = "%d+L, %d+B",
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
			{ "<c-f>", function()
				if not require("noice.lsp").scroll(4) then return "<c-f>" end
			end, silent = true, expr = true, desc = "Scroll forward", mode = { "i", "n", "s" } },
			{ "<c-b>", function()
				if not require("noice.lsp").scroll(-4) then return "<c-b>" end
			end, silent = true, expr = true, desc = "Scroll backward", mode = { "i", "n", "s" } },
		},
		event = "VeryLazy",
	},

	-- start screen
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = {
			theme = "hyper",
			config = {
				week_header = { enable = true },
				shortcut = {
					{ desc = "󰚰 Update", group = "@property", action = "Lazy update", key = "u" },
					{ desc = " Files", group = "Label", action = "Telescope find_files", key = "f" },
					{ desc = " NeoVim", group = "", action = "Telescope find_files cwd=~/.config/nvim", key = "n" },
					{ desc = " Quit", group = "Number", action = "quitall", key = "q" },
				},
			},
		},
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
		opts = { plugins = { gitsigns = true } },
		cmd = "ZenMode",
	},

	-- Enhanced matchparen
	{
		"utilyre/sentiment.nvim",
		config = true,
		event = "BufReadPost",
	},

	-- icons
	"nvim-tree/nvim-web-devicons",

	-- ui components
	"MunifTanjim/nui.nvim",
}
