local M = {
	'kevinhwang91/nvim-bqf',
	dependencies = {
		'junegunn/fzf',
		build = function()
			vim.fn['fzf#install']()
		end
	},
	ft = 'qf',
}

M.config = function()
	require('bqf').setup({
		preview = {
			win_height = 5,
			win_vheight = 5,
		},
	})
end

return M
