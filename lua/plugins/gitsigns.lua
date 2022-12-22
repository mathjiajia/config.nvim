local M = {
	'lewis6991/gitsigns.nvim',
	event = 'BufReadPre',
}

M.config = function()
	local gitsigns = require('gitsigns')

	local function on_attach(bufnr)
		vim.keymap.set('n', ']c', function()
			if vim.wo.diff then return ']c' end
			vim.schedule(gitsigns.next_hunk)
			return '<Ignore>'
		end, { expr = true, buffer = bufnr })

		vim.keymap.set('n', '[c', function()
			if vim.wo.diff then return '[c' end
			vim.schedule(gitsigns.prev_hunk)
			return '<Ignore>'
		end, { expr = true, buffer = bufnr })

		vim.keymap.set('n', '<leader>hs', gitsigns.stage_hunk, { buffer = bufnr, desc = 'Stage Hunk' })
		vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { buffer = bufnr, desc = 'Reset Hunk' })

		vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk_inline, { buffer = bufnr, desc = 'Preview Hunk' })

		vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { buffer = bufnr, desc = 'Diff This' })
	end

	gitsigns.setup({
		on_attach = on_attach
	})
end

return M
