-- Modified from https://github.com/kaiuri/nvim-juliana
vim.g.colors_name = 'mariana'

local colors = {
	blue2 = '#46525C',
	blue3 = '#303841',
	blue5 = '#5FB4B4',
	blue6 = '#A6ACB8',
	blue_vibrant = '#5C99d6',
	gray = '#333333',
	green = '#99C794',
	orange = '#F9AE58',
	orange3 = '#FAC761',
	red = '#EC5F66',
	red2 = '#F97B58',
	pink = '#C694C1',
	white = '#FFFFFF',
	white3 = '#D8DEE3',
}

local background = colors.blue3
local foreground = colors.white3
local selection = colors.blue2
local find_highlight_foreground = colors.gray
local find_highlight = colors.orange3

--- Modes
vim.api.nvim_set_hl(0, 'Normal', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#272E35' })
vim.api.nvim_set_hl(0, 'Visual', { bg = selection })

--- UI
vim.api.nvim_set_hl(0, 'ColorColumn', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Conceal', { fg = '#5A6B8C' })
vim.api.nvim_set_hl(0, 'CursorColumn', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'CursorLine', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'LineNr' })
vim.api.nvim_set_hl(0, 'DiffAdd', { sp = '#93CF8C', underdotted = true })
vim.api.nvim_set_hl(0, 'DiffChange', { sp = '#EF5D64', underdotted = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#788797' })
vim.api.nvim_set_hl(0, 'DiffText', { italic = true })
vim.api.nvim_set_hl(0, 'Directory', { underdotted = true })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Error', { fg = '#FA7A57' })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = '#EF5D64' })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Folded', { sp = '#647382', underdashed = true })
vim.api.nvim_set_hl(0, 'LineNr', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#A6ACB9' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#A6ACB9' })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#DEE1E8' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#DEE1E8', bold = true })
vim.api.nvim_set_hl(0, 'NonText', { fg = '#5A6B8C' })
vim.api.nvim_set_hl(0, 'Pmenu', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'PmenuSbar', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#272E35', bold = true })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#58657E' })
vim.api.nvim_set_hl(0, 'Question', { link = 'MoreMsg' })

vim.api.nvim_set_hl(0, 'Search', { fg = find_highlight_foreground, bg = find_highlight })
vim.api.nvim_set_hl(0, 'IncSearch', { link = 'Search' })

vim.api.nvim_set_hl(0, 'SignColumn', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'SpellBad', { sp = '#EF5D64', undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = '#FAAE57', undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = '#48CBCB', undercurl = true })
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
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = colors.red })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#D8DEE9' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = colors.blue5 })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = colors.red, underdotted = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { sp = '#D8DEE9', underdotted = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { sp = '#5FB4B4', underdotted = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { sp = '#FAAE57', underdotted = true })

-- VimSyntax hl-groups
vim.api.nvim_set_hl(0, 'MatchParen', { link = 'Visual', bold = true })
vim.api.nvim_set_hl(0, 'Boolean', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'Character', { fg = colors.green })
vim.api.nvim_set_hl(0, 'String', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Define', { link = 'Macro' })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.blue6 })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.blue_vibrant })
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'Include', { fg = '#7999B9' })
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Label', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Macro', { fg = '#8DADE7' })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.red2 })
vim.api.nvim_set_hl(0, 'PreCondit', { link = 'Include' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#A7B4CD' })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Special', { fg = '#5FB4B4' })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = '#5FB485' })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = '#788797', underline = true })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = '#48CBCB' })
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Structure', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Tag', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Title', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.blue_vibrant, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = colors.pink, italic = true })
vim.api.nvim_set_hl(0, 'Typedef', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Underlined', { underdotted = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#5C75A3' })

-- TS-hl globals
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = '#EF5D64', italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = colors.pink, italic = true })
vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = colors.blue_vibrant })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = '#EF5D64', bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSError', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'TSField', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = '#5E99D4', italic = true })
vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = colors.pink, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = colors.pink, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = '#84C2BB' })
vim.api.nvim_set_hl(0, 'TSMethod', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'TSNote', { fg = '#93CF8C', bold = true })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = '#FAAE57' })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = colors.white })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = '#5EBBD4' })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = '#8CC0CF' })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = '#8CC0CF' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = '#7EBFC4' })
vim.api.nvim_set_hl(0, 'TSText', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = '#CBD3E2', underdotted = true })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = '#CBD3E2', bold = true })
vim.api.nvim_set_hl(0, 'TSType', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = '#5E99D4', italic = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = '#5FB4B4', underdotted = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = '#EF5D64', italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = '#FAAE57', bold = true })

--- commentTS
vim.api.nvim_set_hl(0, 'commentTSConstant', { fg = '#8C99A6' })

-- git.vim
vim.api.nvim_set_hl(0, 'gitCommitSelectedFile', { italic = true })
vim.api.nvim_set_hl(0, 'gitCommitSummary', { bold = true })
vim.api.nvim_set_hl(0, 'gitCommitTrailerToken', { fg = colors.pink, italic = true })

--- health.vim
vim.api.nvim_set_hl(0, 'healthHelp', { fg = '#FBC760' })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = '#93CF8C' })

-- htmlTS
vim.api.nvim_set_hl(0, 'htmlTSOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'htmlTSTag', { fg = '#EF5D64' })
vim.api.nvim_set_hl(0, 'htmlTSTagAttribute', { fg = colors.pink })
vim.api.nvim_set_hl(0, 'htmlTSTagDelimiter', { fg = '#5FB4B4' })

-- luaTS
vim.api.nvim_set_hl(0, 'luaTSField', { fg = '#95B2D6' })

-- markdownTS
vim.api.nvim_set_hl(0, 'markdownTSPunctSpecial', { fg = '#EF7A5D', bold = true })

--- quickfix.vim
vim.api.nvim_set_hl(0, 'qfFileName', { fg = '#5FB4B4' })
vim.api.nvim_set_hl(0, 'qfLineNr', { bold = true })

-- RUST
-- vim.api.nvim_set_hl(0, 'rustTSConstBuiltin', { link = 'TSConstant', italic = true })
-- vim.api.nvim_set_hl(0, 'rustTSField', { fg = '#CBD3E2' })
-- vim.api.nvim_set_hl(0, 'rustTSFuncMacro', { fg = '#5E99D4' })
-- vim.api.nvim_set_hl(0, 'rustTSFunction', { fg = '#5FB4B4' })
-- vim.api.nvim_set_hl(0, 'rustTSKeyword', { fg = colors.pink })
-- vim.api.nvim_set_hl(0, 'rustTSOperator', { link = 'TSOperator' })
-- vim.api.nvim_set_hl(0, 'rustTSPunctBracket', { fg = '#CBD3E2' })
-- vim.api.nvim_set_hl(0, 'rustTSPunctDelimiter', { fg = '#A6ACB9' })
-- vim.api.nvim_set_hl(0, 'rustTSType', { fg = '#FAAE57' })
-- vim.api.nvim_set_hl(0, 'rustTSTypeBuiltin', { fg = colors.pink, italic = true })

-- golangTS
-- vim.api.nvim_set_hl(0, 'goTSKeyword', { fg = '#EF5D64' })
-- vim.api.nvim_set_hl(0, 'goTSType', { fg = '#5FB4B4' })
-- vim.api.nvim_set_hl(0, 'goTSFunction', { link = 'TSFunction' })
-- vim.api.nvim_set_hl(0, 'goTSNamespace', { link = 'TSNamespace' })

-- typescriptTS
-- vim.api.nvim_set_hl(0, 'typescriptTSProperty', { fg = '#CBD3E2' })
-- vim.api.nvim_set_hl(0, 'typescriptTSFunction', { fg = '#5FB4B4' })
-- vim.api.nvim_set_hl(0, 'typescriptTSConstructor', { fg = '#FAAE57' })
-- vim.api.nvim_set_hl(0, 'typescriptTSOperator', { link = 'TSOperator' })
-- vim.api.nvim_set_hl(0, 'typescriptTSPunctSpecial', { fg = colors.red })

--- fennelTS
-- vim.api.nvim_set_hl(0, 'fennelTSFuncMacro', { link = 'TSKeywordFunction' })
-- vim.api.nvim_set_hl(0, 'fennelTSField', { link = 'luaTSField' })

--- clojureTS
-- vim.api.nvim_set_hl(0, 'clojureTSKeywordFunction', { fg = colors.red })
-- vim.api.nvim_set_hl(0, 'clojureTSKeyword', { fg = colors.red })
-- vim.api.nvim_set_hl(0, 'clojureTSSymbol', { fg = colors.pink })
-- vim.api.nvim_set_hl(0, 'clojureTSVariableBuiltin', { link = 'TSConstBuiltin' })
-- vim.api.nvim_set_hl(0, 'clojureTSPunctSpecial', { fg = colors.red2 })
-- vim.api.nvim_set_hl(0, 'clojureTSFuncMacro', { fg = colors.red2 })

--- tomlTS
vim.api.nvim_set_hl(0, 'tomlTSProperty', { link = 'TSLabel' })

-- yamlTS
vim.api.nvim_set_hl(0, 'yamlTSField', { link = 'TSLabel' })

-- helpTS
vim.api.nvim_set_hl(0, 'helpTSTitle', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'helpTSTextReference', { link = 'TSURI' })

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
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#EF5D64' })
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
-- vim.api.nvim_set_hl(0, 'NvimTreePopup', { fg = '#CBD3E2', bg = '#272E35' })

--- gitsigns.nvim
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = colors.red, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.orange, bold = true })
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = colors.green, bold = true })

--- vim.lsp
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = '#38424c' })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })
