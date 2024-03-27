vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

vim.bo.buflisted = false

vim.keymap.set("n", "q", function()
	vim.api.nvim_win_close(0, false)
end, { buffer = true, silent = true })
