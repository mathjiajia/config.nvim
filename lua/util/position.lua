local M = {}

local api = vim.api
local cond_obj = require("luasnip.extras.conditions")

---Check if cursor is in the beginning of a line
---@return boolean
local function line_begin(line_to_cursor)
	return line_to_cursor:sub(1, -2):match("^%s*$")
end

---Check if cursor is in the top 3 lines of a file
---@return boolean
local function on_top()
	local cursor = api.nvim_win_get_cursor(0)
	if cursor[1] <= 3 then
		return true
	end
	return false
end

---Check if the current tex file is a beamer class
---@return boolean
local function in_beamer()
	local first_line = api.nvim_buf_get_lines(0, 0, 1, false)
	if first_line[1]:match("^\\documentclass.*{beamer}$") then
		return true
	end
	return false
end

M.line_begin = cond_obj.make_condition(line_begin)
M.on_top = cond_obj.make_condition(on_top)
M.in_beamer = cond_obj.make_condition(in_beamer)

return M
