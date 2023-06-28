local fn = vim.fn
local Util = require("util")

return {

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if fn.argc() == 1 then
				---@diagnostic disable-next-line: param-type-mismatch
				local stat = vim.loop.fs_stat(fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		deactivate = function()
			require("neo-tree.command").execute({ action = "close" })
		end,
		opts = {
			sources = {
				"filesystem",
				"buffers",
				"git_status",
				"document_symbols",
			},
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
				use_libuv_file_watcher = true,
			},
			default_component_configs = {
				icon = {
					folder_empty = "󰜌",
					folder_empty_open = "󰜌",
				},
				git_status = {
					symbols = {
						renamed = "󰁕",
						unstaged = "󰄱",
					},
				},
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
		cmd = { "Spectre" },
		opts = { open_cmd = "noswapfile vnew" },
	},
	{
		"AckslD/muren.nvim",
		config = true,
		cmd = { "MurenToggle", "MurenFresh", "MurenUnique" },
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
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local actions_layout = require("telescope.actions.layout")

			local home = fn.expand("~")

			telescope.setup({
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
					bibtex = {
						format = "plain",
						global_files = { "~/TeX/Jiabibtex.bib" },
					},
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
			})

			local extns = { "zf-native", "file_browser", "frecency", "bibtex", "aerial", "noice" }
			for _, extn in ipairs(extns) do
				telescope.load_extension(extn)
			end
		end,
		cmd = "Telescope",
		-- stylua: ignore
		keys = {
			{ "<leader><space>", Util.telescope("files", { cwd = "%:p:h" }), desc = "Find Files (current)" },
			{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
			{ "<leader>fd", function() require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" }) end, desc = "Neovim Configs" },
			{ "<leader>fD", function() require("telescope").extensions.file_browser.file_browser() end, desc = "Neovim Configs" },
			{ "<leader>ff", Util.telescope("files"), desc = "Find Files (root dir)" },
			{ "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
			{ "<leader>fm", function() require("telescope.builtin").builtin() end, desc = "Telescope Meta" },
			{ "<leader>fn", function() require("telescope.builtin").find_files({ cwd = "~/.config/nvim" }) end, desc = "Neovim Configs" },
			{ "<leader>fr", function() require("telescope").extensions.frecency.frecency() end, desc = "Neovim Configs" },
			{ "<leader>sb", function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Current Buf Fuzzy Find" },
			{ "<leader>sg", Util.telescope("live_grep"), desc = "Live Grep (root dir)" },
			{ "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Live Grep (cwd)" },
			{ "<leader>sh", function() require("telescope.builtin").help_tags() end, desc = "Help Tags" },
			{ "<leader>ss", Util.telescope("grep_string"), desc = "Grep String (root dir)", mode = { "n", "x" } },
			{ "<leader>sS", Util.telescope("grep_string", { cwd = false }), desc = "Grep String", mode = { "n", "x" } },
		},
	},

	-- easily jump to any location and enhanced f/t motions for Leap
	{
		"folke/flash.nvim",
		config = true,
		-- stylua: ignore
		keys = {
			"f", "F", "t", "T",
			{ "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
			{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
			{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		},
	},

	-- {
	-- 	"gbprod/yanky.nvim",
	-- 	config = true,
	-- 	keys = {
	-- 		{ "p", mode = { "n", "x" }, "<Plug>(YankyPutAfter)" },
	-- 		{ "P", mode = { "n", "x" }, "<Plug>(YankyPutBefore)" },
	-- 		{ "gp", mode = { "n", "x" }, "<Plug>(YankyGPutAfter)" },
	-- 		{ "gP", mode = { "n", "x" }, "<Plug>(YankyGPutBefore)" },
	-- 	},
	-- },

	-- {
	-- 	"ggandor/leap.nvim",
	-- 	dependencies = { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
	-- 	config = function()
	-- 		require("leap").add_default_mappings(true)
	-- 	end,
	-- 	event = "VeryLazy",
	-- },

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			preview_config = { border = "rounded" },
			-- stylua: ignore
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				-- stylua: ignore start
				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then return "]c" end
					vim.schedule(gs.next_hunk)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Next Hunk" })

				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then return "[c" end
					vim.schedule(gs.prev_hunk)
					return "<Ignore>"
				end, { expr = true, buffer = bufnr, desc = "Prev Hunk" })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
				map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
				map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage Hunk")
				map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset Hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame")
				map("n", "<leader>hd", gs.diffthis, "Diff This")
				map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This (working copy)")
				-- map('n', '<leader>td', gs.toggle_deleted, 'Toggle Deleted')

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Hunk Object")
			end,
		},
	},

	-- symbols outline
	{
		"stevearc/aerial.nvim",
		opts = {
			backends = { "lsp", "treesitter", "markdown", "man" },
			filter_kind = false,
			-- icons = require("config").icons.aerial,
			show_guides = true,
			layout = {
				-- min_width = 30,
				default_direction = "left",
			},
		},
		-- stylua: ignore
		keys = { { "<M-o>", function() require("aerial").toggle() end, desc = "Aerial" } },
		cmd = "AerialToggle",
	},

	-- diffview
	{
		"sindrets/diffview.nvim",
		opts = { enhanced_diff_hl = true },
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		-- stylua: ignore
		keys = { { "<leader>gd", function() require("diffview").open({}) end, desc = "Diff View" } },
	},
}
