local M = {
	'folke/todo-comments.nvim',
	event = 'BufReadPost',
	cmd = { 'TodoTrouble', 'TodoTelescope' },
}

function M.config()
	require('todo-comments').setup()
end

M.keys = {
	{ 'n', ']t', function()
		require('todo-comments').jump_next()
	end, desc = 'Next todo comment' },

	{ 'n', '[t', function()
		require('todo-comments').jump_prev()
	end, desc = 'Previous todo comment' },
}

return M
