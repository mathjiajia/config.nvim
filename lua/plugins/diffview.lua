local M = {
	'sindrets/diffview.nvim',
	dependencies = 'nvim-lua/plenary.nvim',
	cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
}

function M.config()
	require('diffview').setup({
		enhanced_diff_hl = true,
	})
end

return M
