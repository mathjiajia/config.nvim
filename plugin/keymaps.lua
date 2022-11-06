-- CURSOR MOVEMENTS
vim.keymap.set('n', '<M-h>', '<cmd>wincmd h<CR>', { desc = 'Move to Left Window' })
vim.keymap.set('n', '<M-l>', '<cmd>wincmd l<CR>', { desc = 'Move to Right Window' })
vim.keymap.set('n', '<M-j>', '<cmd>wincmd j<CR>', { desc = 'Move to Bottom Window' })
vim.keymap.set('n', '<M-k>', '<cmd>wincmd k<CR>', { desc = 'Move to Upper Window' })

-- REMAP FOR DEALING WITH WORD WRAP
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- INSERT
vim.keymap.set('i', '<C-f>', '<Right>', { desc = 'Move Forward a Char' })
vim.keymap.set('i', '<C-b>', '<Left>', { desc = 'Move Backward a Char' })

-- DIAGNOSTIC
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Float Diagnostics' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostics' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Loclist Diagnostics' })

local in_ts_capture = function()
	local buf = vim.api.nvim_get_current_buf()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1
	col = col - 1

	local captures = vim.treesitter.get_captures_at_pos(buf, row, col)

	print(vim.inspect(captures))
end

vim.keymap.set({ 'n', 'i', 'v' }, '<F4>', in_ts_capture)
