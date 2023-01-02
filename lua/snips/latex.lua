local M = {}

local api = vim.api
local ts = vim.treesitter
local cond_obj = require('luasnip.extras.conditions')

local MATH_NODES = {
	displayed_equation = true,
	inline_formula = true,
	math_environment = true,
}

local ALIGN_ENVIRONMENTS = {
	['{multline}']  = true,
	['{eqnarray}']  = true,
	['{align}']     = true,
	['{array}']     = true,
	['{split}']     = true,
	['{alignat}']   = true,
	['[gather]']    = true,
	['{flalign}']   = true,
}

local function get_node_at_cursor()
	local buf = api.nvim_get_current_buf()
	local row, col = unpack(api.nvim_win_get_cursor(0))
	row = row - 1
	col = col - 1

	local parser = ts.get_parser(buf, 'latex')
	if not parser then
		return
	end

	local root_tree = parser:parse()[1]
	local root = root_tree and root_tree:root()

	if not root then
		return
	end

	return root:named_descendant_for_range(row, col, row, col)
end

---Check if cursor is in treesitter node of 'math_environment': 'tikzcd'
---@return boolean
-- local function in_tikzcd()
-- 	local buf = api.nvim_get_current_buf()
-- 	local node = get_node_at_cursor()
-- 	while node do
-- 		if node:type() == 'generic_environment' then
-- 			local begin = node:child(0)
-- 			local names = begin and begin:field('name')

-- 			if names and names[1] and ts.query.get_node_text(names[1], buf) == 'tikzcd' then
-- 				return true
-- 			end
-- 		end
-- 		node = node:parent()
-- 	end
-- 	return false
-- end

---Check if cursor is in treesitter node of 'text'
---@return boolean
local function in_text()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'text_mode' then
			return true
		elseif MATH_NODES[node:type()] then
			return false
		end
		node = node:parent()
	end
	return true
end

---Check if cursor is in treesitter node of 'math'
---@return boolean
local function in_mathzone()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'text_mode' then
			return false
		elseif MATH_NODES[node:type()] then
			return true
		end
		node = node:parent()
	end
	return false
end

---Check if cursor is in treesitter node of 'math_environment': 'align'
---@return boolean
local function in_align()
	local buf = api.nvim_get_current_buf()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'math_environment' then
			local begin = node:child(0)
			local names = begin and begin:field('name')

			if names and names[1] and ALIGN_ENVIRONMENTS[ts.query.get_node_text(names[1], buf):gsub('%*', '')] then
				return true
			end
		end
		node = node:parent()
	end
	return false
end

---Check if cursor is in treesitter node of 'generic_command': '\xymatrix'
---@return boolean
local function in_xymatrix()
	local buf = api.nvim_get_current_buf()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'generic_command' then
			local names = node:child(0)
			if names and ts.query.get_node_text(names, buf) == '\\xymatrix' then
				return true
			end
		end
		node = node:parent()
	end
	return false
end

M.in_mathzone = cond_obj.make_condition(in_mathzone)
M.in_text = cond_obj.make_condition(in_text)
M.in_align = cond_obj.make_condition(in_align)
M.in_xymatrix = cond_obj.make_condition(in_xymatrix)

return M
