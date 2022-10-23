vim.keymap.set({ 'n', 't' }, '<C-\\>', require('FTerm').toggle, { desc = 'Terminal Toggle' })
vim.keymap.set('t', '<Esc>', require('FTerm').exit, { desc = 'Terminal Exit' })
vim.keymap.set('n', '<M-g>', function()
	require('FTerm')
		:new({
			cmd = 'lazygit',
			dimensions = { height = 1, width = 1 }
		})
		:open()
end, { desc = 'LazyGit' })

-- Code Runner - execute commands in a floating terminal
local runners = { lua = 'lua', python = 'python3', swift = 'swift' }

vim.keymap.set('n', '<leader><Enter>', function()
	local buf = vim.api.nvim_buf_get_name(0)
	local ftype = vim.filetype.match({ filename = buf })
	local exec = runners[ftype]
	if exec ~= nil then
		require('FTerm').scratch({ cmd = { exec, buf } })
	end
end)
