local M = {}

local hsluv = require 'utils.hsluv'

M.bg = '#000000'
M.fg = '#FFFFFF'
M.day_brightness = 0.3

---@param hex_str string hexadecimal value of a color
local hex_to_rgb = function(hex_str)
	local hex = '[abcdef0-9][abcdef0-9]'
	local pat = '^#(' .. hex .. ')(' .. hex .. ')(' .. hex .. ')$'
	hex_str = string.lower(hex_str)

	assert(string.find(hex_str, pat) ~= nil, 'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

	local red, green, blue = string.match(hex_str, pat)
	return { tonumber(red, 16), tonumber(green, 16), tonumber(blue, 16) }
end

function M.blend(fg, bg, alpha)
	bg = hex_to_rgb(bg)
	fg = hex_to_rgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format('#%02X%02X%02X', blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
	return M.blend(hex, bg or M.bg, math.abs(amount))
end

function M.lighten(hex, amount, fg)
	return M.blend(hex, fg or M.fg, math.abs(amount))
end

function M.brighten(color, percentage)
	local hsl = hsluv.hex_to_hsluv(color)
	local larpSpace = 100 - hsl[3]
	if percentage < 0 then
		larpSpace = hsl[3]
	end
	hsl[3] = hsl[3] + larpSpace * percentage
	return hsluv.hsluv_to_hex(hsl)
end

function M.invertColor(color)
	if color ~= 'NONE' then
		local hsl = hsluv.hex_to_hsluv(color)
		hsl[3] = 100 - hsl[3]
		if hsl[3] < 40 then
			hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
		end
		return hsluv.hsluv_to_hex(hsl)
	end
	return color
end

-- M.colorCache = {}

-- function M.getColor(color)
-- 	if vim.o.background == 'dark' then
-- 		return color
-- 	end
-- 	if not M.colorCache[color] then
-- 		M.colorCache[color] = M.invertColor(color)
-- 	end
-- 	return M.colorCache[color]
-- end

-- function M.light_colors(colors)
-- 	if type(colors) == 'string' then
-- 		return M.getColor(colors)
-- 	end
-- 	local ret = {}
-- 	for key, value in pairs(colors) do
-- 		ret[key] = M.light_colors(value)
-- 	end
-- 	return ret
-- end

return M
