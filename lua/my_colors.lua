local M = {}

-- javacafe
-- onedark
-- one-light
local theme = 'one-light'

M.init = function()
	local base16 = require('base16')

	base16(base16.themes(theme), true) -- first load the base16 theme

	package.loaded['highlights' or false] = nil -- unload to force reload
	require('highlights') -- then load the highlights
end

M.get = function()
	return require('hl_themes.' .. theme)
end

return M
