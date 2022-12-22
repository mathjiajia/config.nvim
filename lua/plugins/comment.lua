local M = {
	'numToStr/Comment.nvim',
	keys = { 'gc', 'gcc', 'gbc' },
}

function M.config()
	require('Comment').setup()
end

return M
