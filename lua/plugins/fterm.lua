local M = {
	'numtostr/FTerm.nvim',
}

M.keys = {
	{ '<C-\\>', function()
		require('FTerm').toggle()
	end, mode = { 'n', 't' }, desc = 'Toggle Terminal' },

	{ '<Esc>', function()
		require('FTerm').exit()
	end, mode = 't', desc = 'Exit Terminal' },

	{ '<M-g>', function()
		require('FTerm'):new({
			ft = 'fterm_lazygit',
			cmd = 'lazygit',
			dimensions = {
				height = 1,
				width = 1
			}
		}):open()
	end, desc = 'LazyGit' },

	{ '<leader><Enter>', function()
		local runners = {
			lua = 'lua',
			python = 'python3',
			swift = 'swift',
		}

		local buf = vim.api.nvim_buf_get_name(0)
		local ftype = vim.filetype.match({ filename = buf })
		local exec = runners[ftype]
		if exec ~= nil then
			require('FTerm').scratch({ cmd = { exec, buf } })
		end
	end, desc = 'Code Runner' },
}

return M
