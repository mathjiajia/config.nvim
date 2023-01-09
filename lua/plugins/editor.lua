local util = require("util")

return {

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
		end,
		opts = {
			window = {
				position = "float",
				popup = {
					position = { row = 0, col = "100%" },
					size = function(state)
						local root_name = vim.fn.fnamemodify(state.path, ":~")
						local root_len = string.len(root_name) + 2
						return {
							width = math.max(root_len, 32),
							height = "60%",
						}
					end,
					border = { style = "rounded" },
				},
			},
			filesystem = {
				follow_current_file = true,
				hijack_netrw_behavior = "open_current",
			},
			source_selector = {
				winbar = true,
				tab_labels = { buffers = "  Bufs " },
			},
		},
		cmd = "Neotree",
		-- stylua: ignore
		keys = {
			{ "<leader>ft", function()
				require("neo-tree.command").execute({ toggle = true, dir = util.get_root() })
			end, desc = "NeoTree (root dir)" },
			{ "<leader>fT", function()
				require("neo-tree.command").execute({ toggle = true })
			end, desc = "Toggle NeoTree (cwd)" },
		},
	},

	-- search/replace in multiple files
	{
		"windwp/nvim-spectre",
		-- stylua: ignore
		keys = {
			{ "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
		},
	},

	-- fuzzy finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"natecraddock/telescope-zf-native.nvim",
			"nvim-telescope/telescope-bibtex.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)

			local extns = { "zf-native", "file_browser", "frecency", "bibtex", "aerial", "noice" }
			for _, extn in ipairs(extns) do
				telescope.load_extension(extn)
			end
		end,
		opts = function()
			local actions = require("telescope.actions")
			local actions_layout = require("telescope.actions.layout")

			local home = vim.fn.expand("~")
			return {
				defaults = {
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = { prompt_position = "top" },
					prompt_prefix = "   ",
					selection_caret = " ",
					mappings = {
						i = {
							["<M-a>"] = actions.toggle_all,
							["<M-o>"] = actions_layout.toggle_preview,
						},
						n = {
							["<M-a>"] = actions.toggle_all,
							["<M-o>"] = actions_layout.toggle_preview,
						},
					},
					file_ignore_patterns = { "%.jpeg$", "%.jpg$", "%.png$", ".DS_Store" },
				},
				pickers = {
					buffers = {
						theme = "dropdown",
						sort_lastused = true,
						previewer = false,
					},
					current_buffer_fuzzy_find = { previewer = false },
					find_files = { theme = "ivy", follow = true },
					git_files = { theme = "ivy" },
					grep_string = {
						path_display = { "shorten" },
					},
					live_grep = {
						path_display = { "shorten" },
					},
				},
				extensions = {
					frecency = {
						show_scores = true,
						workspaces = {
							["conf"] = home .. "/.config",
							["dev"] = home .. "/Developer",
							["doc"] = home .. "/Documents",
							["tex"] = home .. "/TeX",
						},
					},
					bibtex = { format = "plain" },
					file_browser = { theme = "ivy" },
				},
			}
		end,
		cmd = "Telescope",
		keys = {
			{ "<leader><space>", util.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>fb", util.tele_builtin("buffers"), desc = "Buffers" },
			{ "<leader>fd", util.tele_extn("file_browser", { path = "%:p:h" }), desc = "File Browser" },
			{ "<leader>fD", util.tele_extn("file_browser"), desc = "File Browser" },
			{ "<leader>ff", util.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>fF", util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
			{ "<leader>fm", util.tele_builtin("builtin"), desc = "Telescope Meta" },
			{ "<leader>fn", util.tele_builtin("find_files", { cwd = "~/.config/nvim" }), desc = "Neovim Configs" },
			{ "<leader>fr", util.tele_extn("frecency"), desc = "Recent Files" },
			{ "<leader>sb", util.tele_builtin("current_buffer_fuzzy_find"), desc = "Current_Buf Fuzzy Find" },
			{ "<leader>sg", util.telescope("live_grep"), desc = "Live Grep (root dir)" },
			{ "<leader>sG", util.telescope("live_grep", { cwd = false }), desc = "Live Grep (cwd)" },
			{ "<leader>sh", util.tele_builtin("help_tags"), desc = "Help Tags" },
		},
	},

	-- easily jump to any location and enhanced f/t motions for Leap
	{
		"ggandor/leap.nvim",
		dependencies = {
			"ggandor/flit.nvim",
			opts = { labeled_modes = "nv" },
		},
		config = function()
			require("leap").add_default_mappings(true)
		end,
		event = "VeryLazy",
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				-- Navigation
				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(gs.next_hunk)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr })

				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(gs.prev_hunk)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr })

				-- Actions
				vim.keymap.set({ "n", "v" }, "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
				vim.keymap.set({ "n", "v" }, "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
				vim.keymap.set("n", "<leader>hS", gs.stage_buffer, { buffer = bufnr, desc = "Stage Buffer" })
				vim.keymap.set("n", "<leader>hR", gs.reset_buffer, { buffer = bufnr, desc = "Reset Buffer" })
				vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })

				-- Text object
				vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Hunk Object" })
			end,
		},
		event = "BufReadPre",
	},

	-- buffer remove
	{
		"echasnovski/mini.bufremove",
		-- stylua: ignore
		keys = {
			{ "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
			{ "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
		},
	},

	-- better diagnostics list and others
	{
		"folke/trouble.nvim",
		enabled = false,
		opts = { use_diagnostic_signs = true },
		cmd = { "TroubleToggle", "Trouble" },
		-- stylua: ignore
		keys = {
			{ "<leader>xx", function()
				require("trouble").toggle("document_diagnostics")
			end, desc = "Document Diagnostics (Trouble)" },
			{ "<leader>xX", function()
				require("trouble").toggle("workspace_diagnostics")
			end, desc = "Workspace Diagnostics (Trouble)" },
		},
	},

	-- todo-comments
	{
		"folke/todo-comments.nvim",
		config = true,
		event = "BufReadPost",
		cmd = { "TodoTrouble", "TodoTelescope" },
		-- stylua: ignore
		keys = {
			{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
			{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
			{ "<leader>xt", function() require("trouble").open("todo") end, desc = "Todo Trouble" },
		},
	},

	-- symbols outline
	{
		"stevearc/aerial.nvim",
		opts = {
			backends = { "lsp", "treesitter", "markdown", "man" },
			filter_kind = false,
			icons = require("config.settings").icons.aerial,
			show_guides = true,
			layout = { min_width = 30 },
		},
		-- stylua: ignore
		keys = {
			{ "<leader>oa", function() require("aerial").toggle() end, desc = "Aerial" },
		},
	},

	-- diffview
	{
		"sindrets/diffview.nvim",
		opts = { enhanced_diff_hl = true },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		-- stylua: ignore
		keys = {
			{ "<leader>gd", function() require("diffview").open() end, desc = "Diff View" },
		},
	},
}
