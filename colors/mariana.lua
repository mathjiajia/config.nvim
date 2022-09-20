-- Modified from https://github.com/kaiuri/nvim-juliana
vim.g.colors_name = 'mariana'

local colors = {
	black = '#000000',
	blue = '#5c99d6',
	blue2 = '#46525c',
	blue3 = '#303841',
	blue5 = '#5fb4b4',
	blue6 = '#a6acb8',
	gray = '#333333',
	green = '#99c794',
	orange = '#f9ae58',
	orange3 = '#fac761',
	pink = '#cc8ec6',
	red = '#ec5f66',
	red2 = '#f97b58',
	white = '#ffffff',
	white3 = '#d5dee6',
}

colors.bg_extra = '#272e35'

local background = colors.blue3
local foreground = colors.white3
local selection = colors.blue2

local danger = colors.red
local hint = colors.orange3
local info = colors.blue5
local warn = colors.orange
local debug = colors.red2
local trace = colors.pink

--- Modes
vim.api.nvim_set_hl(0, 'Normal', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'Visual', { bg = selection })

--- UI
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = colors.bg_extra })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#7999B9', bg = background })

vim.api.nvim_set_hl(0, 'Pmenu', { bg = colors.bg_extra })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = colors.bg_extra, fg = colors.blue2 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = colors.blue2, fg = colors.white3, bold = true })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#58657E' })

vim.api.nvim_set_hl(0, 'NonText', { fg = colors.blue2 })

vim.api.nvim_set_hl(0, 'ColorColumn', { fg = '#CBD3E2', bg = '#2B333B' })

vim.api.nvim_set_hl(0, 'Conceal', { fg = colors.blue6 })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#38424c' })
vim.api.nvim_set_hl(0, 'CursorColumn', { link = 'CursorLine' })

vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'LineNr' })

vim.api.nvim_set_hl(0, 'DiffAdd', { sp = colors.green, underline = true })
vim.api.nvim_set_hl(0, 'DiffChange', { sp = colors.red, underline = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'DiffText', { italic = true })

vim.api.nvim_set_hl(0, 'Directory', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Error', { fg = colors.red2 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.pink })

-- Folds
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'FoldColumn', { link = 'Comment' })

vim.api.nvim_set_hl(0, 'LineNr', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'LineNrBelow', { link = 'LineNrAbove' })

vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#DEE1E8' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#DEE1E8', bold = true })
vim.api.nvim_set_hl(0, 'Question', { link = 'MoreMsg' })

vim.api.nvim_set_hl(0, 'Search', { fg = colors.black, bg = colors.orange })
vim.api.nvim_set_hl(0, 'IncSearch', { link = 'Search' })

vim.api.nvim_set_hl(0, 'SignColumn', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'SpellBad', { sp = colors.red, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = colors.orange, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = colors.blue5, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { sp = colors.pink, undercurl = true })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#CBD3E2', bg = '#3D4752' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Substitute', { link = 'Visual' })

vim.api.nvim_set_hl(0, 'TabLine', { fg = colors.blue6, bg = colors.blue2 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = colors.blue6, bg = colors.blue2 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = foreground, bg = background })

vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#4E5A65' })
vim.api.nvim_set_hl(0, 'WarningMsg', { link = 'ErrorMsg' })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'Winseparator', { fg = '#4E5A65' })

-- Diagnostics
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = danger })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = hint })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = info })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = warn })
vim.api.nvim_set_hl(0, 'DiagnosticSignError', { fg = danger, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticSignHint', { fg = hint, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticSignInfo', { fg = info, bold = true })
vim.api.nvim_set_hl(0, 'DiagnosticSignWarn', { fg = warn, bold = true })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = danger, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { sp = hint, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { sp = info, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { sp = warn, undercurl = true })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = colors.bg_extra, fg = danger })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = colors.bg_extra, fg = warn })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = colors.bg_extra, fg = info })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = colors.bg_extra, fg = hint })

-- VimSyntax hl-groups
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'MatchParen', { bold = true })

vim.api.nvim_set_hl(0, 'Character', { fg = colors.green })

vim.api.nvim_set_hl(0, 'String', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.white })
vim.api.nvim_set_hl(0, 'Define', { fg = colors.pink, italic = true })

vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'Identifier', { fg = foreground })
vim.api.nvim_set_hl(0, 'Include', { fg = '#7999B9' })

vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.pink, italic = true })

vim.api.nvim_set_hl(0, 'Label', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Macro', { fg = '#8DADE7' })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.red2 })
vim.api.nvim_set_hl(0, 'PreCondit', { link = 'Include' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#A7B4CD' })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.pink })

vim.api.nvim_set_hl(0, 'Special', { fg = colors.blue5 })

vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colors.blue5 })

vim.api.nvim_set_hl(0, 'SpecialComment', { fg = '#788797', underline = true })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Structure', { link = 'StorageClass' })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Tag', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Title', { fg = foreground, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.blue, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Typedef', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Underlined', { underdotted = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#5C75A3' })

-- TS-hl globals

vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = colors.white })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = colors.blue5 })

vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { link = 'Define' })
vim.api.nvim_set_hl(0, 'TSString', { link = 'String' })

vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'TSStringEscape', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })

vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
vim.api.nvim_set_hl(0, 'TSCharacterSpecial', { link = 'SpecialChar' })

vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })

vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSFunctionCall', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = colors.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = colors.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = colors.blue })

vim.api.nvim_set_hl(0, 'TSParameter', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'TSParameterReference', { link = 'TSParameter' })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = '#5cb3d6' })
vim.api.nvim_set_hl(0, 'TSMethodCall', { link = 'TSMethod' })
vim.api.nvim_set_hl(0, 'TSField', { fg = '#95B2D6' })
vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSEnum', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSError', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSInterface', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = colors.pink, italic = true })

vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = colors.red2 })

vim.api.nvim_set_hl(0, 'TSKeywordReturn', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'TSNote', { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = '#95B2D6' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = '#7EBFC4' })
vim.api.nvim_set_hl(0, 'TSTag', { link = 'Tag' })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'TSText', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = foreground, underdotted = true })

vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })

vim.api.nvim_set_hl(0, 'TSTodo', { link = 'Todo' })
vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = colors.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSTypeQualifier', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSURI', { fg = colors.blue5, underdotted = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = colors.pink })

--- HTML
vim.api.nvim_set_hl(0, 'htmlTagName', { link = 'Tag' })

-- git.vim
vim.api.nvim_set_hl(0, 'gitCommitSelectedFile', { italic = true })
vim.api.nvim_set_hl(0, 'gitCommitSummary', { bold = true })
vim.api.nvim_set_hl(0, 'gitCommitTrailerToken', { fg = colors.pink, italic = true })

--- health.vim
vim.api.nvim_set_hl(0, 'healthHelp', { fg = colors.orange3 })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = colors.green })

--- commentTS
vim.api.nvim_set_hl(0, 'commentTSConstant', { fg = '#8C99A6' })

-- lua
vim.api.nvim_set_hl(0, 'luaTSConstructor', { link = 'TSPunctBracket' })
vim.api.nvim_set_hl(0, 'luaTable', { link = 'TSPunctBracket' })

-- markdown
-- vim.api.nvim_set_hl(0, 'markdownTSPunctSpecial', { fg = colors.red2, bold = true })

--- quickfix.vim
vim.api.nvim_set_hl(0, 'qfFileName', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'qfLineNr', { bold = true })

--- CSS
vim.api.nvim_set_hl(0, 'cssTSType', { fg = colors.blue5 })

--- toml
vim.api.nvim_set_hl(0, 'tomlTSProperty', { link = 'TSLabel' })

-- yaml
vim.api.nvim_set_hl(0, 'yamlTSField', { link = 'TSLabel' })

-- json
vim.api.nvim_set_hl(0, 'jsonTSLabel', { link = 'TSLabel' })

-- help
vim.api.nvim_set_hl(0, 'helpHyperTextEntry', { link = 'TSURI' })
vim.api.nvim_set_hl(0, 'helpSectionDelim', { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'helpHyperTextJump', { fg = colors.blue, underdotted = true })
vim.api.nvim_set_hl(0, 'helpHeader', { link = 'Title' })
vim.api.nvim_set_hl(0, 'helpExample', { fg = colors.green })
vim.api.nvim_set_hl(0, 'helpURL', { fg = colors.blue, underline = true })
vim.api.nvim_set_hl(0, 'helpCommand', { bg = '#38424c' })

--- Python
-- vim.api.nvim_set_hl(0, 'pythonTSField', { fg = '#95B2D6' })

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
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = '#7b838a' })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = '#909dab', underdotted = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { link = 'NonText' })

--- nvim-cmp
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = colors.white3 })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = colors.red2 })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = colors.red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = colors.white })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = '#7999B9' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = '#7999B9' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = '#7999B9' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = colors.red2 })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = colors.white3 })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = colors.white })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = colors.white3 })

--- gitsigns.nvim
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = danger, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = hint, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = info, bold = true })

--- packer.nvim
vim.api.nvim_set_hl(0, 'packerHash', { fg = colors.red })
vim.api.nvim_set_hl(0, 'packerString', { bg = '#38424c' })

--- vim.lsp
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = colors.bg_extra, })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

--- Telescope
vim.api.nvim_set_hl(0, 'TelescopeBorder', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'TelescopeTitle', { fg = foreground, bold = true })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = foreground })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { bg = background })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = foreground })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { link = 'Visual' })

--- dressing.nvim
-- vim.api.nvim_set_hl(0, 'FloatTitle', { link = 'Comment' })

-- symbols-outline.nvim
-- vim.api.nvim_set_hl(0, 'FocusedSymbol', { link = 'Visual' })

-- Trouble
-- vim.api.nvim_set_hl(0, 'TroubleIndent', { bg = p.blue3 })
-- vim.api.nvim_set_hl(0, 'TroubleLocation', { bold = true })

--- NvimTree
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg = colors.blue6, bg = '#22262A' })
vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = foreground, bg = '#22262A', bold = true })
vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = foreground, bg = '#22262A', bold = true })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { underdotted = true })
vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = colors.green, bold = true })
vim.api.nvim_set_hl(0, 'NvimTreeFileDeleted', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'NvimTreeFileNew', { fg = colors.white })
vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = foreground })
vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = danger })
vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { fg = info })
vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { fg = warn })
vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = danger })
vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = hint })

--- nvim-notify
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = danger })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = warn })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = info })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = debug })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = trace })
vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = danger })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = warn })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = info })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = debug })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = trace })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = danger, bold = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = warn, bold = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = info, bold = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = debug, bold = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = trace, bold = true })

vim.api.nvim_set_hl(0, 'NotifyERRORBody', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'NotifyWARNBody', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'NotifyINFOBody', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBody', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'NotifyTRACEBody', { link = 'TSText' })

-- Temporary native lsp semantic highlighting
-- https://github.com/theHamsta/nvim-semantic-tokens
-- vim.api.nvim_set_hl(0, 'LspNamespace', { link = 'TSNamespace' })
-- vim.api.nvim_set_hl(0, 'LspType', { link = 'TSType' })
-- vim.api.nvim_set_hl(0, 'LspClass', { link = 'TSType' })
-- vim.api.nvim_set_hl(0, 'LspEnum', { link = 'TSType' })
-- vim.api.nvim_set_hl(0, 'LspInterface', { link = 'TSType' })
-- vim.api.nvim_set_hl(0, 'LspStruct', { link = 'TSType' })
-- vim.api.nvim_set_hl(0, 'LspTypeParameter', { link = 'TSType' })
-- vim.api.nvim_set_hl(0, 'LspParameter', { link = 'TSParameter' })
-- vim.api.nvim_set_hl(0, 'LspVariable', { link = 'TSVariable' })
-- vim.api.nvim_set_hl(0, 'LspProperty', { link = 'TSProperty' })
-- vim.api.nvim_set_hl(0, 'LspEnumMember', { link = 'TSField' })
-- -- LspEvent = {},
-- vim.api.nvim_set_hl(0, 'LspFunction', { link = 'TSFunction' })
-- vim.api.nvim_set_hl(0, 'LspMethod', { link = 'TSMethod' })
-- vim.api.nvim_set_hl(0, 'LspMacro', { link = 'Macro' })
-- vim.api.nvim_set_hl(0, 'LspKeyword', { link = 'TSKeyword' })
-- -- LspModifier = {},
-- vim.api.nvim_set_hl(0, 'LspComment', { link = 'TSComment' })
-- vim.api.nvim_set_hl(0, 'LspString', { link = 'TSString' })
-- vim.api.nvim_set_hl(0, 'LspNumber', { link = 'TSNumber' })
-- vim.api.nvim_set_hl(0, 'LspRegexp', { link = 'TSStringRegex' })
-- vim.api.nvim_set_hl(0, 'LspOperator', { link = 'TSOperator' })
-- -- vim.api.nvim_set_hl(0, 'LspDeclaration', { link = 'TSType' })
-- -- LspDefinition = {},
-- vim.api.nvim_set_hl(0, 'LspReadonly', { link = 'TSKeyword' })
-- vim.api.nvim_set_hl(0, 'LspStatic', { link = 'TSConstant' })
-- vim.api.nvim_set_hl(0, 'LspDeprecated', { strikethrough = true })
-- -- LspAbstract = {},
-- vim.api.nvim_set_hl(0, 'LspAsync', { fg = colors.red })
-- -- LspModification = {},
-- -- LspDocumentation = {},
-- vim.api.nvim_set_hl(0, 'LspDefaultLibrary', { italic = true })
