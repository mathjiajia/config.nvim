-- Modofied from https://github.com/folke/tokyonight.nvim
vim.g.colors_name = 'tokyonight'

local util = require('ui.util')
local c = {}

c = {
	bg_dark = '#1F2335',
	bg = '#24283B',
	bg_highlight = '#292E42',
	terminal_black = '#414868',
	fg = '#C0CAF5',
	fg_dark = '#A9B1D6',
	fg_gutter = '#3B4261',
	dark3 = '#545C7E',
	comment = '#565F89',
	dark5 = '#737AA2',
	blue0 = '#3D59A1',
	blue = '#7AA2F7',
	cyan = '#7DCFFF',
	blue1 = '#2AC3DE',
	blue2 = '#0DB9D7',
	blue5 = '#89DDFF',
	blue6 = '#B4F9F8',
	blue7 = '#394B70',
	magenta = '#BB9AF7',
	magenta2 = '#FF007C',
	purple = '#9D7CD8',
	orange = '#FF9E64',
	yellow = '#E0AF68',
	green = '#9ECE6A',
	green1 = '#73DACA',
	green2 = '#41A6B5',
	teal = '#1ABC9C',
	red = '#F7768E',
	red1 = '#DB4B4B',
	git = {
		change = '#6183BB',
		add = '#449DAB',
		delete = '#914C54',
		conflict = '#BB7A61',
	},
	gitSigns = {
		add = '#164846',
		change = '#394B70',
		delete = '#823C41',
	},
}

if vim.g.theme_style == 'dark' then
	c.bg = '#1A1B26'
	c.bg_dark = '#16161E'
end

c.diff = {
	add = util.darken(c.green2, 0.15),
	delete = util.darken(c.red1, 0.15),
	change = util.darken(c.blue7, 0.15),
	text = c.blue7,
}

c.gitSigns = {
	add = util.brighten(c.gitSigns.add, 0.2),
	change = util.brighten(c.gitSigns.change, 0.2),
	delete = util.brighten(c.gitSigns.delete, 0.2),
}

c.git.ignore = c.dark3
c.black = util.darken(c.bg, 0.8, '#000000')
c.border_highlight = c.blue0
c.border = c.black

-- Popups and statusline always get a dark background
c.bg_popup = c.bg_dark
c.bg_statusline = c.bg_dark

-- Sidebar and Floats are configurable
c.bg_sidebar = c.bg_dark
c.bg_float = c.bg_dark

c.bg_visual = util.darken(c.blue0, 0.7)
c.bg_search = c.blue0
c.fg_sidebar = c.fg_dark

c.error = c.red1
c.warning = c.yellow
c.info = c.blue2
c.hint = c.teal

if vim.g.theme_style == 'light' then
	c = util.light_colors(c)
end

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
-- vim.api.nvim_set_hl(0, 'NormalSB', { fg = c.fg_sidebar, bg = c.bg_sidebar })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = c.fg, bg = c.bg_popup })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = util.lighten(c.bg_popup, 0.95) })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = util.darken(c.fg_gutter, 0.8) })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'Question', { fg = c.blue })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = c.bg_visual, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = c.fg, bg = c.bg_search })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = c.fg_gutter, bg = c.bg })
-- vim.api.nvim_set_hl(0, 'SignColumnSB', { fg = c.fg_gutter, bg = c.bg_sidebar })
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

-- vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = c.comment })
-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = c.orange })

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
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = c.blue1 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = c.blue1 })
vim.api.nvim_set_hl(0, 'CmpItemKindDefault', { fg = c.fg_dark })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = c.comment })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = c.green1 })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = c.green1 })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = c.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = c.green1 })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = c.green1 })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = c.dark5 })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = c.green1 })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = c.magenta })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = c.magenta })

------ GITSIGNS ------
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = c.gitSigns.add })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = c.gitSigns.change })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = c.gitSigns.delete })

------ HOP ------
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

------ TELESCOPE ------
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
