local snips = {}

-- local capture = {
-- 	'comment',
-- 	'line_comment',
-- 	'block_comment',
-- 	'comment_environment',
-- }

-- local function in_comment()
-- 	local highlighter = require('vim.treesitter.highlighter')
-- 	local ts_utils = require('nvim-treesitter.ts_utils')
-- 	local buf = vim.api.nvim_get_current_buf()

-- 	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
-- 	row = row - 1
-- 	col = col - 1

-- 	local self = highlighter.active[buf]
-- 	if not self then
-- 		return false
-- 	end

-- 	local node_types = {}

-- 	self.tree:for_each_tree(function(tstree, tree)
-- 		if not tstree then
-- 			return
-- 		end

-- 		local root = tstree:root()
-- 		local root_start_row, _, root_end_row, _ = root:range()
-- 		if root_start_row > row or root_end_row < row then
-- 			return
-- 		end

-- 		local query = self:get_query(tree:lang())
-- 		if not query:query() then
-- 			return
-- 		end

-- 		local iter = query:query():iter_captures(root, self.bufnr, row, row + 1)
-- 		for _, node, _ in iter do
-- 			if ts_utils.is_in_node_range(node, row, col) then
-- 				table.insert(node_types, node:type())
-- 			end
-- 		end
-- 	end, true)

-- 	for _, value in ipairs(capture) do
-- 		if vim.tbl_contains(node_types, value) then
-- 			return true
-- 		end
-- 	end
-- 	return false
-- end

local COMMENT = {
	['comment'] = true,
	['line_comment'] = true,
	['block_comment'] = true,
	['comment_environment'] = true,
}

local function get_node_at_cursor()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local cursor_range = { cursor[1] - 1, cursor[2] - 1 }
	local buf = vim.api.nvim_get_current_buf()
	local ok, parser = pcall(require('vim.treesitter').get_parser, buf)
	if not ok or not parser then
		return
	end
	local root_tree = parser:parse()[1]
	local root = root_tree and root_tree:root()

	if not root then
		return
	end

	return root:named_descendant_for_range(cursor_range[1], cursor_range[2], cursor_range[1], cursor_range[2])
end

local function in_comment()
	local node = get_node_at_cursor()
	while node do
		if COMMENT[node:type()] then
			return true
		end
		node = node:parent()
	end
	return false
end

snips = {
	s(
		{ trig = 'todo', name = 'TODO, NOTE, FIXME' },
		{ c(1, {
			t('TODO(jia): '),
			t('NOTE(jia): '),
			t('FIXME(jia): '),
		}) },
		{ condition = in_comment, show_condition = in_comment }
	),
}

return snips
