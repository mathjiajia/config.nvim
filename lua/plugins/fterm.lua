local M = {
	'numtostr/FTerm.nvim',
}

M.init = function()
	vim.keymap.set(
		{ 'n', 't' },
		'<C-\\>',
		function()
			require('FTerm').toggle()
		end,
		{ desc = 'Toggle Terminal' }
	)

	vim.keymap.set(
		'n',
		'<M-g>',
		function()
			require('FTerm'):new({
				ft = 'fterm_gitui',
				cmd = 'lazygit',
				dimensions = {
					height = 1,
					width = 1
				}
			}):open()
		end,
		{ buffer = true, desc = 'LazyGit' }
	)

	-- Code Runner - execute commands in a floating terminal
	local runners = { lua = 'lua', python = 'python3', swift = 'swift' }
	local api = vim.api

	vim.keymap.set(
		'n',
		'<leader><Enter>',
		function()
			local buf = api.nvim_buf_get_name(0)
			local ftype = vim.filetype.match({ filename = buf })
			local exec = runners[ftype]
			if exec ~= nil then
				require('FTerm').scratch({ cmd = { exec, buf } })
			end
		end,
		{ buffer = true, desc = 'Code Runner' }
	)
end

M.config = function()
	vim.keymap.set(
		't',
		'<Esc>',
		function()
			require('FTerm').exit()
		end,
		{ desc = 'Exit Terminal' }
	)
end

return M
