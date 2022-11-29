local M = {}

local api = vim.api
local ts = vim.treesitter
local cond_obj = require('luasnip.extras.conditions')

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

---Check if cursor is in treesitter node of 'math_environment': 'align'
---@return boolean
local in_align = function()
	local buf = api.nvim_get_current_buf()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'math_environment' then
			local begin = node:child(0)
			local names = begin and begin:field('name')

			if names and names[1] and ALIGN_ENVIRONMENTS[ts.query.get_node_text(names[1], buf)] then
				return true
			end
		end
		node = node:parent()
	end
	return false
end

---Check if cursor is in treesitter node of 'generic_command': '\xymatrix'
---@return boolean
local in_xymatrix = function()
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

M.in_align = cond_obj.make_condition(in_align)
M.in_xymatrix = cond_obj.make_condition(in_xymatrix)

return M
