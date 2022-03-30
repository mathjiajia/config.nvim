-- Modified from https://github.com/eddyekofo94/gruvbox-flat.nvim
vim.g.colors_name = 'gruvbox'

local util = require('ui.util')

local c = {}
c = {
	bg_dark = '#232323',
	-- bg = '#32302f',
	-- bg2 = '#282828',
	-- line_cursor = '#45403d',
	-- prompt_border = '#ddc7a1',
	bg_highlight = '#3c3836',
	prompt_border = '#45403d',
	fg = '#d4be98',
	fg_light = '#ddc7a1',
	fg_dark = '#d4be98',
	fg_gutter = '#5a524c',
	dark5 = '#5a524c',
	blue = '#7daea3',
	aqua = '#89b482',
	purple = '#d3869b',
	orange = '#e78a4e',
	yellow = '#d8a657',
	yellow2 = '#b47109',
	bg_yellow = '#a96b2c',
	green = '#a9b665',
	red = '#ea6962',
	red1 = '#c14a4a',
	black = '#1d2021',
	git = {
		delete = '#c14a4a',
		add = '#6f8352',
		change = '#b47109',
		bg_red = '#ae5858',
		ignore = '#5a524c',
	},
	gitSigns = {
		delete = '#ae5858',
		add = '#6f8352',
		change = '#a96b2c',
	},
}

if vim.g.theme_style == 'dark' then
	c.bg = '#282828'
	c.bg2 = '#242424'
	c.line_cursor = '#32302f'
	c.border = '#5a524c'
	c.bg_visual = '#45403d'
	c.comment = '#7c6f64'
else
	c.bg = '#1d2021'
	c.bg2 = '#17191a'
	c.line_cursor = util.lighten(c.bg, 0.97)
	c.border = '#5a524c'
	c.bg_visual = '#3c3836'
	c.comment = '#6a635d'
end

c.diff = {
	add = util.darken(c.git.add, 0.15),
	delete = util.darken(c.git.delete, 0.15),
	change = util.darken(c.git.change, 0.15),
	text = c.fg_gutter,
}

c.gitSigns = {
	add = util.brighten(c.gitSigns.add, 0.2),
	change = util.brighten(c.gitSigns.change, 0.2),
	delete = util.brighten(c.gitSigns.delete, 0.2),
}

c.black = util.darken(c.bg, 0.8, '#000000')
c.border_highlight = c.border

-- Popups and statusline always get a dark background
c.bg_popup = c.bg2
c.bg_statusline = c.bg2

-- Sidebar and Floats are configurable
c.bg_sidebar = c.bg2
c.bg_float = c.bg2

c.bg_search = c.bg_highlight
c.fg_search = c.fg
c.fg_sidebar = c.fg_dark

c.error = c.red1
c.warning = c.yellow
c.info = c.blue
c.hint = c.aqua

------ BASICS ------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'Comment', { fg = c.comment, italic = true })
vim.api.nvim_set_hl(0, 'Conceal', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'Cursor', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = c.line_cursor })
vim.api.nvim_set_hl(0, 'CursorIM', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = c.line_cursor })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.purple })
vim.api.nvim_set_hl(0, 'Directory', { fg = c.blue })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = c.bg })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = c.error })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = c.border_highlight })
vim.api.nvim_set_hl(0, 'FoldColumn', { bg = c.bg, fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'Folded', { fg = c.blue, bg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = c.orange, fg = c.black })
vim.api.nvim_set_hl(0, 'lCursor', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = util.lighten(c.purple, 0.95), bold = true })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = c.fg_dark, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = c.blue })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = c.fg_dark })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', {})
vim.api.nvim_set_hl(0, 'NonText', { fg = c.bg_highlight })
vim.api.nvim_set_hl(0, 'Normal', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = c.fg, bg = c.bg_float })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = c.fg, bg = c.bg })
-- vim.api.nvim_set_hl(0, 'NormalSB', { fg = c.fg_sidebar, bg = c.bg_sidebar })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = c.bg_popup, fg = c.fg })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = util.lighten(c.bg_popup, 0.95) })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = util.darken(c.fg_gutter, 0.8) })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'Question', { fg = c.blue })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = c.bg_visual, bold = true })
vim.api.nvim_set_hl(0, 'Search', { bg = c.bg_search, fg = c.fg_search })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = c.bg, fg = c.fg_gutter })
-- vim.api.nvim_set_hl(0, 'SignColumnSB', { bg = c.bg_sidebar, fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.fg_sidebar, bg = c.bg_statusline })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = c.fg_gutter, bg = c.bg_dark }) -- FIXED
vim.api.nvim_set_hl(0, 'Substitute', { bg = c.red, fg = c.black })
vim.api.nvim_set_hl(0, 'TabLine', { bg = c.bg_statusline, fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = c.bg }) -- FIXED
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = c.black, bg = c.blue })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', { fg = c.bg_highlight })
vim.api.nvim_set_hl(0, 'Visual', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = c.warning })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = c.bg_highlight })

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
-- vim.api.nvim_set_hl(0, 'Boolean', {})
vim.api.nvim_set_hl(0, 'Character', { fg = c.green })
-- vim.api.nvim_set_hl(0, 'Conditional', {})
vim.api.nvim_set_hl(0, 'Constant', { fg = c.orange })
-- vim.api.nvim_set_hl(0, 'Debug', {})
-- vim.api.nvim_set_hl(0, 'Define', {})
-- vim.api.nvim_set_hl(0, 'Delimiter', {})
vim.api.nvim_set_hl(0, 'Error', { fg = c.error })
-- vim.api.nvim_set_hl(0, 'Exception', {})
-- vim.api.nvim_set_hl(0, 'Float', {})
vim.api.nvim_set_hl(0, 'Function', { fg = c.blue })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
-- vim.api.nvim_set_hl(0, 'Include', {})
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.aqua, italic = true })
-- vim.api.nvim_set_hl(0, 'Label', {})
-- vim.api.nvim_set_hl(0, 'Macro', {})
-- vim.api.nvim_set_hl(0, 'Number', {})
vim.api.nvim_set_hl(0, 'Operator', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'PreCondit', {})
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.aqua })
-- vim.api.nvim_set_hl(0, 'Repeat', {})
vim.api.nvim_set_hl(0, 'Special', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'SpecialChar', {})
-- vim.api.nvim_set_hl(0, 'SpecialComment', {})
vim.api.nvim_set_hl(0, 'Statement', { fg = c.purple })
-- vim.api.nvim_set_hl(0, 'StorageClass', {})
vim.api.nvim_set_hl(0, 'String', { fg = c.green })
-- vim.api.nvim_set_hl(0, 'Structure', {})
-- vim.api.nvim_set_hl(0, 'Tag', {})
vim.api.nvim_set_hl(0, 'Title', { fg = c.blue, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { bg = c.yellow, fg = c.bg })
vim.api.nvim_set_hl(0, 'Type', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'Typedef', {})
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = c.bg_sidebar })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { bg = util.darken(c.info, 0.1), fg = c.info })

vim.api.nvim_set_hl(0, 'healthError', { fg = c.error })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = c.green })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = c.warning })

vim.api.nvim_set_hl(0, 'qfLineNr', { fg = c.dark5 })
vim.api.nvim_set_hl(0, 'qfFileName', { fg = c.blue })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = c.error })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = c.warning })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = c.info })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = c.hint })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = util.darken(c.error, 0.1), fg = c.error })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = util.darken(c.warning, 0.1), fg = c.warning })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = util.darken(c.info, 0.1), fg = c.info })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = util.darken(c.hint, 0.1), fg = c.hint })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = c.error })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = c.warning })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = c.info })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = c.hint })

------ GIT ------
-- vim.api.nvim_set_hl(0, 'diffAdded', { fg = c.git.add })
-- vim.api.nvim_set_hl(0, 'diffRemoved', { fg = c.git.delete })
-- vim.api.nvim_set_hl(0, 'diffChanged', { fg = c.git.change })
-- vim.api.nvim_set_hl(0, 'diffOldFile', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'diffNewFile', { fg = c.orange })
-- vim.api.nvim_set_hl(0, 'diffFile', { fg = c.blue })
-- vim.api.nvim_set_hl(0, 'diffLine', { fg = c.fg_gutter })
-- vim.api.nvim_set_hl(0, 'diffIndexLine', { fg = c.purple })

------ NEOVIM LSP ------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = c.bg_visual })

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

------ CMP ------
vim.api.nvim_set_hl(0, 'CmpDocumentation', { fg = c.fg, bg = c.bg_float })
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { fg = c.border_highlight, bg = c.bg_float })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = c.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = c.fg_gutter, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindDefault', { fg = c.fg_dark })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = c.comment })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = c.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = c.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = c.green })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = c.aqua })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = c.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = c.green })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = c.green })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = c.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = c.dark5 })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = c.green })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = c.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = c.purple })

------ GITSIGNS ------
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = c.gitSigns.add })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = c.gitSigns.change })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = c.gitSigns.delete })

------ HOP ------
vim.api.nvim_set_hl(0, 'HopNextKey', { fg = c.red, bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey1', { fg = c.blue, bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey2', { fg = util.darken(c.blue, 0.80) })
vim.api.nvim_set_hl(0, 'HopUnmatched', { fg = c.comment })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = c.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = c.orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = c.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = c.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = c.aqua })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = c.blue })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = c.purple })

------ TELESCOPE ------
-- vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = util.darken(c.fg, 0.75) })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = c.purple })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = c.purple, bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = c.blue })

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
-- vim.api.nvim_set_hl(0, 'TSConditional', {})
vim.api.nvim_set_hl(0, 'TSConstant', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'TSConstBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSConstMacro', {})
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = c.aqua })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = c.bg, bg = c.error })
-- vim.api.nvim_set_hl(0, 'TSEmphasis', {})
-- vim.api.nvim_set_hl(0, 'TSError', {})
-- vim.api.nvim_set_hl(0, 'TSException', {})
vim.api.nvim_set_hl(0, 'TSField', { fg = c.aqua })
-- vim.api.nvim_set_hl(0, 'TSFloat', {})
-- vim.api.nvim_set_hl(0, 'TSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', {})
-- vim.api.nvim_set_hl(0, 'TSFunction', {})
vim.api.nvim_set_hl(0, 'TSInclude', { fg = c.blue })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = c.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = c.purple })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = c.blue })
-- vim.api.nvim_set_hl(0, 'TSLiteral', {})
vim.api.nvim_set_hl(0, 'TSMath', { fg = c.yellow }) -- ADDED
-- vim.api.nvim_set_hl(0, 'TSMethod', {})
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = c.bg, bg = c.info })
-- vim.api.nvim_set_hl(0, 'TSNumber', {})
vim.api.nvim_set_hl(0, 'TSOperator', { fg = util.darken(c.orange, 0.85) })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { fg = c.red })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = util.darken(c.orange, 0.85) })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = c.red })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = util.darken(c.orange, 0.85) })
-- vim.api.nvim_set_hl(0, 'TSRepeat', {})
-- vim.api.nvim_set_hl(0, 'TSStrike', {})
-- vim.api.nvim_set_hl(0, 'TSString', {})
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = c.red })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = c.orange })
-- vim.api.nvim_set_hl(0, 'TSSymbol', {})
vim.api.nvim_set_hl(0, 'TSTag', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'TSTagDelimiter', {})
-- vim.api.nvim_set_hl(0, 'TSText', {})
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'TSTitle', {})
-- vim.api.nvim_set_hl(0, 'TSType', {})
-- vim.api.nvim_set_hl(0, 'TSTypeBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSUnderline', {})
-- vim.api.nvim_set_hl(0, 'TSURI', {})
vim.api.nvim_set_hl(0, 'TSVariable', {})
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = c.aqua })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = c.bg, bg = c.warning })

------ HTML ------
-- vim.api.nvim_set_hl(0, 'htmlTag', { fg = c.purple, bold = true })

------ LUA ------
-- vim.api.nvim_set_hl(0, 'luaTSProperty', { fg = c.red })

------ MARKDOWN ------
-- vim.api.nvim_set_hl(0, 'mkdHeading', { fg = c.orange, style = "bold" })
-- vim.api.nvim_set_hl(0, 'mkdCode', { bg = c.bg2, fg = c.fg })
-- vim.api.nvim_set_hl(0, 'mkdCodeDelimiter', { bg = c.bg2, fg = c.fg })
-- vim.api.nvim_set_hl(0, 'mkdCodeStart', { fg = c.yellow, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdCodeEnd', { fg = c.yellow, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdLink', { fg = c.blue, style = "underline" })

-- vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = c.orange, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownCode', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'markdownH1', { fg = c.red, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownH2', { fg = c.blue, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = c.blue, underline = true })

local dark = c.comment
-- dark
vim.g.terminal_color_0 = dark
vim.g.terminal_color_8 = dark

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

vim.g.terminal_color_5 = c.purple
vim.g.terminal_color_13 = c.purple

vim.g.terminal_color_6 = c.aqua
vim.g.terminal_color_14 = c.aqua

-- if vim.o.background == 'light' then
-- 	for i = 0, 15, 1 do
-- 		vim.g['terminal_color_' .. i] = util.getColor(vim.g['terminal_color_' .. i])
-- 	end
-- end
