local M = {
	'zbirenbaum/nvim-copilot',
	dependencies = 'zbirenbaum/copilot_cmp',
	enabled = false,
}

M.config = function()
	require('copilot').setup()
	require('copilot_cmp').setup()
end

return M
