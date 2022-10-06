-- Modified from https://github.com/kaiuri/nvim-juliana
vim.g.colors_name = 'mariana'

local c = {
	gray0   = '#000000',
	gray1   = '#2e363e',
	gray2   = '#2e353e',
	gray3   = '#2f373f',
	gray4   = '#303841',
	gray5   = '#46525c',
	gray6   = '#a6acb8',
	gray7   = '#d8dee9',
	gray8   = '#f7f7f7',
	gray9   = '#ffffff',
	green   = '#99c794',
	blue0   = '#5c99d6',
	blue1   = '#95b2d6',
	cyan    = '#5fb4b4',
	orange1 = '#ee932b',
	orange2 = '#f9ae58',
	pink    = '#cc8ec6',
	red     = '#ec5f66',
	red2    = '#f97b58',
	yellow  = '#fac761',
}

local Foreground = {
	surface = c.gray5,
	muted = c.gray6,
	default = c.gray7,
	emphasis = c.gray8,
}

local Shade = {
	default = c.gray3,
	emphasis = c.gray1,
}
local Background = {
	emphasis = c.gray2,
	default = c.gray4,
	muted = c.gray5,
}
local Debug = c.red2
local Trace = c.pink
local Danger = c.red
local Hint = c.cyan
local Info = c.green
local Warn = c.orange2

vim.api.nvim_set_hl(0, 'Normal', { fg = Foreground.default, bg = Background.default })
vim.api.nvim_set_hl(0, 'Visual', { bg = Background.muted })

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = Background.emphasis })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = Foreground.surface, bg = Background.default })

--- Note: We use links to Pmenu to preserve layout
vim.api.nvim_set_hl(0, 'Pmenu', { bg = Background.emphasis })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = Background.muted, fg = Foreground.emphasis, bold = false })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = Background.emphasis, fg = Background.muted })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = Background.muted })

vim.api.nvim_set_hl(0, 'NonText', { fg = Foreground.surface })

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = Background.default })

vim.api.nvim_set_hl(0, 'Conceal', { fg = Foreground.muted })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = Background.muted })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = Background.muted })
vim.api.nvim_set_hl(0, 'LineNr', { bg = Background.muted, fg = Foreground.emphasis })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = Foreground.muted })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = Foreground.muted })
vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'LineNr' })

vim.api.nvim_set_hl(0, 'DiffAdd', { sp = c.green, underline = true })
vim.api.nvim_set_hl(0, 'DiffChange', { sp = c.red, underline = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = Foreground.muted })
vim.api.nvim_set_hl(0, 'DiffText', { italic = true })
vim.api.nvim_set_hl(0, 'Directory', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = Foreground.surface })
vim.api.nvim_set_hl(0, 'Error', { fg = c.red2, bg = Shade.default })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Exception', { fg = c.pink, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Folded', { fg = c.gray6, bg = Shade.default })
vim.api.nvim_set_hl(0, 'FoldColumn', { link = 'Comment' })

vim.api.nvim_set_hl(0, 'ModeMsg', { fg = Foreground.default })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = Foreground.default, bold = true })
vim.api.nvim_set_hl(0, 'Question', { link = 'MoreMsg' })

vim.api.nvim_set_hl(0, 'Search', { fg = c.gray0, bg = c.orange2 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = c.gray0, bg = c.orange2 })

vim.api.nvim_set_hl(0, 'SignColumn', { fg = Foreground.default, bg = Background.default })
vim.api.nvim_set_hl(0, 'SpellBad', { sp = c.red, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = c.orange2, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = c.cyan, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { sp = c.pink, undercurl = true })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = Foreground.default, bg = c.gray5 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = Foreground.default, bg = c.gray2 })
vim.api.nvim_set_hl(0, 'Substitute', { bg = Background.muted })
vim.api.nvim_set_hl(0, 'TabLine', { fg = Foreground.muted, bg = Background.muted })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = Foreground.muted, bg = Background.muted })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = Foreground.default, bg = Shade.default })

-- vim.api.nvim_set_hl(0, 'VertSplit', { fg = Foreground.surface }) -- @deprecated

vim.api.nvim_set_hl(0, 'WarningMsg', { link = 'ErrorMsg' })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'Pmenu' })

vim.api.nvim_set_hl(0, 'Winseparator', { fg = Foreground.surface })
vim.api.nvim_set_hl(0, 'VertSplit', { link = 'Winseparator' })

vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = c.red })
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = c.red, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = c.red, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = c.red })

vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = c.cyan, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { sp = c.cyan, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = c.cyan })

vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = c.green })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = c.green, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { sp = c.green, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = c.green })

vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = c.orange2, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { sp = c.orange2, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = c.orange2 })

vim.api.nvim_set_hl(0, 'Boolean', { fg = c.red, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'MatchParen', { bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Character', { fg = c.green, bg = Shade.default })
vim.api.nvim_set_hl(0, 'String', { fg = c.green, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Comment', { fg = Foreground.muted, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Conditional', { fg = c.pink, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Constant', { fg = c.gray9, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Define', { fg = c.pink, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = Foreground.muted, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'Number', { fg = c.yellow, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
vim.api.nvim_set_hl(0, 'Function', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Identifier', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Include', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.pink, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Label', { fg = c.pink, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Macro', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Operator', { fg = c.red2, bg = Shade.default })
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Repeat', { fg = c.pink, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Special', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = '#788797', underline = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Statement', { fg = c.pink, bg = Shade.default })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Structure', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Struct', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Typedef', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Tag', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Title', { fg = Foreground.default, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Todo', { fg = c.blue0, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Type', { fg = c.orange2, bg = Shade.default })
vim.api.nvim_set_hl(0, 'Underlined', { underdotted = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = Foreground.surface })

vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = Foreground.emphasis, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter', bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = c.red, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSConstMacro', { link = 'Define' })
vim.api.nvim_set_hl(0, 'TSString', { fg = c.green, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSStringEscape', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = c.green, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSCharacterSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })
vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSFunctionCall', { fg = c.blue0, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = c.blue0, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = c.blue0, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = c.gray7, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = c.gray7, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSMethodCall', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSField', { fg = c.blue1, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSComment', { fg = Foreground.muted, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = c.red, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSEnum', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSError', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = c.pink, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSInterface', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = c.pink, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = c.red2, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { link = 'TSKeyword', bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = c.orange2, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSNote', { fg = c.green, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = c.blue1, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSTag', { link = 'Tag' })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = c.pink, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = c.cyan, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'TSText', { fg = Foreground.default, bg = Shade.default })

vim.api.nvim_set_hl(0, 'TSTextReference', { fg = Foreground.default, underdotted = false })

vim.api.nvim_set_hl(0, 'TSTitle', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSTodo', { link = 'Todo' })
vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = c.blue0, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSTypeQualifier', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSURI', { fg = c.blue1, underdotted = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = c.red, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = c.orange2, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = c.green, italic = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'htmlTagName', { link = 'Tag' })
vim.api.nvim_set_hl(0, 'gitCommitSelectedFile', { italic = true })
vim.api.nvim_set_hl(0, 'gitCommitSummary', { bold = true })
vim.api.nvim_set_hl(0, 'gitCommitTrailerToken', { fg = c.pink, italic = true })
vim.api.nvim_set_hl(0, 'healthHelp', { fg = c.yellow, bg = Shade.default })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = c.green, bg = Shade.default })
vim.api.nvim_set_hl(0, 'luaTable', { link = 'TSPunctBracket' })

vim.api.nvim_set_hl(0, 'markdownRule', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'markdownUrl', { fg = c.blue0, underline = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'markdownLinkDelimiter', { fg = c.cyan, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'markdownH1Delimiter', { fg = c.red2, bg = Shade.emphasis, bold = false })
vim.api.nvim_set_hl(0, 'markdownH2Delimiter', { fg = c.red2, bg = Shade.emphasis, bold = false })
-- vim.api.nvim_set_hl(0, 'markdownH3Delimiter', { fg = c.orange2, bg = Shade.emphasis, bold = false })
-- vim.api.nvim_set_hl(0, 'markdownH4Delimiter', { fg = c.orange2, bg = Shade.emphasis, bold = false })
-- vim.api.nvim_set_hl(0, 'markdownH5Delimiter', { fg = c.orange2, bg = Shade.emphasis, bold = false })
-- vim.api.nvim_set_hl(0, 'markdownH6Delimiter', { fg = c.orange2, bg = Shade.emphasis, bold = false })
vim.api.nvim_set_hl(0, 'markdownCode', { bg = c.gray5 })
vim.api.nvim_set_hl(0, 'markdownCodeDelimiter', { fg = c.blue0, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'markdownListMarker', { fg = c.yellow, bg = Shade.default })

vim.api.nvim_set_hl(0, 'qfFileName', { fg = c.cyan, bg = Shade.default })
vim.api.nvim_set_hl(0, 'qfLineNr', { bold = true })

vim.api.nvim_set_hl(0, 'helpHyperTextEntry', { link = 'TSURI' })
vim.api.nvim_set_hl(0, 'helpSectionDelim', { fg = c.red, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'helpHyperTextJump', { fg = c.blue0, underdotted = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'helpHeader', { link = 'Title' })
vim.api.nvim_set_hl(0, 'helpExample', { fg = c.green, bg = Shade.default })
vim.api.nvim_set_hl(0, 'helpURL', { fg = c.blue0, underline = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'helpCommand', { bg = c.gray5 })

vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = c.gray7, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = c.pink, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = c.green, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = c.red, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = c.cyan, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = c.yellow, bg = Shade.emphasis })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = c.orange1, bg = Shade.emphasis })

vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = c.gray6, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = c.gray6, underdotted = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { link = 'NonText' })

vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = c.gray7 })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = c.red2 })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = c.red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = c.gray9 })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = c.pink })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = c.blue1 })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = c.red2 })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = c.gray7 })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = c.gray9 })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = c.gray7 })

vim.api.nvim_set_hl(0, 'Sneak', { fg = c.gray1, bg = c.orange2 })
vim.api.nvim_set_hl(0, 'SneakLabel', { fg = c.gray1, bg = c.orange2 })

vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = c.red, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = c.yellow, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = c.green, bold = true })

vim.api.nvim_set_hl(0, 'packerHash', { fg = c.red })
vim.api.nvim_set_hl(0, 'packerString', { fg = c.green })
vim.api.nvim_set_hl(0, 'packerStatusSuccess', { fg = c.green })

vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = Background.emphasis })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = Background.emphasis })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = Background.emphasis })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = Foreground.surface })
vim.api.nvim_set_hl(0, 'TelescopeTitle', { fg = Foreground.default, bold = true })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = Foreground.default })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { bg = Background.default })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = Foreground.default })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = Background.muted })

vim.api.nvim_set_hl(0, 'FloatTitle', { fg = Foreground.muted })
vim.api.nvim_set_hl(0, 'FocusedSymbol', { bg = Background.muted })
vim.api.nvim_set_hl(0, 'TroubleIndent', { bg = Background.default })
vim.api.nvim_set_hl(0, 'TroubleLocation', { bold = true })

vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg = Foreground.default, bg = Background.emphasis })
vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = Foreground.default, bg = Background.emphasis })
vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = Foreground.default, bg = Background.emphasis })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { underdotted = true })
vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = Foreground.muted })
vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = c.green, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NvimTreeFileDeleted', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'NvimTreeFileNew', { fg = Background.emphasis, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = Foreground.default, bg = Shade.default })

vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { fg = c.green, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { fg = c.orange2, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = c.red, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = c.cyan, bg = Shade.default })

vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = c.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = c.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = Debug, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = Trace, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = c.red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = c.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = Debug, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = Trace, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = c.red, bold = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = c.orange2, bold = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = c.green, bold = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = Debug, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = Trace, bold = true, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyERRORBody', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyWARNBody', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyINFOBody', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBody', { fg = Foreground.default, bg = Shade.default })
vim.api.nvim_set_hl(0, 'NotifyTRACEBody', { fg = Foreground.default, bg = Shade.default })

vim.api.nvim_set_hl(0, 'DevIconGitAttributes', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'DevIconGitCommit', { fg = c.red })
vim.api.nvim_set_hl(0, 'DevIconGitConfig', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'DevIconGitIgnore', { fg = c.red })
vim.api.nvim_set_hl(0, 'DevIconGitModules', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'DevIconDropbox', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'DevIconToml', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'DevIconYaml', { link = 'DevIconToml' })
vim.api.nvim_set_hl(0, 'DevIconJson', { fg = c.orange2 })
vim.api.nvim_set_hl(0, 'DevIconYml', { link = 'DevIconToml' })
vim.api.nvim_set_hl(0, 'DevIconMd', { fg = c.gray9 })
vim.api.nvim_set_hl(0, 'DevIconGo', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'DevIconTs', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'DevIconTsx', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'DevIconDsStore', { fg = c.gray6 })
vim.api.nvim_set_hl(0, 'DevIconDockerfile', { fg = c.blue0 })
vim.api.nvim_set_hl(0, 'DevIconScheme', { fg = c.gray9 })

vim.api.nvim_set_hl(0, 'LspNamespace', { link = 'TSNamespace' })
vim.api.nvim_set_hl(0, 'LspType', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'LspClass', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'LspEnum', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'LspInterface', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'LspStruct', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'LspTypeParameter', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'LspParameter', { link = 'TSParameter' })
vim.api.nvim_set_hl(0, 'LspVariable', { link = 'TSVariable' })
vim.api.nvim_set_hl(0, 'LspProperty', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'LspEnumMember', { link = 'TSField' })
-- hl.LspEvent   = {}
vim.api.nvim_set_hl(0, 'LspFunction', { link = 'TSFunctionCall' })
vim.api.nvim_set_hl(0, 'LspMethod', { link = 'TSMethod' })
vim.api.nvim_set_hl(0, 'LspMacro', { link = 'Macro' })
vim.api.nvim_set_hl(0, 'LspKeyword', { fg = c.red2 })
-- LspModifier   = {}
vim.api.nvim_set_hl(0, 'LspComment', { link = 'TSComment' })
vim.api.nvim_set_hl(0, 'LspString', { link = 'TSString' })
vim.api.nvim_set_hl(0, 'LspNumber', { link = 'TSNumber' })
vim.api.nvim_set_hl(0, 'LspRegexp', { link = 'TSStringRegex' })
-- LspDeclaration = { link = 'TSType' }
-- LspDefinition  = {}
-- vim.api.nvim_set_hl(0, 'LspOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'LspReadonly', { fg = 'NONE', bg = 'NONE', italic = true })
vim.api.nvim_set_hl(0, 'LspStatic', { fg = 'NONE', bg = 'NONE', italic = true })
vim.api.nvim_set_hl(0, 'LspDeprecated', { strikethrough = true })
-- LspAbstract = {}
-- LspAsync = { bold = true }
-- LspModification  = {}
-- LspDocumentation = {}
vim.api.nvim_set_hl(0, 'LspDefaultLibrary', { italic = true })
