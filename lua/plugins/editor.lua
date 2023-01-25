local fn = vim.fn
local Util = require("util")

return {

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if fn.argc() == 1 then
				local stat = vim.loop.fs_stat(fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			source_selector = {
				winbar = true,
				tab_labels = { buffers = "  Bufs " },
			},
			window = {
				position = "float",
				popup = {
					position = { row = 0, col = "100%" },
					size = function(state)
						local root_name = fn.fnamemodify(state.path, ":~")
						local root_len = string.len(root_name) + 2
						return { width = math.max(root_len, 32), height = "60%" }
					end,
					border = { style = "rounded" },
				},
			},
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
			},
		},
		cmd = "Neotree",
		-- stylua: ignore
		keys = {
			{ "<M-t>", function()
				require("neo-tree.command").execute({ toggle = true, dir = Util.get_root() })
			end, desc = "NeoTree (root dir)" },
			{ "<M-S-t>", function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end, desc = "Toggle NeoTree (cwd)" },
		},
	},

	-- search/replace in multiple files
	{
		"windwp/nvim-spectre",
		-- stylua: ignore
		keys = { { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" } },
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

			local home = fn.expand("~")
			return {
				defaults = {
					sorting_strategy = "ascending",
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
					grep_string = { path_display = { "shorten" } },
					live_grep = { path_display = { "shorten" } },
				},
				extensions = {
					bibtex = { format = "plain" },
					file_browser = { theme = "ivy" },
					frecency = {
						show_scores = true,
						workspaces = {
							["conf"] = home .. "/.config",
							["dev"] = home .. "/Developer",
							["doc"] = home .. "/Documents",
							["tex"] = home .. "/TeX",
						},
					},
				},
			}
		end,
		cmd = "Telescope",
		keys = {
			{ "<leader><space>", Util.telescope("files", { cwd = "%:p:h" }), desc = "Find Files (current)" },
			{ "<leader>fb", Util.tele_builtin("buffers"), desc = "Buffers" },
			{ "<leader>fd", Util.tele_extn("file_browser", { path = "%:p:h" }), desc = "File Browser" },
			{ "<leader>fD", Util.tele_extn("file_browser"), desc = "File Browser" },
			{ "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
			{ "<leader>fm", Util.tele_builtin("builtin"), desc = "Telescope Meta" },
			{ "<leader>fn", Util.tele_builtin("find_files", { cwd = "~/.config/nvim" }), desc = "Neovim Configs" },
			{ "<leader>fr", Util.tele_extn("frecency"), desc = "Recent Files" },
			{ "<leader>sb", Util.tele_builtin("current_buffer_fuzzy_find"), desc = "Current_Buf Fuzzy Find" },
			{ "<leader>sg", Util.telescope("live_grep"), desc = "Live Grep (root dir)" },
			{ "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Live Grep (cwd)" },
			{ "<leader>sh", Util.tele_builtin("help_tags"), desc = "Help Tags" },
		},
	},

	-- easily jump to any location and enhanced f/t motions for Leap
	{
		"ggandor/leap.nvim",
		dependencies = { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
		config = function()
			require("leap").add_default_mappings(true)
		end,
		event = "VeryLazy",
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			preview_config = { border = "rounded" },
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				-- Navigation
				-- stylua: ignore start
				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then return "]c" end
					vim.schedule(gs.next_hunk)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr })

				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then return "[c" end
					vim.schedule(gs.prev_hunk)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr })
				-- stylua: ignore end

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
			icons = require("config").icons.aerial,
			show_guides = true,
			layout = { min_width = 30 },
		},
		-- stylua: ignore
		keys = { { "<M-o>", function() require("aerial").toggle() end, desc = "Aerial" } },
	},

	-- diffview
	{
		"sindrets/diffview.nvim",
		opts = { enhanced_diff_hl = true },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
		-- stylua: ignore
		keys = { { "<leader>gd", function() require("diffview").open({}) end, desc = "Diff View" } },
	},
}
