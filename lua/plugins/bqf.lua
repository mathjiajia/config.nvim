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

M.config = {
	preview = {
		win_height = 5,
		win_vheight = 5,
	},
}

return M
