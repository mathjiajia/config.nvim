local M = {}

local cond_obj = require('luasnip.extras.conditions')

local on_top = function()
	local cursor = vim.api.nvim_win_get_cursor(0)
	if cursor[1] <= 3 then
		return true
	end
	return false
end

local in_beamer = function()
	local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)
	if first_line[1]:match '\\documentclass.*{beamer}' then
		return true
	end
	return false
end

M.on_top = cond_obj.make_condition(on_top)
M.in_beamer = cond_obj.make_condition(in_beamer)

return M
