local api = vim.api

return {

	-- better vim.notify
	{
		"rcarriga/nvim-notify",
		config = true,
		-- stylua: ignore
		keys = { { "<leader>un", function() require("notify").dismiss({ silent = true, pending = true }) end, desc = "Delete all Notifications" } },
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

	-- highlight patterns in text
	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		config = function()
			local hi = require("mini.hipatterns")
			hi.setup({
				highlighters = {
					-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
					fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
					hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
					todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
					note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

					-- Highlight hex color strings (`#rrggbb`) using that color
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
		opts = { setopt = true },
	},

	-- statusline/tabline
	{
		"rebelot/heirline.nvim",
		event = "VeryLazy",
		config = function()
			require("util.heirline")
		end,
	},

	-- indent guides for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			-- use_treesitter = true,
			show_trailing_blankline_indent = false,
			filetype_exclude = require("config").ft_exclude,
		},
	},

	-- active indent guide and indent text objects
	{
		"echasnovski/mini.indentscope",
		event = { "BufReadPre", "BufNewFile" },
		init = function()
			api.nvim_create_autocmd("FileType", {
				pattern = require("config").ft_exclude,
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
		opts = { options = { try_as_border = true } },
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
			{ "<C-f>", function() if not require("noice.lsp").scroll(4) then return "<C-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
			{ "<C-b>", function() if not require("noice.lsp").scroll(-4) then return "<C-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"} },
		},
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
						return api.nvim_win_get_config(win).relative == ""
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
				{ ft = "spectre_panel", size = { height = 0.4 } },
			},
			left = {
				-- Neo-tree filesystem always takes half the screen height
				{
					title = "Neo-Tree",
					ft = "neo-tree",
					filter = function(buf)
						return vim.b[buf].neo_tree_source == "filesystem"
					end,
					pinned = true,
					open = "Neotree",
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
				{
					title = "Aerial",
					ft = "aerial",
					pinned = true,
					open = "AerialToggle",
				},
				-- any other neo-tree windows
				"neo-tree",
			},
			keys = {
				-- increase width
				["<M-Right>"] = function(win)
					win:resize("width", 2)
				end,
				-- decrease width
				["<M-Left>"] = function(win)
					win:resize("width", -2)
				end,
				-- increase height
				["<M-Up>"] = function(win)
					win:resize("height", 2)
				end,
				-- decrease height
				["<M-Down>"] = function(win)
					win:resize("height", -2)
				end,
			},
		},
	},

	-- better quickfix
	-- {
	-- 	"kevinhwang91/nvim-bqf",
	-- 	opts = { preview = { win_height = 5, win_vheight = 5 } },
	-- 	ft = "qf",
	-- 	dependencies = {
	-- 		"junegunn/fzf",
	-- 		-- stylua: ignore
	-- 		build = function() vim.fn["fzf#install"]() end,
	-- 	},
	-- },
	{
		"ashfinal/qfview.nvim",
		config = true,
		ft = "qf",
	},

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
	"nvim-tree/nvim-web-devicons",
	-- ui components
	"MunifTanjim/nui.nvim",
}
