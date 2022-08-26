-- Modified from https://github.com/kaiuri/nvim-juliana
vim.g.colors_name = 'mariana'

local colors = {
	black   = '#333333',
	bg0     = '#272E35',
	bg1     = '#303841',
	gray0   = '#46525C',
	gray1   = '#A6ACB8',
	fg      = '#d5dee6',
	white1  = '#FFFFFF',
	blue    = '#5C99D6',
	cyan    = '#5FB4B4',
	green   = '#99C794',
	yellow  = '#FAC761',
	orange1 = '#F9AE58',
	orange2 = '#F97B58',
	red     = '#EC5F66',
	pink    = '#CC8EC6',
}

local background = colors.bg1
local foreground = colors.fg
local selection = colors.gray0
-- local find_highlight_foreground = c.gray0
-- local find_highlight = c.yellow

local error = colors.red
local hint = colors.yellow
local info = colors.cyan
local warn = colors.orange1

--- Modes
vim.api.nvim_set_hl(0, 'Normal', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'Visual', { bg = selection })

--- UI
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = colors.bg0 })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#7999B9', bg = background })

vim.api.nvim_set_hl(0, 'Pmenu', { bg = colors.bg0 })
vim.api.nvim_set_hl(0, 'PmenuSbar', { fg = colors.gray0 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = colors.bg1, bold = true })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#58657E' })

vim.api.nvim_set_hl(0, 'NonText', { fg = colors.gray0 })

vim.api.nvim_set_hl(0, 'ColorColumn', { fg = '#CBD3E2', bg = '#2B333B' })

vim.api.nvim_set_hl(0, 'Conceal', { fg = colors.gray1 })

vim.api.nvim_set_hl(0, 'CursorColumn', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#38424c' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'LineNr' })

vim.api.nvim_set_hl(0, 'DiffAdd', { sp = colors.green, underdotted = true })
vim.api.nvim_set_hl(0, 'DiffChange', { sp = colors.red, underdotted = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = colors.gray1 })
vim.api.nvim_set_hl(0, 'DiffText', { italic = true })

vim.api.nvim_set_hl(0, 'Directory', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Error', { fg = colors.orange2 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.pink })

-- Folds
vim.api.nvim_set_hl(0, 'Folded', { sp = colors.gray1 })
vim.api.nvim_set_hl(0, 'FoldColumn', { bg = background })

vim.api.nvim_set_hl(0, 'LineNr', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.gray1 })
vim.api.nvim_set_hl(0, 'LineNrBelow', { link = 'LineNrAbove' })

vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#DEE1E8' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#DEE1E8', bold = true })
vim.api.nvim_set_hl(0, 'Question', { link = 'MoreMsg' })

vim.api.nvim_set_hl(0, 'Search', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'IncSearch', { link = 'Search' })

vim.api.nvim_set_hl(0, 'SignColumn', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'SpellBad', { sp = colors.red, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = colors.orange1, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = colors.teal, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { sp = colors.pink, undercurl = true })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#CBD3E2', bg = '#3D4752' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Substitute', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'TabLine', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#4E5A65' })
vim.api.nvim_set_hl(0, 'WarningMsg', { link = 'ErrorMsg' })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'Winseparator', { fg = '#4E5A65' })

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = error, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = hint, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = info, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = warn, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = error, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { sp = hint, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { sp = info, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { sp = warn, undercurl = true })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = colors.bg0, fg = colors.error })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = colors.bg0, fg = colors.hint })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = colors.bg0, fg = colors.info })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = colors.bg0, fg = colors.warn })

-- VimSyntax hl-groups
vim.api.nvim_set_hl(0, 'MatchParen', { link = 'Visual', bold = true })
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.red, italic = true })

vim.api.nvim_set_hl(0, 'Character', { fg = colors.green })

vim.api.nvim_set_hl(0, 'String', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.gray1 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Constant', { colors.orange1 })
vim.api.nvim_set_hl(0, 'Define', { fg = colors.pink, italic = true })

vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.gray1 })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'Identifier', { fg = foreground })
vim.api.nvim_set_hl(0, 'Include', { fg = '#7999B9' })

vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.pink, italic = true })

vim.api.nvim_set_hl(0, 'Label', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Macro', { fg = '#8DADE7' })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.orange1 })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.orange2 })
vim.api.nvim_set_hl(0, 'PreCondit', { link = 'Include' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#A7B4CD' })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.pink })

vim.api.nvim_set_hl(0, 'Special', { fg = colors.teal })

vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colors.cyan })

vim.api.nvim_set_hl(0, 'SpecialComment', { fg = '#788797', underline = true })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = colors.teal })
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Structure', { link = 'StorageClass' })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Tag', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Title', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = colors.pink, italic = true })
vim.api.nvim_set_hl(0, 'Typedef', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Underlined', { underdotted = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#5C75A3' })

-- TS-hl globals
vim.api.nvim_set_hl(0, 'TSPunctBracket', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = colors.teal })

vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { link = 'Define' })
vim.api.nvim_set_hl(0, 'TSString', { link = 'String' })

vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'TSStringEscape', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
vim.api.nvim_set_hl(0, 'TSCharacterSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })

vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSFunctionCall', { link = 'TSFunction' })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Macro' })

vim.api.nvim_set_hl(0, 'TSParameter', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'TSParameterReference', { link = 'TSParameter' })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = '5CB3D6' })
vim.api.nvim_set_hl(0, 'TSMethodCall', { link = 'TSMethod' })
vim.api.nvim_set_hl(0, 'TSField', { fg = '#95B2D6' })

vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSEnum', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSError', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSInterface', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSKeyword', { link = 'Keyword' })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = colors.pink, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = colors.orange1 })
vim.api.nvim_set_hl(0, 'TSNote', { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = '#95B2D6' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = '#7EBFC4' })
vim.api.nvim_set_hl(0, 'TSTag', { link = 'Tag' })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'TSText', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = foreground, underdotted = true })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = foreground, bold = true })
vim.api.nvim_set_hl(0, 'TSTodo', { link = 'Todo' })
vim.api.nvim_set_hl(0, 'TSType', { fg = colors.orange1 })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = colors.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSTypeQualifier', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSURI', { fg = colors.cyan, underdotted = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = colors.orange1, bold = true })

--- commentTS
vim.api.nvim_set_hl(0, 'commentTSConstant', { fg = '#8C99A6' })

-- git.vim
vim.api.nvim_set_hl(0, 'gitCommitSelectedFile', { italic = true })
vim.api.nvim_set_hl(0, 'gitCommitSummary', { bold = true })
vim.api.nvim_set_hl(0, 'gitCommitTrailerToken', { fg = colors.pink, italic = true })

--- health.vim
vim.api.nvim_set_hl(0, 'healthHelp', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = colors.green })

-- luaTS
vim.api.nvim_set_hl(0, 'luaTSField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'luaTSConstructor', { link = 'TSPunctBracket' })

-- markdownTS
vim.api.nvim_set_hl(0, 'markdownTSPunctSpecial', { fg = colors.orange2, bold = true })

--- quickfix.vim
vim.api.nvim_set_hl(0, 'qfFileName', { fg = colors.cyan })
vim.api.nvim_set_hl(0, 'qfLineNr', { bold = true })

--- tomlTS
vim.api.nvim_set_hl(0, 'tomlTSProperty', { link = 'TSLabel' })

-- yamlTS
vim.api.nvim_set_hl(0, 'yamlTSField', { link = 'TSLabel' })

-- helpTS
vim.api.nvim_set_hl(0, 'helpTSTitle', { fg = foreground, bold = true })
vim.api.nvim_set_hl(0, 'helpTSTextReference', { link = 'TSURI' })
vim.api.nvim_set_hl(0, 'helpHyperTextEntry', { link = 'TSURI' })

-- Python
vim.api.nvim_set_hl(0, 'pyTSField', { fg = '#95B2D6' })

--- Plugins
-- Rainbow Parentheses
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = '#FEDB95' })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = '#A3FE95' })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = '#95F7FE' })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = '#B195FE' })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = '#FE95CD' })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = '#FEDB95' })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = '#A3FE95' })

--- indent-blankline
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = '#4E5A65' })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = '#4E5A65', underline = true })

--- nvim-cmp
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { link = 'Number' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = colors.red })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link = 'CmpItemKindClass' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindClass' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#8EB8E1' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindValue' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link = 'TSConstant' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link = 'TSInclude' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link = 'TSLabel' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'TSLabel' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSSymbol' })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { link = 'TSVariable' })

--- Nvim-tree
-- vim.api.nvim_set_hl(0, 'NvimTreePopup', { fg = '#CBD3E2', bg = c.bg0 })

--- gitsigns.nvim
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = error, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = hint, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = info, bold = true })

--- vim.lsp
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#38424c' })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

--- Telescope
vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'TelescopeTitle', { fg = foreground, bold = true })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = foreground })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { bg = background })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { link = 'CursorLine' })

-- Trouble
-- vim.api.nvim_set_hl(0, 'TroubleIndent', { bg = colors.bg1 })
-- vim.api.nvim_set_hl(0, 'TroubleLocation', { bold = true })
