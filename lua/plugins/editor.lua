local Util = require("util")

return {

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = { auto_install = true },
	},

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		keys = {
			{
				"<leader>fe",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
				end,
				desc = "Explorer NeoTree (root dir)",
			},
			{
				"<leader>fE",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
			{
				"<leader>ge",
				function()
					require("neo-tree.command").execute({ source = "git_status", toggle = true })
				end,
				desc = "Git explorer",
			},
			{
				"<leader>be",
				function()
					require("neo-tree.command").execute({ source = "buffers", toggle = true })
				end,
				desc = "Buffer explorer",
			},
		},
		init = function()
			if vim.fn.argc() == 1 then
				---@diagnostic disable-next-line: param-type-mismatch
				local stat = vim.uv.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "aerial", "edgy", "qf", "terminal" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
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
		cmd = "Telescope",
		keys = {
			{ "<leader><space>", Util.telescope("files", { cwd = "%:p:h" }), desc = "Find Files (current)" },
			-- find
			{ "<leader>fb", Util.telescope("buffers"), desc = "Buffers" },
			{ "<leader>fc", Util.telescope.config_files(), desc = "Find Config File" },
			{ "<leader>ff", Util.telescope("files", { cwd = false }), desc = "Find Files (root dir)" },
			{ "<leader>fF", Util.telescope("files"), desc = "Find Files (cwd)" },
			{ "<leader>fm", Util.telescope("builtin"), desc = "Telescope Meta" },
			-- search
			{ "<leader>sb", Util.telescope("current_buffer_fuzzy_find"), desc = "Current Buf Fuzzy Find" },
			{ "<leader>sg", Util.telescope("live_grep", { cwd = false }), desc = "Live Grep (root dir)" },
			{ "<leader>sG", Util.telescope("live_grep"), desc = "Live Grep (cwd)" },
			{ "<leader>sh", Util.telescope("help_tags"), desc = "Help Tags" },
			{ "<leader>sw", Util.telescope("grep_string", { word_match = "-w" }), desc = "Word (root dir)" },
			{ "<leader>sW", Util.telescope("grep_string", { cwd = false, word_match = "-w" }), desc = "Word (cwd)" },
			{ "<leader>sw", Util.telescope("grep_string"), mode = "v", desc = "Selection (root dir)" },
			{ "<leader>sW", Util.telescope("grep_string", { cwd = false }), mode = "v", desc = "Selection (cwd)" },
			-- extensions
			{
				"<leader>fd",
				function()
					require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" })
				end,
				desc = "File Browser (current)",
			},
			{
				"<leader>fD",
				function()
					require("telescope").extensions.file_browser.file_browser()
				end,
				desc = "File Browser (cwd)",
			},
			{
				"<leader>fr",
				function()
					require("telescope").extensions.frecency.frecency()
				end,
				desc = "Frecency",
			},
		},
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-bibtex.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local actions_layout = require("telescope.actions.layout")
			local home = vim.env.HOME

			local function flash(prompt_bufnr)
				require("flash").jump({
					pattern = "^",
					label = { after = { 0, 0 } },
					search = {
						mode = "search",
						exclude = {
							function(win)
								return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
							end,
						},
					},
					action = function(match)
						local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
						picker:set_selection(match.pos[1] - 1)
					end,
				})
			end

			telescope.setup({
				defaults = {
					sorting_strategy = "ascending",
					layout_config = { prompt_position = "top" },
					prompt_prefix = "   ",
					selection_caret = " ",
					get_selecition_window = function()
						require("edgy").goto_main()
						return 0
					end,
					mappings = {
						i = {
							["<C-s>"] = flash,
							["<C-f>"] = actions.preview_scrolling_down,
							["<C-b>"] = actions.preview_scrolling_up,
							["<M-a>"] = actions.toggle_all,
							["<M-o>"] = actions_layout.toggle_preview,
						},
						n = {
							s = flash,
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

			local extns = {
				"fzf",
				"file_browser",
				"frecency",
				"bibtex",
				"aerial",
				"noice",
			}
			for _, extn in ipairs(extns) do
				telescope.load_extension(extn)
			end
		end,
	},

	-- Flash enhances the built-in search functionality by showing labels
	-- at the end of each match, letting you quickly jump to a specific
	-- location.
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		config = true,
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},

	-- git signs
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			preview_config = { border = "none" },
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, "Next Hunk")
				map("n", "[h", gs.prev_hunk, "Prev Hunk")

				-- Actions
        -- stylua: ignore start
				map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
				map("v", "<leader>hs", function() gs.stage_hunk({ vim.api.nvim_win_get_cursor(0)[1], vim.fn.line("v") }) end, "Stage Hunk")
				map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer")
				map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
				map("v", "<leader>hr", function() gs.reset_hunk({ vim.api.nvim_win_get_cursor(0)[1], vim.fn.line("v") }) end, "Reset Hunk")
				map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer")
				map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")
				map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
				map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame Line")
				map("n", "<leader>hd", gs.diffthis, "Diff This")
				map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff This (working copy)")
				map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame")
				map("n", "<leader>td", gs.toggle_deleted, "Toggle Deleted")

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Hunk Object")
			end,
		},
	},

	-- Finds and lists all of the TODO, HACK, BUG, etc comment
	-- in your project and loads them into a browsable list.
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
		-- stylua: ignore
		keys = {
      { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    },
	},

	-- symbols outline
	{
		"stevearc/aerial.nvim",
		cmd = "AerialToggle",
		opts = {
			backends = { "lsp", "treesitter", "markdown", "man" },
			layout = { resize_to_content = false },
			attach_mode = "global",
			icons = {
				Array = "󰅨 ",
				Boolean = " ",
				Class = " ",
				Constant = " ",
				Constructor = " ",
				Enum = " ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = " ",
				Folder = " ",
				Function = "󰡱 ",
				Interface = " ",
				Key = " ",
				Method = " ",
				Module = " ",
				Number = "󰎠 ",
				Null = "󰟢 ",
				Object = " ",
				Operator = " ",
				Property = " ",
				Reference = " ",
				Struct = " ",
				String = "󰅳 ",
				TypeParameter = " ",
				Unit = " ",
				Value = " ",
				Variable = " ",
			},
			filter_kind = false,
			show_guides = true,
		},
		-- stylua: ignore
		keys = {
			{ "<leader>cs", function() require("aerial").toggle() end, desc = "Aerial (Symbols)" }
		},
	},

	-- diffview
	{
		"sindrets/diffview.nvim",
		opts = {
			enhanced_diff_hl = true,
			hooks = {
				diff_buf_read = function()
					vim.opt_local.wrap = false
					vim.opt_local.list = false
					vim.opt_local.colorcolumn = "80"
					vim.opt_local.winbar = ""
				end,
			},
		},
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		-- stylua: ignore
		keys = {
			{ "<leader>gd", function() require("diffview").open({}) end, desc = "Open Diffview" },
			{ "<leader>gc", "<Cmd>DiffviewClose<CR>", desc = "Close Diffview" },
			{ "<leader>gf", "<Cmd>DiffviewFileHistory<CR>", mode = { 'n', 'x' }, desc = "Close Diffview" },
		},
	},
}
