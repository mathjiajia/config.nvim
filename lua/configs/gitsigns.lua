local gitsigns = require('gitsigns')

gitsigns.setup {
	signs = {
		add = { hl = 'GitSignsAdd', text = '|', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
		change = { hl = 'GitSignsChange', text = '|', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
		delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
		changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
	},
	signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
	numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
	linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
	word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
	watch_gitdir = {
		interval = 1000,
		follow_files = true,
	},
	attach_to_untracked = true,
	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = vim.o.updatetime,
		ignore_whitespace = false,
	},
	current_line_blame_formatter_opts = {
		relative_time = false,
	},
	sign_priority = 6,
	update_debounce = 100,
	status_formatter = nil, -- Use default
	max_file_length = 40000,
	preview_config = {
		-- Options passed to nvim_open_win
		border = 'single',
		style = 'minimal',
		relative = 'cursor',
		row = 0,
		col = 1,
	},
	yadm = {
		enable = false,
	},
	on_attach = function(bufnr)
		local function map(mode, key, fun, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, key, fun, opts)
		end

		-- Navigation
		map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true, desc = 'Next Hunk' })
		map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true, desc = 'Previous Hunk' })

		-- Actions
		map({ 'n', 'v' }, '<leader>gs', function()
			gitsigns.stage_hunk()
		end, { desc = 'Stage Hunk' })
		map('n', '<leader>gu', function()
			gitsigns.undo_stage_hunk()
		end, { desc = 'Undo Stage Hunk' })
		map({ 'n', 'v' }, '<leader>gr', function()
			gitsigns.reset_hunk()
		end, { desc = 'Reset Hunk' })
		map('n', '<leader>gS', function()
			gitsigns.stage_buffer()
		end, { desc = 'Stage buffer' })
		map('n', '<leader>gR', function()
			gitsigns.reset_buffer()
		end, { desc = 'Reset buffer' })
		map('n', '<leader>gp', function()
			gitsigns.preview_hunk()
		end, { desc = 'Preview Hunk' })

		-- Text object
		map({ 'o', 'x' }, 'ih', function()
			gitsigns.select_hunk()
		end, { desc = 'Select Hunk' })
	end,
}
