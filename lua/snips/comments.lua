local M = {}

local COMMENTS = {
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

function M.in_comments()
    local node = get_node_at_cursor()
    while node do
        if COMMENTS[node:type()] then
            return true
        end
        node = node:parent()
    end
    return false
end

return M
