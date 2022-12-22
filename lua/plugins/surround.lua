local M = {
	'kylechui/nvim-surround',
	keys = { 'cs', 'ds', 'ys' },
}

function M.config()
	require('nvim-surround').setup()
end

return M
