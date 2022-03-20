local M = {}

-- aquarium
-- blossom
-- catppuccin
-- chadracula
-- chadtain
-- classic-dark
-- doom-chad
-- everblush
-- everforest
-- gruvbox
-- gruvchad
-- javacafe
-- jellybeans
-- kanagawa
-- lfgruv
-- monekai
-- monokai
-- mountain
-- night-owl
-- nightlamp
-- nord
-- one-light
-- onebright
-- onedark-deep
-- onedark
-- onejelly
-- onenord
-- palenight
-- paradise
-- penokai
-- solarized
-- sonokai
-- tokyodark
-- tokyonight
-- tomorrow-night
-- uwu
-- wombat

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
