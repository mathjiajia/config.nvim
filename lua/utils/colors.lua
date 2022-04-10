local hsluv = require 'utils.hsluv'

local util = {}

util.colorsUsed = {}
util.colorCache = {}

util.bg = '#000000'
util.fg = '#FFFFFF'
util.day_brightness = 0.3

local function hexToRgb(hex_str)
	local hex = '[abcdef0-9][abcdef0-9]'
	local pat = '^#(' .. hex .. ')(' .. hex .. ')(' .. hex .. ')$'
	hex_str = string.lower(hex_str)

	assert(string.find(hex_str, pat) ~= nil, 'hex_to_rgb: invalid hex_str: ' .. tostring(hex_str))

	local r, g, b = string.match(hex_str, pat)
	return { tonumber(r, 16), tonumber(g, 16), tonumber(b, 16) }
end

function util.blend(fg, bg, alpha)
	bg = hexToRgb(bg)
	fg = hexToRgb(fg)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format('#%02X%02X%02X', blendChannel(1), blendChannel(2), blendChannel(3))
end

function util.darken(hex, amount, bg)
	return util.blend(hex, bg or util.bg, math.abs(amount))
end

function util.lighten(hex, amount, fg)
	return util.blend(hex, fg or util.fg, math.abs(amount))
end

function util.brighten(color, percentage)
	local hsl = hsluv.hex_to_hsluv(color)
	local larpSpace = 100 - hsl[3]
	if percentage < 0 then
		larpSpace = hsl[3]
	end
	hsl[3] = hsl[3] + larpSpace * percentage
	return hsluv.hsluv_to_hex(hsl)
end

function util.invertColor(color)
	if color ~= 'NONE' then
		local hsl = hsluv.hex_to_hsluv(color)
		hsl[3] = 100 - hsl[3]
		if hsl[3] < 40 then
			hsl[3] = hsl[3] + (100 - hsl[3]) * util.day_brightness
		end
		return hsluv.hsluv_to_hex(hsl)
	end
	return color
end

function util.getColor(color)
	-- if vim.o.background == 'dark' then
	-- 	return color
	-- end
	if not util.colorCache[color] then
		util.colorCache[color] = util.invertColor(color)
	end
	return util.colorCache[color]
end

function util.light_colors(colors)
	if type(colors) == 'string' then
		return util.getColor(colors)
	end
	local ret = {}
	for key, value in pairs(colors) do
		ret[key] = util.light_colors(value)
	end
	return ret
end

return util
