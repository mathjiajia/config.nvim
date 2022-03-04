local gitsigns = require('gitsigns')

gitsigns.setup {
	on_attach = function(bufnr)
		-- Navigation
		vim.keymap.set(
			'n',
			']c',
			'&diff ? "]c" : "<cmd>Gitsigns next_hunk<CR>"',
			{ buffer = bufnr, expr = true, desc = 'Next Hunk' }
		)
		vim.keymap.set(
			'n',
			'[c',
			'&diff ? "[c" : "<cmd>Gitsigns prev_hunk<CR>"',
			{ buffer = bufnr, expr = true, desc = 'Previous Hunk' }
		)

		-- Actions
		vim.keymap.set({ 'n', 'v' }, '<leader>gs', function()
			gitsigns.stage_hunk()
		end, { buffer = bufnr, desc = 'Stage Hunk' })
		vim.keymap.set('n', '<leader>gu', function()
			gitsigns.undo_stage_hunk()
		end, { buffer = bufnr, desc = 'Undo Stage Hunk' })
		vim.keymap.set({ 'n', 'v' }, '<leader>gr', function()
			gitsigns.reset_hunk()
		end, { buffer = bufnr, desc = 'Reset Hunk' })
		vim.keymap.set('n', '<leader>gS', function()
			gitsigns.stage_buffer()
		end, { buffer = bufnr, desc = 'Stage buffer' })
		vim.keymap.set('n', '<leader>gR', function()
			gitsigns.reset_buffer()
		end, { buffer = bufnr, desc = 'Reset buffer' })
		vim.keymap.set('n', '<leader>gp', function()
			gitsigns.preview_hunk()
		end, { buffer = bufnr, desc = 'Preview Hunk' })

		-- Text object
		vim.keymap.set({ 'o', 'x' }, 'ih', function()
			gitsigns.select_hunk()
		end, { buffer = bufnr, desc = 'Select Hunk' })
	end,
}
