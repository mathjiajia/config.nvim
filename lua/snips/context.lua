local M = {}

local cond_obj = require('luasnip.extras.conditions')

---Check if cursor is in treesitter capture
---@param capture (string|string[])
---@return boolean
local in_ts_capture = function(capture)
	local buf = vim.api.nvim_get_current_buf()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1
	col = col - 1

	local get_captures_at_pos = vim.treesitter.get_captures_at_pos

	local captures_at_cursor = vim.tbl_map(function(x)
		return x.capture
	end, get_captures_at_pos(buf, row, col))

	if vim.tbl_isempty(captures_at_cursor) then
		return false
	elseif type(capture) == 'string' and vim.tbl_contains(captures_at_cursor, capture) then
		return true
	elseif type(capture) == 'table' then
		for _, v in ipairs(capture) do
			if vim.tbl_contains(captures_at_cursor, v) then
				return true
			end
		end
	end

	return false
end

---Check if cursor is in treesitter capture of 'comment'
---@return boolean
local function in_comments()
	return in_ts_capture 'comment'
end

---Check if cursor is in treesitter capture of 'text.math'
---@return boolean
local function in_mathzone()
	return in_ts_capture 'text.math'
end

---Check if cursor is in treesitter node of 'text'
---@return boolean
local function in_text()
	-- TODO: maybe use 'spell' when they fix it
	-- return in_ts_capture 'spell'
	return not in_ts_capture({ 'text.math', 'function', 'include', '_name' })
end

M.in_comments = cond_obj.make_condition(in_comments)
M.in_mathzone = cond_obj.make_condition(in_mathzone)
M.in_text = cond_obj.make_condition(in_text)

return M
