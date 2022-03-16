local gs = require('gitsigns')

gs.setup {
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
		-- stylua: ignore start
		vim.keymap.set(
			{ 'n', 'v' }, '<leader>gs',
			function()
				gs.stage_hunk()
			end,
			{ buffer = bufnr, desc = 'Stage Hunk' }
		)
		vim.keymap.set(
			'n', '<leader>gu',
			function()
				gs.undo_stage_hunk()
			end,
			{ buffer = bufnr, desc = 'Undo Stage Hunk' }
		)
		vim.keymap.set(
			{ 'n', 'v' }, '<leader>gr',
			function()
				gs.reset_hunk()
			end,
			{ buffer = bufnr, desc = 'Reset Hunk' }
		)
		vim.keymap.set(
			'n', '<leader>gS',
			function()
				gs.stage_buffer()
			end,
			{ buffer = bufnr, desc = 'Stage buffer' }
		)
		vim.keymap.set(
			'n', '<leader>gR',
			function()
				gs.reset_buffer()
			end,
			{ buffer = bufnr, desc = 'Reset buffer' }
		)
		vim.keymap.set(
			'n', '<leader>gp',
			function()
				gs.preview_hunk()
			end,
			{ buffer = bufnr, desc = 'Preview Hunk' }
		)

		-- Text object
		vim.keymap.set(
			{ 'o', 'x' }, 'ih',
			function()
				gs.select_hunk()end,
			{ buffer = bufnr, desc = 'Select Hunk' }
		)
		-- stylua: ignore end
	end,
}
