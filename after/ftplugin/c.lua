local map = vim.keymap.set
local util = require("util")

local open_term = function(command)
	vim.cmd("belowright 15split +term | startinsert")
	local cr = vim.api.nvim_replace_termcodes("<CR>", true, false, true)
	vim.api.nvim_feedkeys(command .. cr, "n", true)
end

map("n", "<C-'>", function()
	-- Get the file path (without extension)
	local file = vim.api.nvim_buf_get_name(0):match("^(.*)%.c")
	local cmd = {
		"clang",
		"-o",
		file .. ".out",
		file .. ".c",
	}

	util.float_term(cmd)
end, { silent = true, buffer = true })
map("n", "<C-CR>", function()
	-- Get the file path (without extension)
	local file = vim.api.nvim_buf_get_name(0):match("^(.*)%.c")
	local cmd = {
		"g++-12",
		"-Wall",
		"-std=c++20",
		"-o",
		"'" .. file .. ".out'",
		"'" .. file .. ".c'",
		"&&",
		"time",
		"'" .. file .. ".out'",
	}
	table.insert(cmd, "<'" .. file:match("^(.*/)[^/]*$") .. "input.txt'")
	open_term(table.concat(cmd, " "))
end, { silent = true, buffer = true })
