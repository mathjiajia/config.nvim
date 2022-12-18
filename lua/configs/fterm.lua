local term = require('FTerm')

local api = vim.api

vim.keymap.set({ 'n', 't' }, '<C-\\>', term.toggle, { desc = 'Toggle Terminal' })
vim.keymap.set('t', '<Esc>', term.exit, { desc = 'Exit Terminal' })

local lazygit = term:new({
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
		local buf = api.nvim_buf_get_name(0)
		local ftype = vim.filetype.match({ filename = buf })
		local exec = runners[ftype]
		if exec ~= nil then
			term.scratch({ cmd = { exec, buf } })
		end
	end,
	{ desc = 'Code Runner' }
)
