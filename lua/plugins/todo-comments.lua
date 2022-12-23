local M = {
	'folke/todo-comments.nvim',
	config = true,
	event = 'BufReadPost',
	cmd = { 'TodoTrouble', 'TodoTelescope' },
}

M.keys = {
	{ ']t', function()
		require('todo-comments').jump_next()
	end, desc = 'Next todo comment' },

	{ '[t', function()
		require('todo-comments').jump_prev()
	end, desc = 'Previous todo comment' },
}

return M
