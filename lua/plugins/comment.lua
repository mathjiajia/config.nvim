local M = {
	'numToStr/Comment.nvim',
	keys = { 'gc', 'gcc', 'gbc' },
}

M.config = function()
	require('Comment').setup()
end

return M
