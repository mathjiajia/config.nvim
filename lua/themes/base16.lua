-- Modified from https://github.com/NvChad/nvim-base16.lua
-- Modified from https://github.com/chriskempson/base16-vim

local function apply_base16_theme(theme)
	-- Neovim terminal colours
	vim.g.terminal_color_0 = theme.base00
	vim.g.terminal_color_1 = theme.base08
	vim.g.terminal_color_2 = theme.base0B
	vim.g.terminal_color_3 = theme.base0A
	vim.g.terminal_color_4 = theme.base0D
	vim.g.terminal_color_5 = theme.base0E
	vim.g.terminal_color_6 = theme.base0C
	vim.g.terminal_color_7 = theme.base05
	vim.g.terminal_color_8 = theme.base03
	vim.g.terminal_color_9 = theme.base08
	vim.g.terminal_color_10 = theme.base0B
	vim.g.terminal_color_11 = theme.base0A
	vim.g.terminal_color_12 = theme.base0D
	vim.g.terminal_color_13 = theme.base0E
	vim.g.terminal_color_14 = theme.base0C
	vim.g.terminal_color_15 = theme.base07
	-- if vim.o.background == 'light' then
	-- 	vim.g.terminal_color_background = theme.base05
	-- 	vim.g.terminal_color_foreground = theme.base0B
	-- else
	vim.g.terminal_color_background = theme.base00
	vim.g.terminal_color_foreground = theme.base0E
	-- end

	-- Vim editor colors
	vim.api.nvim_set_hl(0, 'Normal', { fg = theme.base05, bg = theme.base00 })

	vim.api.nvim_set_hl(0, 'ColorColumn', { bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'Conceal', { fg = theme.base04 })
	vim.api.nvim_set_hl(0, 'Cursor', { fg = theme.base00, bg = theme.base05 })
	vim.api.nvim_set_hl(0, 'CursorColumn', { bg = theme.base01 })
	-- vim.api.nvim_set_hl(0, 'CursorLine', {})
	vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = theme.base07 })
	vim.api.nvim_set_hl(0, 'Debug', { fg = theme.base08 })
	vim.api.nvim_set_hl(0, 'Directory', { fg = theme.base0D })
	-- vim.api.nvim_set_hl(0, 'EndOfBuffer', {})
	vim.api.nvim_set_hl(0, 'Error', { fg = theme.base00, bg = theme.base08 })
	vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = theme.base08, bg = theme.base00 })
	vim.api.nvim_set_hl(0, 'Exception', { fg = theme.base08 })
	vim.api.nvim_set_hl(0, 'FoldColumn', { fg = theme.base0C, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'Folded', { fg = theme.base03, bg = theme.base01 })
	-- vim.api.nvim_set_hl(0, 'Ignore', {})
	vim.api.nvim_set_hl(0, 'IncSearch', { fg = theme.base01, bg = theme.base09 })
	-- vim.api.nvim_set_hl(0, 'LineNr', {})
	vim.api.nvim_set_hl(0, 'Macro', { fg = theme.base08 })
	vim.api.nvim_set_hl(0, 'MatchParen', { fg = theme.base08, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'ModeMsg', { fg = theme.base0B })
	vim.api.nvim_set_hl(0, 'MoreMsg', { fg = theme.base0B })
	vim.api.nvim_set_hl(0, 'NonText', { fg = theme.base03 })
	vim.api.nvim_set_hl(0, 'Question', { fg = theme.base0D })
	vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'Search', { fg = theme.base01, bg = theme.base0A })
	vim.api.nvim_set_hl(0, 'SignColumn', { fg = theme.base03, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'SpecialKey', { link = 'NonText' })
	vim.api.nvim_set_hl(0, 'StatusLine', { fg = theme.base00, bg = theme.base0D })
	-- vim.api.nvim_set_hl(0, 'StatusLineNC', {})
	vim.api.nvim_set_hl(0, 'Substitute', { fg = theme.base01, bg = theme.base0A })
	vim.api.nvim_set_hl(0, 'TabLine', { fg = theme.base03, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'TabLineFill', { fg = theme.base03, bg = theme.base00 })
	vim.api.nvim_set_hl(0, 'TabLineSel', { fg = theme.base05, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'Title', { fg = theme.base0D, bold = true })
	-- vim.api.nvim_set_hl(0, 'Underlined', {})
	-- vim.api.nvim_set_hl(0, 'VertSplit', {})
	vim.api.nvim_set_hl(0, 'Visual', { bg = theme.base02 })
	vim.api.nvim_set_hl(0, 'VisualNOS', { fg = theme.base08 })
	vim.api.nvim_set_hl(0, 'WarningMsg', { fg = theme.base08 })
	vim.api.nvim_set_hl(0, 'WildMenu', { fg = theme.base08, bg = theme.base0A })

	-- Standard syntax highlighting
	vim.api.nvim_set_hl(0, 'Boolean', { fg = theme.base0A, italic = true })
	vim.api.nvim_set_hl(0, 'Character', { fg = theme.base08 })
	-- vim.api.nvim_set_hl(0, 'Comment', {})
	vim.api.nvim_set_hl(0, 'Conditional', { fg = theme.base0E, bold = true })
	vim.api.nvim_set_hl(0, 'Constant', { fg = theme.base09 })
	vim.api.nvim_set_hl(0, 'Define', { fg = theme.base0E })
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = theme.base0B })
	vim.api.nvim_set_hl(0, 'Float', { fg = theme.base0A })
	vim.api.nvim_set_hl(0, 'Function', { fg = theme.base0C })
	vim.api.nvim_set_hl(0, 'Identifier', { fg = theme.base08 })
	vim.api.nvim_set_hl(0, 'Include', { fg = theme.base0E })
	vim.api.nvim_set_hl(0, 'Keyword', { fg = theme.base0E })
	vim.api.nvim_set_hl(0, 'Label', { fg = theme.base0A })
	vim.api.nvim_set_hl(0, 'Marco', { fg = theme.base0E })
	vim.api.nvim_set_hl(0, 'Number', { fg = theme.base0A, bold = true })
	vim.api.nvim_set_hl(0, 'Operator', { fg = theme.base0B, bold = true })
	vim.api.nvim_set_hl(0, 'PreProc', { fg = theme.base0A })
	vim.api.nvim_set_hl(0, 'Repeat', { fg = theme.base0A })
	vim.api.nvim_set_hl(0, 'Special', { fg = theme.base0E })
	vim.api.nvim_set_hl(0, 'SpecialChar', { fg = theme.base0F })
	vim.api.nvim_set_hl(0, 'Statement', { fg = theme.base08 })
	vim.api.nvim_set_hl(0, 'StorageClass', { fg = theme.base0A })
	vim.api.nvim_set_hl(0, 'String', { fg = theme.base0B })
	vim.api.nvim_set_hl(0, 'Structure', { fg = theme.base0E })
	vim.api.nvim_set_hl(0, 'Tag', { fg = theme.base0A })
	vim.api.nvim_set_hl(0, 'Todo', { fg = theme.base0A, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'Type', { fg = theme.base09 })
	vim.api.nvim_set_hl(0, 'Typedef', { fg = theme.base0A })

	---------- DIFF ----------
	vim.api.nvim_set_hl(0, 'DiffAdd', { fg = theme.base0B, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'DiffChange', { fg = theme.base0A, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'DiffDelete', { fg = theme.base0E, bg = theme.base01 })
	vim.api.nvim_set_hl(0, 'DiffText', { fg = theme.base0D, bg = theme.base01 })

	---------- SPELLING ----------
	vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = theme.base08 })
	vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = theme.base0C })
	vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = theme.base0D })
	vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = theme.base0E })
end

return setmetatable({
	themes = function(name)
		name = 'themes/base/' .. name .. '-base16'
		local present, theme_array = pcall(require, name)
		if present then
			return theme_array
		else
			error('No such base16 theme: ' .. name)
		end
	end,
	apply_theme = apply_base16_theme,
	-- theme_from_array = function(array)
	-- 	assert(#array == 16, 'base16.theme_from_array: The array length must be 16')
	-- 	local result = {}
	-- 	for i, value in ipairs(array) do
	-- 		assert(#value == 6, "base16.theme_from_array: array values must be in 6 digit hex format, e.g. 'ffffff'")
	-- 		local key = ('base%02X'):format(i - 1)
	-- 		result[key] = value
	-- 	end
	-- 	return result
	-- end,
}, {
	__call = function(_, ...)
		apply_base16_theme(...)
	end,
})
