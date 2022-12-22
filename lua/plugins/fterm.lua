local M = {
	'numtostr/FTerm.nvim',
}

function M.config()
	vim.keymap.set('t', '<C-\\>', function()
		require('FTerm').toggle()
	end, { desc = 'Toggle Terminal' })

	vim.keymap.set('t', '<Esc>', function()
		require('FTerm').exit()
	end, { desc = 'Exit Terminal' })
end

M.keys = {
	{ '<C-\\>', function()
		require('FTerm').toggle()
	end, desc = 'Toggle Terminal' },

	{ '<M-g>', function()
		require('FTerm'):new({
			ft = 'fterm_gitui',
			cmd = 'lazygit',
			dimensions = {
				height = 1,
				width = 1
			}
		}):open()
	end, buffer = true, desc = 'LazyGit' },

	{ '<leader><Enter>', function()
		local runners = { lua = 'lua', python = 'python3', swift = 'swift' }
		local api = vim.api

		local buf = api.nvim_buf_get_name(0)
		local ftype = vim.filetype.match({ filename = buf })
		local exec = runners[ftype]
		if exec ~= nil then
			require('FTerm').scratch({ cmd = { exec, buf } })
		end
	end, buffer = true, desc = 'Code Runner' },
}

return M
