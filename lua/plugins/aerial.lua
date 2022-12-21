local M = {
	'stevearc/aerial.nvim',
}

M.init = function()
	vim.keymap.set(
		'n',
		'<M-o>',
		function()
			require('aerial').toggle()
		end,
		{ buffer = true, desc = 'Toggle Aerial' }
	)
end

M.config = function()
	require('aerial').setup({
		show_guides = true,
		layout = {
			-- max_width = { 40, 0.2 },
			min_width = 30,
		},
	})
end

return M
