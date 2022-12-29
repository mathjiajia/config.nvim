local M = {}

function M.setup(bufnr)
	vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
		require('lspsaga.codeaction'):code_action()
	end, { buffer = bufnr, desc = '(Range) Code Actions' })
end

return M
