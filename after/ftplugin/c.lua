local util = require("util")

vim.keymap.set("n", "<leader><Enter>", function()
	local buf = vim.api.nvim_buf_get_name(0)
	local exec = "!clang " .. buf
	vim.cmd(exec)
	vim.defer_fn(function()
		util.float_term("./a.out", { interactive = false })
		vim.cmd.startinsert()
	end, 100)
end, { silent = true, buffer = true })
