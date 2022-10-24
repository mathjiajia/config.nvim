local M = {}

local cond_obj = require('luasnip.extras.conditions')

local on_top = function()
    local cursor = vim.api.nvim_win_get_cursor(0)
    if cursor[1] <= 3 then
        return true
    end
    return false
end

M.on_top = cond_obj.make_condition(on_top)

return M
