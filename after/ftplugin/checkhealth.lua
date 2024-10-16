vim.opt_local.buflisted = false

vim.keymap.set("n", "q", function()
	vim.api.nvim_win_close(0, false)
end, { buffer = 0, silent = true })
