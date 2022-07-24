local gs = require 'gitsigns'

gs.setup {
	on_attach = function(bufnr)
		-- NAVIGATION
		vim.keymap.set('n', ']c', function()
			if vim.wo.diff then
				return ']c'
			end
			vim.schedule(function()
				gs.next_hunk()
			end)
			return '<Ignore>'
		end, { buffer = bufnr, expr = true, desc = 'Next Hunk' })
		vim.keymap.set('n', '[c', function()
			if vim.wo.diff then
				return '[c'
			end
			vim.schedule(function()
				gs.prev_hunk()
			end)
			return '<Ignore>'
		end, { buffer = bufnr, expr = true, desc = 'Previous Hunk' })

		-- ACTIONS
		vim.keymap.set({ 'n', 'v' }, '<leader>hs', function()
			gs.stage_hunk()
		end, { buffer = bufnr, desc = 'Stage Hunk' })
		vim.keymap.set('n', '<leader>hu', function()
			gs.undo_stage_hunk()
		end, { buffer = bufnr, desc = 'Undo Stage Hunk' })
		vim.keymap.set({ 'n', 'v' }, '<leader>hr', function()
			gs.reset_hunk()
		end, { buffer = bufnr, desc = 'Reset Hunk' })
		vim.keymap.set('n', '<leader>hS', function()
			gs.stage_buffer()
		end, { buffer = bufnr, desc = 'Stage buffer' })
		vim.keymap.set('n', '<leader>hR', function()
			gs.reset_buffer()
		end, { buffer = bufnr, desc = 'Reset buffer' })
		vim.keymap.set('n', '<leader>hp', function()
			gs.preview_hunk()
		end, { buffer = bufnr, desc = 'Preview Hunk' })

		-- TEXT OBJECT
		vim.keymap.set({ 'o', 'x' }, 'ih', function()
			gs.select_hunk()
		end, { buffer = bufnr, desc = 'Select Hunk' })
	end,
}
