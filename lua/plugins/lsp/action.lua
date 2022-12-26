local M = {}

function M.setup(client, bufnr)
	local caps = client.server_capabilities

	if caps.codeActionProvider then
		vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
			require('lspsaga.codeaction'):code_action()
		end, { buffer = bufnr, desc = '(Range) Code Actions' })
	end
end

return M
