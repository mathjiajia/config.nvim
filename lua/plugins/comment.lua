local M = {
	'numToStr/Comment.nvim',
	keys = { 'gbc', 'gc', 'gcc' },
}

function M.config()
	require('Comment').setup()
end

return M
