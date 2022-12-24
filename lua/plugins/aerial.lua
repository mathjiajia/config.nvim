local M = {
	'stevearc/aerial.nvim',
	enabled = false,
}

M.config = {
	show_guides = true,
	layout = {
		-- max_width = { 40, 0.2 },
		min_width = 30,
	},
}

M.keys = {
	{ '<M-o>', function()
		require('aerial').toggle()
	end, desc = 'Toggle Aerial' },
}

return M
