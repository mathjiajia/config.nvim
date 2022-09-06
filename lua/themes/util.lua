local M = {}

M.bg = '#000000'
M.fg = '#ffffff'
M.day_brightness = 0.3

local function hexToRgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

function M.blend(fg, bg, alpha)
	bg = hexToRgb(bg)
	fg = hexToRgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format('#%02x%02x%02x', blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.darken(hex, amount, bg)
	return M.blend(hex, bg or M.bg, math.abs(amount))
end

function M.lighten(hex, amount, fg)
	return M.blend(hex, fg or M.fg, math.abs(amount))
end

function M.brighten(color, percentage)
	local hsluv = require 'themes.hsluv'

	local hsl = hsluv.hex_to_hsluv(color)
	local larpSpace = 100 - hsl[3]
	if percentage < 0 then
		larpSpace = hsl[3]
	end
	hsl[3] = hsl[3] + larpSpace * percentage
	return hsluv.hsluv_to_hex(hsl)
end

-- function M.invert_color(color)
-- 	local hsluv = require 'themes.hsluv'
-- 	if color ~= 'NONE' then
-- 		local hsl = hsluv.hex_to_hsluv(color)
-- 		hsl[3] = 100 - hsl[3]
-- 		if hsl[3] < 40 then
-- 			hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
-- 		end
-- 		return hsluv.hsluv_to_hex(hsl)
-- 	end
-- 	return color
-- end

-- function M.invert_colors(colors)
-- 	if type(colors) == 'string' then
-- 		return M.invert_color(colors)
-- 	end
-- 	for key, value in pairs(colors) do
-- 		colors[key] = M.invert_colors(value)
-- 	end
-- end

return M
