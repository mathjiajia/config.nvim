local M = {}

M.pipe = function(fns)
    return function(...)
        for _, fn in ipairs(fns) do
            if not fn(...) then
                return false
            end
        end

        return true
    end
end

return M
