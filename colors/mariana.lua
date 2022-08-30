-- Modified from https://github.com/kaiuri/nvim-juliana
vim.g.colors_name = 'mariana'

local p = {
	blue2 = '#46525c',
	blue3 = '#303841',
	blue5 = '#5fb4b4',
	blue6 = '#a6acb8',
	blue_vibrant = '#5c99d6',
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

p.bg_extra = '#272e35'

local background = p.blue3
local foreground = p.white3
local selection = p.blue2

local error = p.red
local hint = p.orange3
local info = p.blue5
local warn = p.orange


--- Modes
vim.api.nvim_set_hl(0, 'Normal', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'Visual', { bg = selection })

--- UI
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = p.bg_extra })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = '#7999B9', bg = background })

vim.api.nvim_set_hl(0, 'Pmenu', { bg = p.bg_extra })
vim.api.nvim_set_hl(0, 'PmenuSbar', { fg = p.blue2 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = p.blue3, bold = true })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#58657E' })

vim.api.nvim_set_hl(0, 'NonText', { fg = p.blue2 })

vim.api.nvim_set_hl(0, 'ColorColumn', { fg = '#CBD3E2', bg = '#2B333B' })

vim.api.nvim_set_hl(0, 'Conceal', { fg = p.blue6 })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#38424c' })
vim.api.nvim_set_hl(0, 'CursorColumn', { link = 'CursorLine' })

vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'LineNr' })

vim.api.nvim_set_hl(0, 'DiffAdd', { sp = p.green, underdotted = true })
vim.api.nvim_set_hl(0, 'DiffChange', { sp = p.red, underdotted = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = p.blue6 })
vim.api.nvim_set_hl(0, 'DiffText', { italic = true })

vim.api.nvim_set_hl(0, 'Directory', { fg = p.blue5 })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Error', { fg = p.red2 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = p.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = p.pink })

-- Folds
vim.api.nvim_set_hl(0, 'Folded', { fg = p.blue6 })
vim.api.nvim_set_hl(0, 'FoldColumn', { bg = background })

vim.api.nvim_set_hl(0, 'LineNr', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = p.blue6 })
vim.api.nvim_set_hl(0, 'LineNrBelow', { link = 'LineNrAbove' })

vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#DEE1E8' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#DEE1E8', bold = true })
vim.api.nvim_set_hl(0, 'Question', { link = 'MoreMsg' })

vim.api.nvim_set_hl(0, 'Search', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'IncSearch', { link = 'Search' })

vim.api.nvim_set_hl(0, 'SignColumn', { fg = foreground, bg = background })
vim.api.nvim_set_hl(0, 'SpellBad', { sp = p.red, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = p.orange, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = p.blue5, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { sp = p.pink, undercurl = true })
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

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { bg = p.bg_extra, fg = error })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { bg = p.bg_extra, fg = warn })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { bg = p.bg_extra, fg = info })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { bg = p.bg_extra, fg = hint })

-- VimSyntax hl-groups

vim.api.nvim_set_hl(0, 'Boolean', { fg = p.red, italic = true })
vim.api.nvim_set_hl(0, 'MatchParen', { bold = true })

vim.api.nvim_set_hl(0, 'Character', { fg = p.green })

vim.api.nvim_set_hl(0, 'String', { fg = p.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = p.blue6 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = p.pink })
vim.api.nvim_set_hl(0, 'Constant', { fg = p.orange })
vim.api.nvim_set_hl(0, 'Define', { fg = p.pink, italic = true })

vim.api.nvim_set_hl(0, 'Delimiter', { fg = p.blue6 })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
vim.api.nvim_set_hl(0, 'Function', { fg = p.blue5 })
vim.api.nvim_set_hl(0, 'Identifier', { fg = foreground })
vim.api.nvim_set_hl(0, 'Include', { fg = '#7999B9' })

vim.api.nvim_set_hl(0, 'Keyword', { fg = p.pink, italic = true })

vim.api.nvim_set_hl(0, 'Label', { fg = p.pink })
vim.api.nvim_set_hl(0, 'Macro', { fg = '#8DADE7' })
vim.api.nvim_set_hl(0, 'Number', { fg = p.orange })
vim.api.nvim_set_hl(0, 'Operator', { fg = p.red2 })
vim.api.nvim_set_hl(0, 'PreCondit', { link = 'Include' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#A7B4CD' })
vim.api.nvim_set_hl(0, 'Repeat', { fg = p.pink })

vim.api.nvim_set_hl(0, 'Special', { fg = p.blue5 })

vim.api.nvim_set_hl(0, 'SpecialChar', { fg = p.blue5 })

vim.api.nvim_set_hl(0, 'SpecialComment', { fg = '#788797', underline = true })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = p.blue5 })
vim.api.nvim_set_hl(0, 'Statement', { fg = p.pink })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = p.red })
vim.api.nvim_set_hl(0, 'Structure', { link = 'StorageClass' })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Tag', { fg = p.red })
vim.api.nvim_set_hl(0, 'Title', { fg = foreground, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = p.blue_vibrant, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = p.orange })
vim.api.nvim_set_hl(0, 'Typedef', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Underlined', { underdotted = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#5C75A3' })

-- TS-hl globals

vim.api.nvim_set_hl(0, 'TSPunctBracket', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = p.blue5 })

vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = p.red, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { link = 'Define' })
vim.api.nvim_set_hl(0, 'TSString', { link = 'String' })

vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = p.blue5 })
vim.api.nvim_set_hl(0, 'TSStringEscape', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })

vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
vim.api.nvim_set_hl(0, 'TSCharacterSpecial', { link = 'SpecialChar' })

vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })

vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSFunctionCall', { link = 'TSFunction' })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = p.blue_vibrant })
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = p.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Macro' })

vim.api.nvim_set_hl(0, 'TSParameter', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'TSParameterReference', { link = 'TSParameter' })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = '#5cb3d6' })
vim.api.nvim_set_hl(0, 'TSMethodCall', { link = 'TSMethod' })
vim.api.nvim_set_hl(0, 'TSField', { fg = '#95B2D6' })

---- kaiuri: Continue from here
--references:
--  https://github.com/nvim-treesitter/nvim-treesitter/blob/master/lua/nvim-treesitter/highlight.lua
--  https://github.com/neovim/neovim/blob/master/runtime/lua/vim/treesitter/highlighter.lua
--  https://github.com/theHamsta/nvim-semantic-tokens/blob/master/lua/nvim-semantic-tokens/presets/default.lua

vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = p.red, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSEnum', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSError', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = p.pink })
vim.api.nvim_set_hl(0, 'TSInterface', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TSKeyword', { link = 'Keyword' })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = p.pink, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = p.blue5 })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = p.orange })
vim.api.nvim_set_hl(0, 'TSNote', { fg = p.green, bold = true })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = '#95B2D6' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = '#7EBFC4' })
vim.api.nvim_set_hl(0, 'TSTag', { link = 'Tag' })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = p.pink })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = p.blue5 })
vim.api.nvim_set_hl(0, 'TSText', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = foreground, underdotted = true })

vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })

vim.api.nvim_set_hl(0, 'TSTodo', { link = 'Todo' })
vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = p.blue_vibrant, italic = true })
vim.api.nvim_set_hl(0, 'TSTypeQualifier', { fg = p.red })
vim.api.nvim_set_hl(0, 'TSURI', { fg = p.blue5, underdotted = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = foreground })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = p.red, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = p.orange, bold = true })

--- HTML
vim.api.nvim_set_hl(0, 'htmlTagName', { link = 'Tag' })
--- commentTS
vim.api.nvim_set_hl(0, 'commentTSConstant', { fg = '#8C99A6' })

-- git.vim

vim.api.nvim_set_hl(0, 'gitCommitSelectedFile', { italic = true })
vim.api.nvim_set_hl(0, 'gitCommitSummary', { bold = true })
vim.api.nvim_set_hl(0, 'gitCommitTrailerToken', { fg = p.pink, italic = true })

--- health.vim
vim.api.nvim_set_hl(0, 'healthHelp', { fg = p.orange3 })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = p.green })

-- luaTS
vim.api.nvim_set_hl(0, 'luaTSConstructor', { link = 'TSPunctBracket' })
vim.api.nvim_set_hl(0, 'luaTable', { link = 'TSPunctBracket' })

-- markdownTS
vim.api.nvim_set_hl(0, 'markdownTSPunctSpecial', { fg = p.red2, bold = true })

--- quickfix.vim
vim.api.nvim_set_hl(0, 'qfFileName', { fg = p.blue5 })
vim.api.nvim_set_hl(0, 'qfLineNr', { bold = true })

--- CSS
vim.api.nvim_set_hl(0, 'cssTSType', { fg = p.blue5 })

--- tomlTS
vim.api.nvim_set_hl(0, 'tomlTSProperty', { link = 'TSLabel' })

-- yamlTS
vim.api.nvim_set_hl(0, 'yamlTSField', { link = 'TSLabel' })

-- jsonTS
vim.api.nvim_set_hl(0, 'jsonTSLabel', { link = 'TSLabel' })

-- helpTS
vim.api.nvim_set_hl(0, 'helpTSTitle', { fg = foreground, bold = true })
vim.api.nvim_set_hl(0, 'helpTSTextReference', { link = 'TSURI' })
vim.api.nvim_set_hl(0, 'helpHyperTextEntry', { link = 'TSURI' })

--- Python
vim.api.nvim_set_hl(0, 'pythonTSField', { fg = '#95B2D6' })

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
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = p.red })
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
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = foreground })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { link = 'Visual' })

--- dressing.nvim
-- vim.api.nvim_set_hl(0, 'FloatTitle', { link = 'Comment' })

---  symbols-outline.nvim
-- vim.api.nvim_set_hl(0, 'FocusedSymbol', { link = 'Visual' })

-- Trouble
-- vim.api.nvim_set_hl(0, 'TroubleIndent', { bg = p.blue3 })
-- vim.api.nvim_set_hl(0, 'TroubleLocation', { bold = true })

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
-- vim.api.nvim_set_hl(0, 'LspStatic', { fg = p.orange })
-- vim.api.nvim_set_hl(0, 'LspDeprecated', { strikethrough = true })
-- -- LspAbstract = {},
-- vim.api.nvim_set_hl(0, 'LspAsync', { fg = p.red })
-- -- LspModification = {},
-- -- LspDocumentation = {},
-- vim.api.nvim_set_hl(0, 'LspDefaultLibrary', { fg = p.blue_vibrant })
