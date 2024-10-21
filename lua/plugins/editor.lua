return {

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				sort = {
					sorter = "case_sensitive",
				},
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})

			vim.keymap.set("n", "<leader>fe", function()
				require("nvim-tree.api").tree.toggle({
					find_file = false,
					focus = true,
					update_root = false,
				})
			end, { desc = "File Explorer" })
		end,
	},
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	config = function()
	-- 		require("neo-tree").setup({
	-- 			open_files_do_not_replace_types = { "aerial", "qf", "terminal" },
	-- 			filesystem = {
	-- 				bind_to_cwd = false,
	-- 				follow_current_file = { enabled = true },
	-- 				use_libuv_file_watcher = true,
	-- 				filtered_items = {
	-- 					hide_dotfiles = false,
	-- 					hide_gitignored = true,
	-- 					hide_by_name = { ".git" },
	-- 				},
	-- 			},
	-- 			default_component_configs = { indent = { with_expanders = true } },
	-- 		})
	-- 	end,
	--
	-- 	-- stylua: ignore start
	-- 	vim.keymap.set("n", "<leader>fe", function() require("neo-tree.command").execute({ dir = vim.uv.cwd(), toggle = true }) end, { desc = "Explorer NeoTree (cwd)" }),
	-- 	vim.keymap.set("n", "<leader>ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, { desc = "Git Explorer" }),
	-- 	vim.keymap.set("n", "<leader>be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end, { desc = "Buffer Explorer" }),
	-- },

	{
		"MagicDuck/grug-far.nvim",
		cmd = "GrugFar",
		---@module "grug-far"
		---@type GrugFarOptionsOverride
		opts = { headerMaxWidth = 80 },
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({ prefills = { filesFilter = ext and ext ~= "" and "*." .. ext or nil } })
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},

	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		-- stylua: ignore
		keys = {
			{ "<leader><space>", function () require("fzf-lua").files({ cwd = "%:p:h" }) end, desc = "Find Files (current)" },
			{ "<leader>fb", function () require("fzf-lua").buffers() end, desc = "Buffers" },
			{ "<leader>fc", function () require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>ff", function () require("fzf-lua").files() end, desc = "Find Files (cwd)" },
			{ "<leader>fg", function () require("fzf-lua").git_files() end, desc = "Find Git Files" },
			{ "<leader>fl", function () require("fzf-lua").lsp_finder() end, desc = "Lsp Finder" },
			{ "<leader>fo", function () require("fzf-lua").oldfiles() end, desc = "Old Files" },
			{ "<leader>sb", function () require("fzf-lua").blines() end, desc = "Search Current Buffer Lines" },
			{ "<leader>sg", function () require("fzf-lua").live_grep() end, desc = "Live Grep" },
			{ "<leader>sh", function () require("fzf-lua").helptags() end, desc = "Help Tags" },
			{ "<leader>sw", function () require("fzf-lua").grep_cword({ word_match = "-w" }) end, desc = "Search Word Under Cursor" },
			{ "<leader>sw", function () require("fzf-lua").grep_visual() end, mode = "v", desc = "Search Visual Selection" },
		},
		opts = {
			defaults = {
				file_icons = "mini",
				formatter = "path.dirname_first",
			},
		},
	},
	-- {
	-- 	"nvim-telescope/telescope.nvim",
	-- 	cmd = "Telescope",
	-- 	-- stylua: ignore
	-- 	keys = {
	-- 		{ "<leader><space>", function () require('telescope.builtin').fd({ cwd = "%:p:h" }) end, desc = "Find Files (current)" },
	-- 		-- find
	-- 		{ "<leader>fb", function () require('telescope.builtin').buffers() end, desc = "Buffers" },
	-- 		{ "<leader>fc", function () require('telescope.builtin').fd({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
	-- 		{ "<leader>ff", function () require('telescope.builtin').fd() end, desc = "Find Files (cwd)" },
	-- 		{ "<leader>fg", function () require('telescope.builtin').git_files() end, desc = "Find Git Files" },
	-- 		-- search
	-- 		{ "<leader>sb", function () require('telescope.builtin').current_buffer_fuzzy_find() end, desc = "Current Buf Fuzzy" },
	-- 		{ "<leader>sg", function () require('telescope.builtin').live_grep() end, desc = "Live Grep" },
	-- 		{ "<leader>sh", function () require('telescope.builtin').help_tags() end, desc = "Help Tags" },
	-- 		{ "<leader>sw", function () require('telescope.builtin').grep_string({ word_match = "-w" }) end, desc = "Search Word" },
	-- 		{ "<leader>sw", function () require('telescope.builtin').grep_string() end, mode = "v", desc = "Search Selection" },
	-- 		-- extensions
	-- 		{ "<leader>fd", function() require("telescope").extensions.file_browser.file_browser({ path = "%:p:h" }) end, desc = "File Browser (current)" },
	-- 		{ "<leader>fD", function() require("telescope").extensions.file_browser.file_browser() end, desc = "File Browser (cwd)" },
	-- 		{ "<leader>fo", function() require("telescope").extensions.frecency.frecency() end, desc = "Frecency" },
	-- 	},
	-- 	dependencies = {
	-- 		"nvim-telescope/telescope-bibtex.nvim",
	-- 		"nvim-telescope/telescope-frecency.nvim",
	-- 		"nvim-telescope/telescope-file-browser.nvim",
	-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- 	},
	-- 	config = function()
	-- 		local telescope = require("telescope")
	-- 		local actions = require("telescope.actions")
	-- 		local actions_layout = require("telescope.actions.layout")
	-- 		local home = vim.uv.os_homedir() or "~"
	--
	-- 		local function flash(prompt_bufnr)
	-- 			require("flash").jump({
	-- 				pattern = "^",
	-- 				label = { after = { 0, 0 } },
	-- 				search = {
	-- 					mode = "search",
	-- 					exclude = {
	-- 						function(win)
	-- 							return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
	-- 						end,
	-- 					},
	-- 				},
	-- 				action = function(match)
	-- 					local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
	-- 					picker:set_selection(match.pos[1] - 1)
	-- 				end,
	-- 			})
	-- 		end
	--
	-- 		telescope.setup({
	-- 			defaults = {
	-- 				sorting_strategy = "ascending",
	-- 				layout_config = { prompt_position = "top" },
	-- 				prompt_prefix = "   ",
	-- 				selection_caret = " ",
	-- 				mappings = {
	-- 					i = {
	-- 						["<C-s>"] = flash,
	-- 						["<C-f>"] = actions.preview_scrolling_down,
	-- 						["<C-b>"] = actions.preview_scrolling_up,
	-- 						["<M-a>"] = actions.toggle_all,
	-- 						["<M-o>"] = actions_layout.toggle_preview,
	-- 					},
	-- 					n = {
	-- 						s = flash,
	-- 						["<M-a>"] = actions.toggle_all,
	-- 						["<M-o>"] = actions_layout.toggle_preview,
	-- 					},
	-- 				},
	-- 				file_ignore_patterns = {
	-- 					".git/",
	-- 					".cache",
	-- 					"build/",
	-- 					"%.class",
	-- 					"%.jpeg",
	-- 					"%.jpg",
	-- 					"%.png",
	-- 					"%.pdf",
	-- 					"%.mkv",
	-- 					"%.mp4",
	-- 					"%.zip",
	-- 					".DS_Store",
	-- 				},
	-- 			},
	-- 			pickers = {
	-- 				buffers = { theme = "dropdown", sort_lastused = true, previewer = false },
	-- 				current_buffer_fuzzy_find = { previewer = false },
	-- 				find_files = {
	-- 					find_command = { "fd", "--type", "f", "--color", "never", "--hidden" },
	-- 					theme = "ivy",
	-- 					follow = true,
	-- 				},
	-- 				git_files = { theme = "ivy" },
	-- 				grep_string = { path_display = { "shorten" } },
	-- 				live_grep = { path_display = { "shorten" } },
	-- 			},
	-- 			extensions = {
	-- 				bibtex = { format = "plain", context = true },
	-- 				file_browser = { theme = "ivy" },
	-- 				frecency = {
	-- 					show_scores = true,
	-- 					workspaces = {
	-- 						["conf"] = home .. "/.config",
	-- 						["dev"] = home .. "/Developer",
	-- 						["doc"] = home .. "/Documents",
	-- 						["tex"] = home .. "/TeX",
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	--
	-- 		local extns =
	-- 			{ "fzf", "file_browser", "frecency", "bibtex", "aerial", "noice", "notify", "themes", "terms" }
	-- 		for _, extn in ipairs(extns) do
	-- 			telescope.load_extension(extn)
	-- 		end
	-- 	end,
	-- },

	{
		"folke/flash.nvim",
		config = function()
			require("flash").setup()

			-- stylua: ignore start
			vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
			vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
			vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
			vim.keymap.set({ "x", "o" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
			vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		---@module "gitsigns"
		---@type Gitsigns.Config
		---@diagnostic disable-next-line: missing-fields
		opts = {
			preview_config = { border = "rounded" },
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, lhs, rhs, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, lhs, rhs, opts)
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

				-- stylua: ignore start
				map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage Hunk" })
				map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset Hunk" })
				map("v", "<leader>hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage Hunk" })
				map("v", "<leader>hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset Hunk" })
				map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage Buffer" })
				map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "Undo Stage Hunk" })
				map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset Buffer" })
				map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview Hunk" })
				map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame Line" })
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Current Line Blame" })
				map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff This" })
				map("n", "<leader>hD", function() gitsigns.diffthis("~") end, { desc = "Diff This (File)" })
				map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle Deleted" })

				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},

	{
		"stevearc/quicker.nvim",
		ft = { "qf" },
		-- stylua: ignore
		keys = {
			{ "<leader>qq", function() vim.diagnostic.setqflist() end, desc = "Set Quickfix" },
			{ "<leader>ql", function() vim.diagnostic.setloclist() end, desc = "Set Loclist" },
		},
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {
			-- stylua: ignore
			keys = {
				{ ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context" },
				{ "<", function() require("quicker").collapse() end, desc = "Collapse quickfix context" },
			},
		},
	},

	{
		"stevearc/aerial.nvim",
		cmd = "AerialToggle",
		keys = { { "<leader>cs", "<Cmd>AerialToggle<CR>", desc = "Aerial (Symbols)" } },
		opts = {
			backends = { "lsp", "treesitter", "markdown", "man" },
			layout = { resize_to_content = false },
			filter_kind = false,
			show_guides = true,
		},
	},
}
