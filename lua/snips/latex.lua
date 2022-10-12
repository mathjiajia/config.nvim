local M = {}

local ts = require 'vim.treesitter'
local query = require 'vim.treesitter.query'

---Check if cursor is in treesitter capture
---@param capture string | string[]
---@return boolean
local in_ts_capture = function(capture)
	local buf = vim.api.nvim_get_current_buf()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1
	col = col - 1

	local get_captures_at_pos = ts.get_captures_at_pos

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

---Check if cursor is in treesitter capture of 'text.math'
---@return boolean
function M.in_mathzone()
	return in_ts_capture 'text.math'
end

---Check if cursor is in treesitter node of 'text'
---@return boolean
function M.in_text()
	return not in_ts_capture({ 'text.math', 'function', 'include', '_name' })
end

local ALIGN_ENVIRONMENTS = {
	['{multline}']  = true,
	['{multline*}'] = true,
	['{eqnarray}']  = true,
	['{eqnarray*}'] = true,
	['{align}']     = true,
	['{align*}']    = true,
	['{array}']     = true,
	['{array*}']    = true,
	['{split}']     = true,
	['{split*}']    = true,
	['{alignat}']   = true,
	['{alignat*}']  = true,
	['[gather]']    = true,
	['[gather*]']   = true,
	['{flalign}']   = true,
	['{flalign*}']  = true,
}

local function get_node_at_cursor()
	local buf = vim.api.nvim_get_current_buf()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	row = row - 1
	col = col - 1
	local ts_range = { row, col, row, col }

	local parser = ts.get_parser(buf, 'latex')
	if not parser then
		return
	end

	local root_tree = parser:parse()[1]
	local root = root_tree and root_tree:root()

	if not root then
		return
	end

	return root:named_descendant_for_range(ts_range)
end

---Check if cursor is in treesitter node of 'math_environment': 'align'
---@return boolean
function M.in_align()
	local buf = vim.api.nvim_get_current_buf()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'math_environment' then
			local begin = node:child(0)
			local names = begin and begin:field 'name'

			if names and names[1] and ALIGN_ENVIRONMENTS[query.get_node_text(names[1], buf)] then
				return true
			end
		end
		node = node:parent()
	end
	return false
end

---Check if cursor is in treesitter node of 'generic_command': '\xymatrix'
---@return boolean
function M.in_xymatrix()
	local buf = vim.api.nvim_get_current_buf()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'generic_command' then
			local names = node:child(0)
			if names and query.get_node_text(names, buf) == '\\xymatrix' then
				return true
			end
		end
		node = node:parent()
	end
	return false
end

return M
