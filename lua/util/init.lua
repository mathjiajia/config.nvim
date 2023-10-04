local LazyUtil = require("lazy.core.util")

---@class util: LazyUtilCore
---@field root util.root
---@field telescope util.telescope
---@field terminal util.terminal
---@field toggle util.toggle
---@field format util.format
local M = {}

setmetatable(M, {
	__index = function(t, k)
		if LazyUtil[k] then
			return LazyUtil[k]
		end
		t[k] = require("util." .. k)
		return t[k]
	end,
})

return M
