local M = {}

---Check if cursor is in treesitter capture of 'comment'
---@return boolean
function M.in_comments()
    local buf = vim.api.nvim_get_current_buf()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    row = row - 1
    col = col - 1

    local get_captures_at_pos = require('vim.treesitter').get_captures_at_pos

    local captures_at_cursor = vim.tbl_map(function(x)
        return x.capture
    end, get_captures_at_pos(buf, row, col))

    if vim.tbl_isempty(captures_at_cursor) then
        return false
    elseif vim.tbl_contains(captures_at_cursor, 'comment') then
        return true
    end

    return false
end

return M
