-- Modofied from https://github.com/folke/tokyonight.nvim
vim.g.colors_name = 'tokyonight'

local hsluv = {}
local hexChars = '0123456789abcdef'

local length_of_ray_until_intersect = function(theta, line)
	return line.intercept / (math.sin(theta) - line.slope * math.cos(theta))
end

hsluv.get_bounds = function(l)
	local result = {}
	local sub2
	local sub1 = ((l + 16) ^ 3) / 1560896
	if sub1 > hsluv.epsilon then
		sub2 = sub1
	else
		sub2 = l / hsluv.kappa
	end

	for i = 1, 3 do
		local m1 = hsluv.m[i][1]
		local m2 = hsluv.m[i][2]
		local m3 = hsluv.m[i][3]

		for t = 0, 1 do
			local top1 = (284517 * m1 - 94839 * m3) * sub2
			local top2 = (838422 * m3 + 769860 * m2 + 731718 * m1) * l * sub2 - 769860 * t * l
			local bottom = (632260 * m3 - 126452 * m2) * sub2 + 126452 * t
			table.insert(result, { slope = top1 / bottom, intercept = top2 / bottom })
		end
	end
	return result
end

hsluv.max_safe_chroma_for_lh = function(l, h)
	local hrad = h / 360 * math.pi * 2
	local bounds = hsluv.get_bounds(l)
	local min = 1.7976931348623157e+308

	for i = 1, 6 do
		local bound = bounds[i]
		local length = length_of_ray_until_intersect(hrad, bound)
		if length >= 0 then
			min = math.min(min, length)
		end
	end
	return min
end

hsluv.dot_product = function(a, b)
	local sum = 0
	for i = 1, 3 do
		sum = sum + a[i] * b[i]
	end
	return sum
end

hsluv.from_linear = function(c)
	if c <= 0.0031308 then
		return 12.92 * c
	else
		return 1.055 * (c ^ 0.416666666666666685) - 0.055
	end
end

hsluv.to_linear = function(c)
	if c > 0.04045 then
		return ((c + 0.055) / 1.055) ^ 2.4
	else
		return c / 12.92
	end
end

hsluv.xyz_to_rgb = function(tuple)
	return {
		hsluv.from_linear(hsluv.dot_product(hsluv.m[1], tuple)),
		hsluv.from_linear(hsluv.dot_product(hsluv.m[2], tuple)),
		hsluv.from_linear(hsluv.dot_product(hsluv.m[3], tuple)),
	}
end

hsluv.rgb_to_xyz = function(tuple)
	local rgbl = { hsluv.to_linear(tuple[1]), hsluv.to_linear(tuple[2]), hsluv.to_linear(tuple[3]) }
	return {
		hsluv.dot_product(hsluv.minv[1], rgbl),
		hsluv.dot_product(hsluv.minv[2], rgbl),
		hsluv.dot_product(hsluv.minv[3], rgbl),
	}
end

hsluv.y_to_l = function(Y)
	if Y <= hsluv.epsilon then
		return Y / hsluv.refY * hsluv.kappa
	else
		return 116 * ((Y / hsluv.refY) ^ 0.333333333333333315) - 16
	end
end

hsluv.l_to_y = function(L)
	if L <= 8 then
		return hsluv.refY * L / hsluv.kappa
	else
		return hsluv.refY * (((L + 16) / 116) ^ 3)
	end
end

hsluv.xyz_to_luv = function(tuple)
	local X = tuple[1]
	local Y = tuple[2]
	local divider = X + 15 * Y + 3 * tuple[3]
	local varU = 4 * X
	local varV = 9 * Y
	if divider ~= 0 then
		varU = varU / divider
		varV = varV / divider
	else
		varU = 0
		varV = 0
	end
	local L = hsluv.y_to_l(Y)
	if L == 0 then
		return { 0, 0, 0 }
	end
	return { L, 13 * L * (varU - hsluv.refU), 13 * L * (varV - hsluv.refV) }
end

hsluv.luv_to_xyz = function(tuple)
	local L = tuple[1]
	local U = tuple[2]
	local V = tuple[3]
	if L == 0 then
		return { 0, 0, 0 }
	end
	local varU = U / (13 * L) + hsluv.refU
	local varV = V / (13 * L) + hsluv.refV
	local Y = hsluv.l_to_y(L)
	local X = 0 - (9 * Y * varU) / (((varU - 4) * varV) - varU * varV)
	return { X, Y, (9 * Y - 15 * varV * Y - varV * X) / (3 * varV) }
end

hsluv.luv_to_lch = function(tuple)
	local L = tuple[1]
	local U = tuple[2]
	local V = tuple[3]
	local C = math.sqrt(U * U + V * V)
	local H
	if C < 0.00000001 then
		H = 0
	else
		H = math.atan2(V, U) * 180.0 / 3.1415926535897932
		if H < 0 then
			H = 360 + H
		end
	end
	return { L, C, H }
end

hsluv.lch_to_luv = function(tuple)
	local L = tuple[1]
	local C = tuple[2]
	local Hrad = tuple[3] / 360.0 * 2 * math.pi
	return { L, math.cos(Hrad) * C, math.sin(Hrad) * C }
end

hsluv.hsluv_to_lch = function(tuple)
	local H = tuple[1]
	local S = tuple[2]
	local L = tuple[3]
	if L > 99.9999999 then
		return { 100, 0, H }
	end
	if L < 0.00000001 then
		return { 0, 0, H }
	end
	return { L, hsluv.max_safe_chroma_for_lh(L, H) / 100 * S, H }
end

hsluv.lch_to_hsluv = function(tuple)
	local L = tuple[1]
	local C = tuple[2]
	local H = tuple[3]
	local max_chroma = hsluv.max_safe_chroma_for_lh(L, H)
	if L > 99.9999999 then
		return { H, 0, 100 }
	end
	if L < 0.00000001 then
		return { H, 0, 0 }
	end

	return { H, C / max_chroma * 100, L }
end

hsluv.rgb_to_hex = function(tuple)
	local h = '#'
	for i = 1, 3 do
		local c = math.floor(tuple[i] * 255 + 0.5)
		local digit2 = math.fmod(c, 16)
		local x = (c - digit2) / 16
		local digit1 = math.floor(x)
		h = h .. string.sub(hexChars, digit1 + 1, digit1 + 1)
		h = h .. string.sub(hexChars, digit2 + 1, digit2 + 1)
	end
	return h
end

hsluv.hex_to_rgb = function(hex)
	hex = string.lower(hex)
	local ret = {}
	for i = 0, 2 do
		local char1 = string.sub(hex, i * 2 + 2, i * 2 + 2)
		local char2 = string.sub(hex, i * 2 + 3, i * 2 + 3)
		local digit1 = string.find(hexChars, char1) - 1
		local digit2 = string.find(hexChars, char2) - 1
		ret[i + 1] = (digit1 * 16 + digit2) / 255.0
	end
	return ret
end

hsluv.lch_to_rgb = function(tuple)
	return hsluv.xyz_to_rgb(hsluv.luv_to_xyz(hsluv.lch_to_luv(tuple)))
end

hsluv.rgb_to_lch = function(tuple)
	return hsluv.luv_to_lch(hsluv.xyz_to_luv(hsluv.rgb_to_xyz(tuple)))
end

hsluv.hsluv_to_rgb = function(tuple)
	return hsluv.lch_to_rgb(hsluv.hsluv_to_lch(tuple))
end

hsluv.rgb_to_hsluv = function(tuple)
	return hsluv.lch_to_hsluv(hsluv.rgb_to_lch(tuple))
end

hsluv.hsluv_to_hex = function(tuple)
	return hsluv.rgb_to_hex(hsluv.hsluv_to_rgb(tuple))
end

hsluv.hex_to_hsluv = function(s)
	return hsluv.rgb_to_hsluv(hsluv.hex_to_rgb(s))
end

hsluv.m = {
	{ 3.240969941904521, -1.537383177570093, -0.498610760293 },
	{ -0.96924363628087, 1.87596750150772, 0.041555057407175 },
	{ 0.055630079696993, -0.20397695888897, 1.056971514242878 },
}
hsluv.minv = {
	{ 0.41239079926595, 0.35758433938387, 0.18048078840183 },
	{ 0.21263900587151, 0.71516867876775, 0.072192315360733 },
	{ 0.019330818715591, 0.11919477979462, 0.95053215224966 },
}
hsluv.refY = 1.0
hsluv.refU = 0.19783000664283
hsluv.refV = 0.46831999493879
hsluv.kappa = 903.2962962
hsluv.epsilon = 0.0088564516

local util = {}

util.colorsUsed = {}
util.colorCache = {}

util.bg = '#000000'
util.fg = '#ffffff'
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
	if vim.g.theme_style ~= 'light' then
		return color
	end
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

---------
local function setup(config)
	local colors = {}

	colors = {
		none = 'NONE',
		bg_dark = '#1f2335',
		bg = '#24283b',
		bg_highlight = '#292e42',
		terminal_black = '#414868',
		fg = '#c0caf5',
		fg_dark = '#a9b1d6',
		fg_gutter = '#3b4261',
		dark3 = '#545c7e',
		comment = '#565f89',
		dark5 = '#737aa2',
		blue0 = '#3d59a1',
		blue = '#7aa2f7',
		cyan = '#7dcfff',
		blue1 = '#2ac3de',
		blue2 = '#0db9d7',
		blue5 = '#89ddff',
		blue6 = '#B4F9F8',
		blue7 = '#394b70',
		magenta = '#bb9af7',
		magenta2 = '#ff007c',
		purple = '#9d7cd8',
		orange = '#ff9e64',
		yellow = '#e0af68',
		green = '#9ece6a',
		green1 = '#73daca',
		green2 = '#41a6b5',
		teal = '#1abc9c',
		red = '#f7768e',
		red1 = '#db4b4b',
		git = {
			change = '#6183bb',
			add = '#449dab',
			delete = '#914c54',
			conflict = '#bb7a61',
		},
		gitSigns = {
			add = '#164846',
			change = '#394b70',
			delete = '#823c41',
		},
	}
	if vim.g.theme_style ~= 'storm' then
		colors.bg = '#1a1b26'
		colors.bg_dark = '#16161e'
	end
	util.bg = colors.bg
	util.day_brightness = config.dayBrightness

	colors.diff = {
		add = util.darken(colors.green2, 0.15),
		delete = util.darken(colors.red1, 0.15),
		change = util.darken(colors.blue7, 0.15),
		text = colors.blue7,
	}

	colors.gitSigns = {
		add = util.brighten(colors.gitSigns.add, 0.2),
		change = util.brighten(colors.gitSigns.change, 0.2),
		delete = util.brighten(colors.gitSigns.delete, 0.2),
	}

	colors.git.ignore = colors.dark3
	colors.black = util.darken(colors.bg, 0.8, '#000000')
	colors.border_highlight = colors.blue0
	colors.border = colors.black

	-- Popups and statusline always get a dark background
	colors.bg_popup = colors.bg_dark
	colors.bg_statusline = colors.bg_dark

	-- Sidebar and Floats are configurable
	colors.bg_sidebar = config.darkSidebar and colors.bg_dark or colors.bg
	colors.bg_float = config.darkFloat and colors.bg_dark or colors.bg

	colors.bg_visual = util.darken(colors.blue0, 0.7)
	colors.bg_search = colors.blue0
	colors.fg_sidebar = colors.fg_dark

	colors.error = colors.red1
	colors.warning = colors.yellow
	colors.info = colors.blue2
	colors.hint = colors.teal

	if config.transform_colors and vim.g.theme_style == 'light' then
		return util.light_colors(colors)
	end

	return colors
end

local config = {
	dayBrightness = 0.3,
	darkFloat = true,
	darkSidebar = true,
	transform_colors = true,
}

local theme = {}
theme.config = config
theme.colors = setup(config)
local c = theme.colors

------ BASICS ------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = c.black })
vim.api.nvim_set_hl(0, 'Conceal', { fg = c.dark5 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = c.bg_highlight })
vim.api.nvim_set_hl(0, 'CursorIM', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = c.bg_highlight })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.dark5 })
vim.api.nvim_set_hl(0, 'Directory', { fg = c.blue })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = c.bg })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = c.error })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = c.border_highlight }) -- FIXED
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = c.comment, bg = c.bg })
vim.api.nvim_set_hl(0, 'Folded', { fg = c.blue, bg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = c.black, bg = c.orange })
vim.api.nvim_set_hl(0, 'lCursor', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = c.terminal_black, bold = true }) -- FIXED
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = c.fg_dark, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = c.blue })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = c.fg_dark })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', {})
vim.api.nvim_set_hl(0, 'NonText', { fg = c.dark3 })
vim.api.nvim_set_hl(0, 'Normal', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = c.fg, bg = c.bg_float })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'NormalSB', { fg = c.fg_sidebar, bg = c.bg_sidebar })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = c.fg, bg = c.bg_popup })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = util.lighten(c.bg_popup, 0.95) })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = util.darken(c.fg_gutter, 0.8) })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'Question', { fg = c.blue })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = c.bg_visual, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = c.fg, bg = c.bg_search })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = c.fg_gutter, bg = c.bg })
vim.api.nvim_set_hl(0, 'SignColumnSB', { fg = c.fg_gutter, bg = c.bg_sidebar })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = c.dark3 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.black, bg = c.blue }) -- FIXED
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = c.fg_gutter, bg = c.bg_statusline })
vim.api.nvim_set_hl(0, 'Substitute', { fg = c.black, bg = c.red })
vim.api.nvim_set_hl(0, 'TabLine', { fg = c.fg_gutter, bg = c.bg_statusline })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = c.bg }) -- FIXED
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = c.black, bg = c.blue })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', { fg = c.border })
vim.api.nvim_set_hl(0, 'Visual', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = c.warning })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = c.border })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = c.diff.add })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = c.diff.change })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = c.diff.delete })
vim.api.nvim_set_hl(0, 'DiffText', { bg = c.diff.text })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = c.error })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = c.warning })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = c.info })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = c.hint })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Bold', { bold = true })
-- vim.api.nvim_set_hl(0, 'Boolean', {})
vim.api.nvim_set_hl(0, 'Character', { fg = c.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = c.comment, italic = true })
-- vim.api.nvim_set_hl(0, 'Conditional', {})
vim.api.nvim_set_hl(0, 'Constant', { fg = c.orange })
-- vim.api.nvim_set_hl(0, 'Debug', {})
-- vim.api.nvim_set_hl(0, 'Define', {})
-- vim.api.nvim_set_hl(0, 'Delimiter', {})
vim.api.nvim_set_hl(0, 'Error', { fg = c.error })
-- vim.api.nvim_set_hl(0, 'Exception', {})
-- vim.api.nvim_set_hl(0, 'Float', {})
vim.api.nvim_set_hl(0, 'Function', { fg = c.blue, italic = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.magenta, italic = true })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
-- vim.api.nvim_set_hl(0, 'Include', {})
vim.api.nvim_set_hl(0, 'Italic', { italic = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.cyan, italic = true })
-- vim.api.nvim_set_hl(0, 'Label', {})
-- vim.api.nvim_set_hl(0, 'Macro', {})
-- vim.api.nvim_set_hl(0, 'Number', {})
vim.api.nvim_set_hl(0, 'Operator', { fg = c.blue5 })
-- vim.api.nvim_set_hl(0, 'PreCondit', {})
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.cyan })
-- vim.api.nvim_set_hl(0, 'Repeat', {})
vim.api.nvim_set_hl(0, 'Special', { fg = c.blue1 })
-- vim.api.nvim_set_hl(0, 'SpecialChar', {})
-- vim.api.nvim_set_hl(0, 'SpecialComment', {})
vim.api.nvim_set_hl(0, 'Statement', { fg = c.magenta })
-- vim.api.nvim_set_hl(0, 'StorageClass', {})
vim.api.nvim_set_hl(0, 'String', { fg = c.green })
-- vim.api.nvim_set_hl(0, 'Structure', {})
-- vim.api.nvim_set_hl(0, 'Tag', {})
vim.api.nvim_set_hl(0, 'Title', { fg = c.blue, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = c.bg, bg = c.yellow })
vim.api.nvim_set_hl(0, 'Type', { fg = c.blue1 })
-- vim.api.nvim_set_hl(0, 'Typedef', {})
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = c.bg_sidebar })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = c.info , bg = util.darken(c.info, 0.1)})

vim.api.nvim_set_hl(0, 'healthError', { fg = c.error })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = c.green1 })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = c.warning })

vim.api.nvim_set_hl(0, 'qfLineNr', { fg = c.dark5 })
vim.api.nvim_set_hl(0, 'qfFileName', { fg = c.blue })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = c.error })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = c.warning })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = c.info })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = c.hint })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = c.error, bg = util.darken(c.error, 0.1) })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = c.warning, bg = util.darken(c.warning, 0.1) })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = c.info, bg = util.darken(c.info, 0.1) })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = c.hint, bg = util.darken(c.hint, 0.1) })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = c.error })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = c.warning })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = c.info })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = c.hint })

------ GIT ------
-- vim.api.nvim_set_hl(0, 'diffRemoved', { fg = c.git.delete })
-- vim.api.nvim_set_hl(0, 'diffChanged', { fg = c.git.change })
-- vim.api.nvim_set_hl(0, 'diffOldFile', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'diffNewFile', { fg = c.orange })
-- vim.api.nvim_set_hl(0, 'diffFile', { fg = c.blue })
-- vim.api.nvim_set_hl(0, 'diffLine', { fg = c.comment })
-- vim.api.nvim_set_hl(0, 'diffIndexLine', { fg = c.magenta })

------ NEOVIM LSP ------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = c.fg_gutter })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = c.comment })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = c.orange })

---------- AERIAL ----------
-- vim.api.nvim_set_hl(0, 'AerialArrayIcon', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { link = 'Boolean' })
-- vim.api.nvim_set_hl(0, 'AerialClassIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialConstantIcon', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { link = 'TSConstructor' })
-- vim.api.nvim_set_hl(0, 'AerialEnumIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { link = 'TSField' })
-- vim.api.nvim_set_hl(0, 'AerialEventIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialFieldIcon', { link = 'TSField' })
-- vim.api.nvim_set_hl(0, 'AerialFileIcon', { link = 'Include' })
-- vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { link = 'Function' })
-- vim.api.nvim_set_hl(0, 'AerialInterfaceIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialKeyIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialMethodIcon', { link = 'TSMethod' })
-- vim.api.nvim_set_hl(0, 'AerialModuleIcon', { link = 'Include' })
-- vim.api.nvim_set_hl(0, 'AerialNamespaceIcon', { link = 'TSNamespace' })
-- vim.api.nvim_set_hl(0, 'AerialNullIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialNumberIcon', { link = 'Number' })
-- vim.api.nvim_set_hl(0, 'AerialObjectIcon', { link = 'TSField' })
-- vim.api.nvim_set_hl(0, 'AerialOperatorIcon', { link = '' })
-- vim.api.nvim_set_hl(0, 'AerialPackageIcon', { link = 'Include' })
-- vim.api.nvim_set_hl(0, 'AerialPropertyIcon', { link = 'TSProperty' })
-- vim.api.nvim_set_hl(0, 'AerialStringIcon', { link = 'String' })
-- vim.api.nvim_set_hl(0, 'AerialStructIcon', { link = 'TSField' })
-- vim.api.nvim_set_hl(0, 'AerialTypeParameterIcon', { link = 'TSParameter' })
-- vim.api.nvim_set_hl(0, 'AerialVariableIcon', { link = 'TSVariableBuiltin' })

-- Cmp
vim.api.nvim_set_hl(0, 'CmpDocumentation', { fg = c.fg, bg = c.bg_float })
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { fg = c.border_highlight, bg = c.bg_float })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = c.fg, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = c.fg_gutter, bg = c.none, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = c.blue1, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = c.blue1, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindDefault', { fg = c.fg_dark, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = c.comment, bg = c.none })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = c.orange, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = c.magenta, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = c.blue, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = c.orange, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = c.green1, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = c.orange, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = c.green1, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = c.blue, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = c.orange, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = c.cyan, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = c.blue, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = c.yellow, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = c.green1, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = c.green1, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = c.magenta, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = c.dark5, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = c.orange, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = c.green1, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = c.orange, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = c.magenta, bg = c.none })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = c.magenta, bg = c.none })

-- GitSigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = c.gitSigns.add })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = c.gitSigns.change })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = c.gitSigns.delete })

-- Hop
vim.api.nvim_set_hl(0, 'HopNextKey', { fg = c.magenta2, bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey1', { fg = c.blue2, bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey2', { fg = util.darken(c.blue2, 0.3) })
vim.api.nvim_set_hl(0, 'HopUnmatched', { fg = c.dark3 })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = c.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = c.orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = c.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = c.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = c.blue })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = c.purple })

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = c.bg_dark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = c.fg, bg = c.bg_highlight })

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = c.red, bg = c.bg_highlight })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = c.fg, bg = c.bg_highlight })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = c.bg_dark, bg = c.bg_dark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = c.bg_highlight, bg = c.bg_highlight })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = c.bg, bg = c.green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = c.bg, bg = c.red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = c.bg_dark, bg = c.blue })

------ TREESITTER ------
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
-- vim.api.nvim_set_hl(0, 'TSAttribute', {})
-- vim.api.nvim_set_hl(0, 'TSBoolean', {})
-- vim.api.nvim_set_hl(0, 'TSCharacter', {})
-- vim.api.nvim_set_hl(0, 'TSComment', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = c.bg, bg = c.info })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = c.bg, bg = c.warning })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = c.bg, bg = c.error })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = c.magenta })
-- vim.api.nvim_set_hl(0, 'TSConditional', {})
-- vim.api.nvim_set_hl(0, 'TSConstant', {})
-- vim.api.nvim_set_hl(0, 'TSConstBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSConstMacro', {})
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = c.green1 }) -- ADDED
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = c.orange }) -- ADDED
-- vim.api.nvim_set_hl(0, 'TSError', {})
-- vim.api.nvim_set_hl(0, 'TSException', {})
vim.api.nvim_set_hl(0, 'TSField', { fg = c.green1 })
-- vim.api.nvim_set_hl(0, 'TSFloat', {})
-- vim.api.nvim_set_hl(0, 'TSFunction', {})
-- vim.api.nvim_set_hl(0, 'TSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', {})
-- vim.api.nvim_set_hl(0, 'TSInclude', {})
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = c.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = c.magenta, italic = true })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = c.blue })
vim.api.nvim_set_hl(0, 'TSMath', { fg = c.yellow }) -- ADDED
-- vim.api.nvim_set_hl(0, 'TSMethod', {})
-- vim.api.nvim_set_hl(0, 'TSNamespace', {})
-- vim.api.nvim_set_hl(0, 'TSNone', {})
-- vim.api.nvim_set_hl(0, 'TSNumber', {})
vim.api.nvim_set_hl(0, 'TSOperator', { fg = c.blue5 })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { fg = c.green1 })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = c.blue5 })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = c.fg_dark })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = c.blue5 })
-- vim.api.nvim_set_hl(0, 'TSRepeat', {})
-- vim.api.nvim_set_hl(0, 'TSString', {})
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = c.blue6 })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = c.magenta })
-- vim.api.nvim_set_hl(0, 'TSSymbol', {})
-- vim.api.nvim_set_hl(0, 'TSType', {})
-- vim.api.nvim_set_hl(0, 'TSTypeBuiltin', {})
vim.api.nvim_set_hl(0, 'TSVariable', { italic = true })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'TSTag', {})
-- vim.api.nvim_set_hl(0, 'TSTagDelimiter', {})
-- vim.api.nvim_set_hl(0, 'TSText', {})
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = c.teal })
-- vim.api.nvim_set_hl(0, 'TSEmphasis', {})
-- vim.api.nvim_set_hl(0, 'TSUnderline', {})
-- vim.api.nvim_set_hl(0, 'TSStrike', {})
-- vim.api.nvim_set_hl(0, 'TSTitle', {})
-- vim.api.nvim_set_hl(0, 'TSLiteral', {})
-- vim.api.nvim_set_hl(0, 'TSURI', {})

------ HTML ------
-- vim.api.nvim_set_hl(0, 'htmlH1', { fg = c.magenta, bold = true })
-- vim.api.nvim_set_hl(0, 'htmlH2', { fg = c.blue, bold = true })

------ LUA ------
-- vim.api.nvim_set_hl(0, 'luaTSProperty', { fg = c.red })

------ MARKDOWN ------
-- vim.api.nvim_set_hl(0, 'mkdHeading', { fg = c.orange, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdCode', { fg = c.fg , bg = c.terminal_black})
-- vim.api.nvim_set_hl(0, 'mkdCodeDelimiter', { fg = c.fg , bg = c.terminal_black})
-- vim.api.nvim_set_hl(0, 'mkdCodeStart', { fg = c.teal, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdCodeEnd', { fg = c.teal, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdLink', { fg = c.blue, underline = true })

-- vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = c.orange, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownCode', { fg = c.teal })
-- vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = c.teal })
-- vim.api.nvim_set_hl(0, 'markdownH1', { fg = c.magenta, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownH2', { fg = c.blue, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = c.blue, underline = true })

-- dark
vim.g.terminal_color_0 = c.black
vim.g.terminal_color_8 = c.terminal_black

-- light
vim.g.terminal_color_7 = c.fg_dark
vim.g.terminal_color_15 = c.fg

-- colors
vim.g.terminal_color_1 = c.red
vim.g.terminal_color_9 = c.red

vim.g.terminal_color_2 = c.green
vim.g.terminal_color_10 = c.green

vim.g.terminal_color_3 = c.yellow
vim.g.terminal_color_11 = c.yellow

vim.g.terminal_color_4 = c.blue
vim.g.terminal_color_12 = c.blue

vim.g.terminal_color_5 = c.magenta
vim.g.terminal_color_13 = c.magenta

vim.g.terminal_color_6 = c.cyan
vim.g.terminal_color_14 = c.cyan
