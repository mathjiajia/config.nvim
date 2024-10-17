return {

	-- file explorer
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		keys = { { "-", "<Cmd>Oil --float<CR>", desc = "Open parent directory" } },
		---@module "oil"
		---@type oil.SetupOpts
		opts = {
			float = {
				max_width = vim.fn.round(vim.o.columns * 0.5),
				max_height = vim.fn.round(vim.o.lines * 0.5),
			},
		},
	},

	-- search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		---@module "grug-far"
		---@type GrugFarOptionsOverride
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
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
			{ "<leader>fl", function () require("fzf-lua").lsp_finder() end, desc = "Lsp Finder" },
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

	-- Flash enhances the built-in search functionality by showing labels
	-- at the end of each match, letting you quickly jump to a specific
	-- location.
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
		ft = { "qf" },
		---@module "quicker"
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
			{ "<leader>q", function() vim.diagnostic.setqflist() end, desc = "Toggle Quickfix" },
			{ "<leader>l", function() vim.diagnostic.setloclist() end, desc = "Toggle Loclist" },
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
		keys = { { "<leader>cs", "<Cmd>AerialToggle<CR>", desc = "Aerial (Symbols)" } },
	},
}
