local M = {
	'kylechui/nvim-surround',
	keys = { 'cs', 'ds', 'ys' },
}

M.config = function()
	require('nvim-surround').setup()
end

return M
