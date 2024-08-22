return {

	-- file explorer
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		-- stylua: ignore
		keys = { { "<leader>o", function() require("oil").toggle_float() end, desc = "Toggle Oil" } },
		opts = {
			float = {
				max_width = vim.fn.round(vim.o.columns * 0.5),
				max_height = vim.fn.round(vim.o.lines * 0.5),
			},
		},
	},
	-- {
	-- 	"mehalter/neo-tree.nvim",
	-- 	branch = "generic_icons",
	-- 	cmd = "Neotree",
	-- 	-- stylua: ignore
	-- 	keys = {
	-- 		{ "<leader>fe", function() require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() }) end, desc = "Explorer NeoTree (cwd)" },
	-- 		{ "<leader>ge", function() require("neo-tree.command").execute({ source = "git_status", toggle = true }) end, desc = "Git explorer" },
	-- 		{ "<leader>be", function() require("neo-tree.command").execute({ source = "buffers", toggle = true }) end, desc = "Buffer explorer" },
	-- 	},
	-- 	init = function()
	-- 		vim.api.nvim_create_autocmd("BufEnter", {
	-- 			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
	-- 			desc = "Start Neo-tree with directory",
	-- 			once = true,
	-- 			callback = function()
	-- 				if package.loaded["neo-tree"] then
	-- 					return
	-- 				else
	-- 					local stats = vim.uv.fs_stat(vim.fn.argv(0) --[[@as string]])
	-- 					if stats and stats.type == "directory" then
	-- 						require("neo-tree")
	-- 					end
	-- 				end
	-- 			end,
	-- 		})
	-- 	end,
	-- 	deactivate = function()
	-- 		require("neo-tree.command").execute({ action = "close" })
	-- 	end,
	-- 	opts = {
	-- 		open_files_do_not_replace_types = { "aerial", "qf", "terminal" },
	-- 		filesystem = {
	-- 			bind_to_cwd = false,
	-- 			follow_current_file = { enabled = true },
	-- 			use_libuv_file_watcher = true,
	-- 			filtered_items = {
	-- 				hide_dotfiles = false,
	-- 				hide_gitignored = true,
	-- 				hide_by_name = { ".git" },
	-- 			},
	-- 		},
	-- 		default_component_configs = {
	-- 			indent = {
	-- 				with_expanders = true,
	-- 				expander_collapsed = "",
	-- 				expander_expanded = "",
	-- 				expander_highlight = "NeoTreeExpander",
	-- 			},
	-- 			git_status = {
	-- 				symbols = {
	-- 					unstaged = "󰄱",
	-- 					staged = "󰱒",
	-- 				},
	-- 			},
	-- 			icon = {
	-- 				provider = function(icon, node) -- setup a custom icon provider
	-- 					local text, hl
	-- 					local mini_icons = require("mini.icons")
	-- 					if node.type == "file" then -- if it's a file, set the text/hl
	-- 						text, hl = mini_icons.get("file", node.name)
	-- 					elseif node.type == "directory" then -- get directory icons
	-- 						text, hl = mini_icons.get("directory", node.name)
	-- 						-- only set the icon text if it is not expanded
	-- 						if node:is_expanded() then
	-- 							text = nil
	-- 						end
	-- 					end
	--
	-- 					-- set the icon text/highlight only if it exists
	-- 					if text then
	-- 						icon.text = text
	-- 					end
	-- 					if hl then
	-- 						icon.highlight = hl
	-- 					end
	-- 				end,
	-- 			},
	-- 			kind_icon = {
	-- 				provider = function(icon, node)
	-- 					local mini_icons = require("mini.icons")
	-- 					icon.text, icon.highlight = mini_icons.get("lsp", node.extra.kind.name)
	-- 				end,
	-- 			},
	-- 		},
	-- 	},
	-- },

	-- search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		---@type GrugFarOptions
		---@diagnostic disable-next-line: missing-fields
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>sr",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.grug_far({ prefills = { filesFilter = ext and ext ~= "" and "*." .. ext or nil } })
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},

	-- fuzzy finder
	{
		"ibhagwan/fzf-lua",
		cmd = "FzfLua",
		-- stylua: ignore
		keys = {
			{ "<leader><space>", function () require("fzf-lua").files({ cwd = "%:p:h" }) end, desc = "Find Files (current)" },
			-- find
			{ "<leader>fb", function () require("fzf-lua").buffers() end, desc = "Buffers" },
			{ "<leader>fc", function () require("fzf-lua").files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
			{ "<leader>ff", function () require("fzf-lua").files() end, desc = "Find Files (cwd)" },
			{ "<leader>fg", function () require("fzf-lua").git_files() end, desc = "Find Git Files" },
			{ "<leader>fo", function () require("fzf-lua").oldfiles() end, desc = "Old Files" },
			-- search
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
	-- 		{ "<leader><space>", function () require('telescope.builtin').find_files({ cwd = "%:p:h" }) end, desc = "Find Files (current)" },
	-- 		-- find
	-- 		{ "<leader>fb", function () require('telescope.builtin').buffers() end, desc = "Buffers" },
	-- 		{ "<leader>fc", function () require('telescope.builtin').find_files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
	-- 		{ "<leader>ff", function () require('telescope.builtin').find_files() end, desc = "Find Files (cwd)" },
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
	-- 		{ "<leader>fr", function() require("telescope").extensions.frecency.frecency() end, desc = "Frecency" },
	-- 	},
	-- 	dependencies = {
	-- 		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- 		"nvim-telescope/telescope-bibtex.nvim",
	-- 		"nvim-telescope/telescope-frecency.nvim",
	-- 		"nvim-telescope/telescope-file-browser.nvim",
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
	-- 				file_ignore_patterns = { "%.jpeg$", "%.jpg$", "%.png$", ".DS_Store" },
	-- 			},
	-- 			pickers = {
	-- 				buffers = { theme = "dropdown", sort_lastused = true, previewer = false },
	-- 				current_buffer_fuzzy_find = { previewer = false },
	-- 				find_files = { theme = "ivy", follow = true },
	-- 				git_files = { theme = "ivy" },
	-- 				grep_string = { path_display = { "shorten" } },
	-- 				live_grep = { path_display = { "shorten" } },
	-- 			},
	-- 			extensions = {
	-- 				bibtex = {
	-- 					format = "plain",
	-- 					context = true,
	-- 					-- global_files = { "~/TeX/Jiabibtex.bib" },
	-- 				},
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
	-- 		local extns = {
	-- 			"fzf",
	-- 			"file_browser",
	-- 			"frecency",
	-- 			"bibtex",
	-- 			"aerial",
	-- 			"noice",
	-- 		}
	-- 		for _, extn in ipairs(extns) do
	-- 			telescope.load_extension(extn)
	-- 		end
	-- 	end,
	-- },

	-- Flash enhances the built-in search functionality by showing labels
	-- at the end of each match, letting you quickly jump to a specific
	-- location.
	{
		"folke/flash.nvim",
		event = { "VeryLazy" },
		---@type Flash.Config
		opts = {},
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

				-- Actions
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

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},

	{
		"stevearc/quicker.nvim",
		---@type quicker.SetupOptions
		opts = {
			-- stylua: ignore
			keys = {
				{ ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context" },
				{ "<", function() require("quicker").collapse() end, desc = "Collapse quickfix context" },
			},
		},
		-- stylua: ignore
		keys = {
			{ "<leader>q", function() require("quicker").toggle() end, desc = "Toggle quickfix" },
			{ "<leader>l", function() require("quicker").toggle({ loclist = true }) end, desc = "Toggle loclist" },
		},
	},

	-- symbols outline
	{
		"stevearc/aerial.nvim",
		cmd = "AerialToggle",
		opts = {
			backends = { "lsp", "treesitter", "markdown", "man" },
			layout = { resize_to_content = false },
			filter_kind = false,
			show_guides = true,
		},
	    -- stylua: ignore
	    keys = { { "<leader>cs", function() require("aerial").toggle() end, desc = "Aerial (Symbols)" } },
	},
}
