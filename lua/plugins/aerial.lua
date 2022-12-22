local M = {
	'stevearc/aerial.nvim',
}

function M.config()
	require('aerial').setup({
		show_guides = true,
		layout = {
			-- max_width = { 40, 0.2 },
			min_width = 30,
		},
	})
end

M.keys = {
	{ '<M-o>', function()
		require('aerial').toggle()
	end, desc = 'Toggle Aerial' },
}

return M
