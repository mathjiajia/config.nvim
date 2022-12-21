local M = {
	'kylechui/nvim-surround',
	event = 'InsertEnter',
}

M.config = function()
	require('nvim-surround').setup()
end

return M
