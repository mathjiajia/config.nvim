local M = {
	'sindrets/diffview.nvim',
	dependencies = 'nvim-lua/plenary.nvim',
	cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewToggleFiles', 'DiffviewFocusFiles' },
}

M.config = {
	enhanced_diff_hl = true,
}

return M
