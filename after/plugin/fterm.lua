vim.keymap.set({ 'n', 't' }, '<C-\\>', require('FTerm').toggle, { desc = 'Toggle Terminal' })
vim.keymap.set('t', '<Esc>', require('FTerm').exit, { desc = 'Exit Terminal' })

local lazygit = require('FTerm'):new({
	ft = 'fterm_gitui',
	cmd = 'lazygit',
	dimensions = {
		height = 1,
		width = 1
	}
})

vim.keymap.set(
	'n',
	'<M-g>',
	function()
		lazygit:open()
	end,
	{ desc = 'LazyGit' }
)

-- Code Runner - execute commands in a floating terminal
local runners = { lua = 'lua', python = 'python3', swift = 'swift' }

vim.keymap.set(
	'n',
	'<leader><Enter>',
	function()
		local buf = vim.api.nvim_buf_get_name(0)
		local ftype = vim.filetype.match({ filename = buf })
		local exec = runners[ftype]
		if exec ~= nil then
			require('FTerm').scratch({ cmd = { exec, buf } })
		end
	end,
	{ desc = 'Code Runner' }
)
