local M = {
	'zbirenbaum/nvim-copilot',
	enabled = false,
	dependencies = 'zbirenbaum/copilot_cmp',
}

function M.config()
	require('copilot').setup()
	require('copilot_cmp').setup()
end

return M
