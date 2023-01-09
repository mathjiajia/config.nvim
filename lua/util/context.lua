local M = {}

local api = vim.api
local ts = vim.treesitter
local cond_obj = require("luasnip.extras.conditions")

---Check if cursor is in treesitter capture
---@param capture string
---@return boolean
local function in_ts_capture(capture)
	local buf = api.nvim_get_current_buf()
	local row, col = unpack(api.nvim_win_get_cursor(0))
	row = row - 1
	col = col - 1

	local captures = ts.get_captures_at_pos(buf, row, col)

	for _, c in ipairs(captures) do
		if c.capture == capture then
			return true
		end
	end

	return false
end

---Check if cursor is in treesitter capture of 'comment'
---@return boolean
local function in_comments()
	return in_ts_capture("comment")
end

M.in_comments = cond_obj.make_condition(in_comments)

return M
