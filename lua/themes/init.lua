local M = {}

-- catppuccin
-- doombox
-- dracula
-- edgedark
-- edgelight
-- everblush
-- everforest
-- github
-- gruvbox
-- javacafe
-- kanagawa
-- moon
-- nord
-- onebright
-- onedark
-- onedarker
-- onelight
-- rosepine
-- sonokai
-- tokyonight
-- tokyostorm

local theme = 'kanagawa'

-- local theme
-- local time = os.date('*t')
-- if time.hour < 7 or time.hour >= 21 then
-- 	theme = 'tokyonight'
-- elseif time.hour < 8 or time.hour >= 19 then
-- 	theme = 'kanagawa'
-- elseif time.hour < 10 or time.hour >= 17 then
-- 	theme = 'onedark'
-- else
-- 	theme = 'everforest'
-- end
-- if vim.g.forced_theme then
-- 	theme = vim.g.forced_theme
-- end

M.setup = function()
	local base16 = require('themes.base16')

	base16(base16.themes(theme), true) -- first load the base16 theme

	package.loaded['themes.extended' or false] = nil -- unload to force reload
	require('themes.extended') -- then load the highlights
end

M.get = function()
	return require('themes.highlight.' .. theme)
end

return M
