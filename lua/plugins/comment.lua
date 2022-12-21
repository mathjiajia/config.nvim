local M = {
	'numToStr/Comment.nvim',
	keys = 'gc',
}

M.config = function()
	require('Comment').setup()
end

return M
