-- Modified from https://github.com/NvChad/nvim-base16.lua
-- Modified from https://github.com/chriskempson/base16-vim

local function apply_base16_theme(theme)
	-- Neovim terminal colours
	vim.g.terminal_color_0 = '#' .. theme.base00
	vim.g.terminal_color_1 = '#' .. theme.base08
	vim.g.terminal_color_2 = '#' .. theme.base0B
	vim.g.terminal_color_3 = '#' .. theme.base0A
	vim.g.terminal_color_4 = '#' .. theme.base0D
	vim.g.terminal_color_5 = '#' .. theme.base0E
	vim.g.terminal_color_6 = '#' .. theme.base0C
	vim.g.terminal_color_7 = '#' .. theme.base05
	vim.g.terminal_color_8 = '#' .. theme.base03
	vim.g.terminal_color_9 = '#' .. theme.base08
	vim.g.terminal_color_10 = '#' .. theme.base0B
	vim.g.terminal_color_11 = '#' .. theme.base0A
	vim.g.terminal_color_12 = '#' .. theme.base0D
	vim.g.terminal_color_13 = '#' .. theme.base0E
	vim.g.terminal_color_14 = '#' .. theme.base0C
	vim.g.terminal_color_15 = '#' .. theme.base07
	-- if vim.o.background == 'light' then
	-- 	vim.g.terminal_color_background = '#' .. theme.base05
	-- 	vim.g.terminal_color_foreground = '#' .. theme.base0B
	-- else
	vim.g.terminal_color_background = '#' .. theme.base00
	vim.g.terminal_color_foreground = '#' .. theme.base0E
	-- end

	-- Vim editor colors
	vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'Conceal', { fg = '#' .. theme.base04 })
	vim.api.nvim_set_hl(0, 'Cursor', { fg = '#' .. theme.base00, bg = '#' .. theme.base05 })
	vim.api.nvim_set_hl(0, 'CursorColumn', { bg = '#' .. theme.base01 })
	-- vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#' .. theme.base04, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'Debug', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'Directory', { fg = '#' .. theme.base0D })
	-- vim.api.nvim_set_hl(0, 'EndOfBuffer', {})
	vim.api.nvim_set_hl(0, 'Error', { fg = '#' .. theme.base00, bg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = '#' .. theme.base08, bg = '#' .. theme.base00 })
	vim.api.nvim_set_hl(0, 'Exception', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'FoldColumn', { fg = '#' .. theme.base0C, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'Folded', { fg = '#' .. theme.base03, bg = '#' .. theme.base01 })
	-- vim.api.nvim_set_hl(0, 'Ignore', {})
	vim.api.nvim_set_hl(0, 'IncSearch', { fg = '#' .. theme.base01, bg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'LineNr', { fg = '#' .. theme.base03, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'Macro', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'MatchParen', { fg = '#' .. theme.base08, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#' .. theme.base0B })
	vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#' .. theme.base0B })
	vim.api.nvim_set_hl(0, 'NonText', { fg = '#' .. theme.base03 })
	vim.api.nvim_set_hl(0, 'Normal', { fg = '#' .. theme.base05, bg = '#' .. theme.base00 })
	-- vim.api.nvim_set_hl(0, 'PMenu', { fg = '#' .. theme.base05, bg = '#' .. theme.base01 })
	-- vim.api.nvim_set_hl(0, 'PMenuSel', { fg = '#' .. theme.base01, bg = '#' .. theme.base05 })
	vim.api.nvim_set_hl(0, 'Question', { fg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'Search', { fg = '#' .. theme.base01, bg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'SignColumn', { fg = '#' .. theme.base03, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'SpecialKey', { link = 'NonText' })
	vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#' .. theme.base00, bg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#' .. theme.base02, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'Substitute', { fg = '#' .. theme.base01, bg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'TabLine', { fg = '#' .. theme.base03, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'TabLineFill', { fg = '#' .. theme.base03, bg = '#' .. theme.base00 })
	vim.api.nvim_set_hl(0, 'TabLineSel', { fg = '#' .. theme.base0B, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'Title', { fg = '#' .. theme.base0E, bold = true })
	-- vim.api.nvim_set_hl(0, 'Underlined', {})
	vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#' .. theme.base02, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'Visual', { bg = '#' .. theme.base02 })
	vim.api.nvim_set_hl(0, 'VisualNOS', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'WarningMsg', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'WildMenu', { fg = '#' .. theme.base08, bg = '#' .. theme.base0A })

	-- Standard syntax highlighting
	vim.api.nvim_set_hl(0, 'Boolean', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'Character', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'Comment', { fg = '#' .. theme.base03 })
	vim.api.nvim_set_hl(0, 'Conditional', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'Constant', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'Define', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#' .. theme.base0F })
	vim.api.nvim_set_hl(0, 'Float', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'Function', { fg = '#' .. theme.base0F })
	vim.api.nvim_set_hl(0, 'Identifier', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'Include', { fg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'Keyword', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'Label', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'Marco', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'Number', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'Operator', { fg = '#' .. theme.base0B, bold = true })
	vim.api.nvim_set_hl(0, 'PreProc', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'Repeat', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'Special', { fg = '#' .. theme.base0C })
	vim.api.nvim_set_hl(0, 'SpecialChar', { fg = '#' .. theme.base0F })
	vim.api.nvim_set_hl(0, 'Statement', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'StorageClass', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'String', { fg = '#' .. theme.base0B })
	vim.api.nvim_set_hl(0, 'Structure', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'Tag', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'Todo', { fg = '#' .. theme.base0A, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'Type', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'Typedef', { fg = '#' .. theme.base0A })

	---------- DIFF ----------
	vim.api.nvim_set_hl(0, 'DiffAdd', { fg = '#' .. theme.base0B, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'DiffChange', { fg = '#' .. theme.base0A, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#' .. theme.base0E, bg = '#' .. theme.base01 })
	vim.api.nvim_set_hl(0, 'DiffText', { fg = '#' .. theme.base0D, bg = '#' .. theme.base01 })

	---------- DIAGNOSTIC ----------
	-- vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#' .. theme.base08 })
	-- vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#' .. theme.base0A })
	-- vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#' .. theme.base0D })
	-- vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#' .. theme.base0C })

	---------- SPELLING ----------
	vim.api.nvim_set_hl(0, 'SpellBad', { bg = '#' .. theme.base01, undercurl = true, sp = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'SpellLocal', { bg = '#' .. theme.base01, undercurl = true, sp = '#' .. theme.base0C })
	vim.api.nvim_set_hl(0, 'SpellCap', { bg = '#' .. theme.base01, undercurl = true, sp = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'SpellRare', { bg = '#' .. theme.base01, undercurl = true, sp = '#' .. theme.base0E })

	--------- CMP ----------
	vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = '#' .. theme.base05 })
	vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = '#' .. theme.base05 })
	vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = '#' .. theme.base05 })

	---------- TREESITTER ----------
	-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
	vim.api.nvim_set_hl(0, 'TSAttribute', { fg = '#' .. theme.base0A })
	-- vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
	vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
	-- vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
	-- vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' })
	-- vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
	vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'TSConstructor', { fg = '#' .. theme.base0B })
	-- vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' })
	vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = '#' .. theme.base0B, italic = true })
	vim.api.nvim_set_hl(0, 'TSError', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'TSException', { fg = '#' .. theme.base08 })
	vim.api.nvim_set_hl(0, 'TSField', { fg = '#' .. theme.base0B })
	-- vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })
	vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = '#' .. theme.base0D })
	-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Marco' })
	-- vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
	-- vim.api.nvim_set_hl(0, 'TSInclude', { link = 'Include' })
	vim.api.nvim_set_hl(0, 'TSKeyword', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = '#' .. theme.base0E, italic = true })
	vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = '#' .. theme.base0E, italic = true })
	vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = '#' .. theme.base0E })
	-- vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' })
	vim.api.nvim_set_hl(0, 'TSLiteral', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'TSMath', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'TSMethod', { fg = '#' .. theme.base0D })
	vim.api.nvim_set_hl(0, 'TSNamespace', { fg = '#' .. theme.base0B })
	-- vim.api.nvim_set_hl(0, 'TSNone', {})
	vim.api.nvim_set_hl(0, 'TSNote', { fg = '#' .. theme.base00, bg = '#' .. theme.base09, bold = true })
	-- vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
	-- vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
	vim.api.nvim_set_hl(0, 'TSParameter', { fg = '#' .. theme.base0C })
	vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = '#' .. theme.base05 })
	-- vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.fg })
	vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = '#' .. theme.base04 })
	vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = '#' .. theme.base0F })
	vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = '#' .. theme.base05 })
	-- vim.api.nvim_set_hl(0, 'TSRepeat', { link = 'Repeat' })
	vim.api.nvim_set_hl(0, 'TSStrike', { fg = '#' .. theme.base00, strikethrough = true })
	-- vim.api.nvim_set_hl(0, 'TSString', { link = 'String' })
	vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = '#' .. theme.base0C })
	vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = '#' .. theme.base0C })
	-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
	vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
	vim.api.nvim_set_hl(0, 'TSSymbol', { fg = '#' .. theme.base0B })
	vim.api.nvim_set_hl(0, 'TSTag', { fg = '#' .. theme.base09, italic = true })
	vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = '#' .. theme.base0E })
	vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = '#' .. theme.base0F })
	-- vim.api.nvim_set_hl(0, 'TSText', { link = 'TSNone' })
	vim.api.nvim_set_hl(0, 'TSTextReference', { fg = '#' .. theme.base0C })
	-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })
	-- vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' })
	vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = '#' .. theme.base09, italic = true })
	vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
	vim.api.nvim_set_hl(0, 'TSURI', { fg = '#' .. theme.base09, underline = true })
	vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = '#' .. theme.base0A })
	vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = '#' .. theme.base09 })
	vim.api.nvim_set_hl(0, 'TSWarning', { fg = '#' .. theme.base00, bg = '#' .. theme.base0A, bold = true })
end

return setmetatable({
	themes = function(name)
		name = 'themes/' .. name .. '-base16'
		local present, theme_array = pcall(require, name)
		if present then
			return theme_array
		else
			error('No such base16 theme: ' .. name)
		end
	end,
	apply_theme = apply_base16_theme,
	theme_from_array = function(array)
		assert(#array == 16, 'base16.theme_from_array: The array length must be 16')
		local result = {}
		for i, value in ipairs(array) do
			assert(#value == 6, "base16.theme_from_array: array values must be in 6 digit hex format, e.g. 'ffffff'")
			local key = ('base%02X'):format(i - 1)
			result[key] = value
		end
		return result
	end,
}, {
	__call = function(_, ...)
		apply_base16_theme(...)
	end,
})
