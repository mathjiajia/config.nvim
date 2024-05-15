return {

	-- treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		opts = {
			ensure_install = {
				"bash",
				"bibtex",
				"comment",
				"diff",
				"latex",
				"lua",
				"markdown",
				"markdown_inline",
				"regex",
				"vim",
				"vimdoc",
			},
		},
	},

	-- file explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		cmd = "Neotree",
		-- stylua: ignore
		keys = {
			{ "<leader>fe", function() require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() }) end, desc = "Explorer NeoTree (cwd)" },
			{ "<leader>ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, desc = "Git explorer" },
			{ "<leader>be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end, desc = "Buffer explorer" },
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
		deactivate = function()
			require("neo-tree.command").execute({ action = "close" })
		end,
		opts = {
			open_files_do_not_replace_types = { "aerial", "qf", "terminal" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
	},

	-- search/replace in multiple files
	{
		"nvim-pack/nvim-spectre",
		cmd = { "Spectre" },
		opts = {
			open_cmd = "noswapfile vnew",
			default = {
				replace = { cmd = "sd" },
			},
		},
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
		-- stylua: ignore
		keys = {
			{ "<leader><space>", function () require('telescope.builtin').find_files({ cwd = "%:p:h" }) end, desc = "Find Files (current)" },
			-- find
			{ "<leader>fb", function () require('telescope.builtin').buffers() end, desc = "Buffers" },
			{ "<leader>fc", function () require('telescope.builtin').find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>ff", function () require('telescope.builtin').find_files() end, desc = "Find Files (cwd)" },
			{ "<leader>fg", function () require('telescope.builtin').git_files() end, desc = "Find Git Files" },
			{ "<leader>fm", function () require('telescope.builtin').builtin() end, desc = "Telescope Meta" },
			-- search
			{ "<leader>sb", function () require('telescope.builtin').current_buffer_fuzzy_find() end, desc = "Current Buf Fuzzy" },
			{ "<leader>sg", function () require('telescope.builtin').live_grep() end, desc = "Live Grep" },
			{ "<leader>sh", function () require('telescope.builtin').help_tags() end, desc = "Help Tags" },
			{ "<leader>sw", function () require('telescope.builtin').grep_string({ word_match = "-w" }) end, desc = "Search Word" },
			{ "<leader>sw", function () require('telescope.builtin').grep_string() end, mode = "v", desc = "Search Selection" },
			-- extensions
			{ "<leader>fd", function() require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" }) end, desc = "File Browser (current)" },
			{ "<leader>fD", function() require("telescope").extensions.file_browser.file_browser() end, desc = "File Browser (cwd)" },
			{ "<leader>fr", function() require("telescope").extensions.frecency.frecency() end, desc = "Frecency" },
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
			local home = vim.uv.os_homedir() or "~"

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
						context = true,
						-- global_files = { "~/TeX/Jiabibtex.bib" },
					},
					file_browser = { theme = "ivy" },
					frecency = {
						show_scores = true,
						-- matcher = "fuzzy",
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
		event = { "VeryLazy" },
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
		opts = {
			preview_config = { border = "rounded" },
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				-- stylua: ignore start
				map("n", "<leader>hs", gitsigns.stage_hunk)
				map("n", "<leader>hr", gitsigns.reset_hunk)
				map("v", "<leader>hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
				map("v", "<leader>hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
				map("n", "<leader>hS", gitsigns.stage_buffer)
				map("n", "<leader>hu", gitsigns.undo_stage_hunk)
				map("n", "<leader>hR", gitsigns.reset_buffer)
				map("n", "<leader>hp", gitsigns.preview_hunk)
				map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end)
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
				map("n", "<leader>hd", gitsigns.diffthis)
				map("n", "<leader>hD", function() gitsigns.diffthis("~") end)
				map("n", "<leader>td", gitsigns.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
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
			icons = vim.tbl_extend("force", require("lspkind").presets.codicons, {
				Array = "󰅨 ",
				Boolean = " ",
				Constant = " ",
				Key = " ",
				Number = "󰎠 ",
				Null = "󰟢 ",
				Object = " ",
				Struct = " ",
				String = "󰅳 ",
			}),
			filter_kind = false,
			show_guides = true,
		},
	    -- stylua: ignore
	    keys = { { "<leader>cs", function() require("aerial").toggle() end, desc = "Aerial (Symbols)" } },
	},

	-- diffview
	{
		"sindrets/diffview.nvim",
		opts = {
			enhanced_diff_hl = true,
			hooks = {
				diff_buf_read = function()
					vim.wo.wrap = false
					vim.wo.list = false
					vim.wo.colorcolumn = "80"
					vim.wo.winbar = ""
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

	-- speed up choosing ours/theres when resolving diffs
	{
		"akinsho/git-conflict.nvim",
		opts = { default_mappings = false },
		cmd = {
			"GitConflictChooseOurs",
			"GitConflictChooseTheirs",
			"GitConflictChooseBoth",
			"GitConflictChooseNone",
			"GitConflictNextConflict",
			"GitConflictPrevConflict",
			"GitConflictListQf",
		},
	},
}
