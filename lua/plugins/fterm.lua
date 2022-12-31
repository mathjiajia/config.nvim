local M = {
	'numtostr/FTerm.nvim',
}

M.keys = {
	{ '<M-i>', function()
		require('FTerm').toggle()
	end, mode = { 'n', 't' }, desc = 'Toggle Terminal' },


	{ '<leader><Enter>', function()
		require('utils').code_run()
	end, desc = 'Code Runner' },
}

M.config = function()
	vim.keymap.set('t', '<Esc>', function()
		require('FTerm').exit()
	end, { desc = 'Exit Terminal' })
end

return M
