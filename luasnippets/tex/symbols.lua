local snips, autosnips = {}, {}

local tex = require('utils.latex')

local pipe = function(fns)
	return function(...)
		for _, fn in ipairs(fns) do
			if not fn(...) then
				return false
			end
		end
		return true
	end
end

snips = {}

autosnips = {}

return snips, autosnips
