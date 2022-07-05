-- Modified from https://github.com/kaiuri/nvim-mariana
vim.g.colors_name = 'mariana'

------ BASICS ------
vim.api.nvim_set_hl(0, 'ColorColumn', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Conceal', { fg = '#5A6B8C' })
vim.api.nvim_set_hl(0, 'CursorColumn', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'CursorLine', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { link = 'LineNr' })
vim.api.nvim_set_hl(0, 'Directory', { underdotted = true })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Error', { fg = '#FA7A57' })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = '#EF5D64' })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Folded', { sp = '#647382', underdashed = true })
vim.api.nvim_set_hl(0, 'IncSearch', { link = 'Search' })
vim.api.nvim_set_hl(0, 'LineNr', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#A6ACB9' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#A6ACB9' })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = '#3D4752' })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = '#DEE1E8' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = '#DEE1E8', bold = true })
vim.api.nvim_set_hl(0, 'NonText', { fg = '#5A6B8C' })
vim.api.nvim_set_hl(0, 'Normal', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = '#272E35' })
vim.api.nvim_set_hl(0, 'Pmenu', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'PmenuSbar', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#272E35', bold = true })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = '#58657E' })
vim.api.nvim_set_hl(0, 'Question', { link = 'MoreMsg' })
vim.api.nvim_set_hl(0, 'Search', { fg = '#FFFFFF', bg = '#3D4752', bold = true })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = '#CBD3E2', bg = '#3D4752' })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'TabLine', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = '#4E5A65' })
vim.api.nvim_set_hl(0, 'Visual', { bg = '#3D4752' })
vim.api.nvim_set_hl(0, 'WarningMsg', { link = 'ErrorMsg' })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#5C75A3' })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'Winseparator', { fg = '#4E5A65' })

------ SYNTAX ------
vim.api.nvim_set_hl(0, 'Boolean', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'Character', { fg = '#93CF8C' })
vim.api.nvim_set_hl(0, 'Comment', { fg = '#788797', italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Constant', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Define', { link = 'Macro' })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#5E99D4' })
vim.api.nvim_set_hl(0, 'Exception', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
vim.api.nvim_set_hl(0, 'Function', { fg = '#5E99D4' })
vim.api.nvim_set_hl(0, 'Identifier', { fg = '#CBD3E2', bg = '#2B333B' })
vim.api.nvim_set_hl(0, 'Include', { fg = '#7999B9' })
vim.api.nvim_set_hl(0, 'Keyword', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Label', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Macro', { fg = '#8DADE7' })
vim.api.nvim_set_hl(0, 'Number', { fg = '#FAAE57' })
vim.api.nvim_set_hl(0, 'Operator', { fg = '#FA7A57' })
vim.api.nvim_set_hl(0, 'PreCondit', { link = 'Include' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = '#A7B4CD' })
vim.api.nvim_set_hl(0, 'Repeat', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Special', { fg = '#5FB4B4' })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = '#5FB485' })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = '#788797', underline = true })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = '#48CBCB' })
vim.api.nvim_set_hl(0, 'Statement', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = '#EF5D64' })
vim.api.nvim_set_hl(0, 'String', { link = 'Character' })
vim.api.nvim_set_hl(0, 'Structure', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Substitute', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'Tag', { fg = '#EF5D64' })
vim.api.nvim_set_hl(0, 'Title', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'Todo', { fg = '#5E99D4', bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = '#C695C6', italic = true })
vim.api.nvim_set_hl(0, 'Typedef', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'Underlined', { underdotted = true })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { sp = '#93CF8C', underdotted = true })
vim.api.nvim_set_hl(0, 'DiffChange', { sp = '#EF5D64', underdotted = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = '#788797' })
vim.api.nvim_set_hl(0, 'DiffText', { italic = true })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { sp = '#EF5D64', undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = '#FAAE57', undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = '#48CBCB', undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { sp = '#C695C6', undercurl = true })

------ GIT ------
vim.api.nvim_set_hl(0, 'gitCommitSelectedFile', { italic = true })
vim.api.nvim_set_hl(0, 'gitCommitSummary', { bold = true })
vim.api.nvim_set_hl(0, 'gitCommitTrailerToken', { fg = '#C695C6', italic = true })

------ MISC ------
vim.api.nvim_set_hl(0, 'healthHelp', { fg = '#FBC760' })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = '#93CF8C' })

vim.api.nvim_set_hl(0, 'qfFileName', { fg = '#5FB4B4' })
vim.api.nvim_set_hl(0, 'qfLineNr', { bold = true })

-- vim.api.nvim_set_hl(0, 'Sneak', { link = 'Search' })
-- vim.api.nvim_set_hl(0, 'SneakLabel', { link = 'Search' })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = '#EF695D' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#FAAE57' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = '#5FB4B4' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#FBC760' })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { sp = '#EF5D64', underdotted = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { sp = '#D8DEE9', underdotted = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { sp = '#5FB4B4', underdotted = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { sp = '#FAAE57', underdotted = true })

------ CMP ------
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { strikethrough = true })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = '#EF5D64' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link = 'TSConstant' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link = 'CmpItemKindClass' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link = 'TSLabel' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindClass' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = '#8EB8E1' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link = 'TSInclude' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'TSLabel' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSSymbol' })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link = 'Structure' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindValue' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { link = 'Number' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { link = 'TSVariable' })

------ RAINBOW ------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = '#FEDB95' })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = '#A3FE95' })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = '#95F7FE' })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = '#B195FE' })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = '#FE95CD' })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = '#FEDB95' })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = '#A3FE95' })

------ TREESITTER ------
vim.api.nvim_set_hl(0, 'TSConstant', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = '#EF5D64', italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = '#C695C6', italic = true })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = '#EF5D64', bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSError', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'TSField', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = '#5E99D4', italic = true })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = '#5E99D4' })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = '#C695C6', italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = '#C695C6', italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = '#84C2BB' })
vim.api.nvim_set_hl(0, 'TSMethod', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSNamespace', { link = 'TSVariable' })
vim.api.nvim_set_hl(0, 'TSNote', { fg = '#93CF8C', bold = true })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = '#FAAE57' })
vim.api.nvim_set_hl(0, 'TSProperty', { link = 'TSVariable' })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = '#5EBBD4' })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = '#8CC0CF' })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = '#8CC0CF' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = '#7EBFC4' })
vim.api.nvim_set_hl(0, 'TSText', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = '#CBD3E2', underdotted = true })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = '#CBD3E2', bold = true })
vim.api.nvim_set_hl(0, 'TSType', { fg = '#C695C6', italic = true })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = '#5E99D4', italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = '#5FB4B4', underdotted = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = '#EF5D64', italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = '#FAAE57', bold = true })

------ COMMENT ------
vim.api.nvim_set_hl(0, 'commentTSConstant', { fg = '#8C99A6' })

------ FENNEL ------
-- vim.api.nvim_set_hl(0, 'fennelTSFuncMacro', { link = 'TSKeywordFunction' })
-- vim.api.nvim_set_hl(0, 'fennelTSField', { link = 'luaTSField' })

------ GOLANG ------
-- vim.api.nvim_set_hl(0, 'goTSKeyword', { fg = '#EF5D64' })
-- vim.api.nvim_set_hl(0, 'goTSType', { fg = '#5FB4B4' })
-- vim.api.nvim_set_hl(0, 'goTSFunction', { link = 'TSFunction' })
-- vim.api.nvim_set_hl(0, 'goTSNamespace', { fg = '#95B2D6' })

------ HELP ------
vim.api.nvim_set_hl(0, 'helpTSTitle', { fg = '#CBD3E2' })
vim.api.nvim_set_hl(0, 'helpTSTextReference', { link = 'TSURI' })

------ HTML ------
vim.api.nvim_set_hl(0, 'htmlTSOperator', { fg = '#A6ACB9' })
vim.api.nvim_set_hl(0, 'htmlTSTag', { fg = '#EF5D64' })
vim.api.nvim_set_hl(0, 'htmlTSTagAttribute', { fg = '#C695C6' })
vim.api.nvim_set_hl(0, 'htmlTSTagDelimiter', { fg = '#5FB4B4' })

------ LUA ------
vim.api.nvim_set_hl(0, 'luaTSField', { fg = '#95B2D6' })

---- MARKDOWN
vim.api.nvim_set_hl(0, 'markdownTSPunctSpecial', { fg = '#EF7A5D', bold = true })

------ RUST ------
-- vim.api.nvim_set_hl(0, 'rustTSConstant', { fg = '#5E99D4' })
-- vim.api.nvim_set_hl(0, 'rustTSConstBuiltin', { fg = '#5E99D4', italic = true })
-- vim.api.nvim_set_hl(0, 'rustTSField', { fg = '#CBD3E2' })
-- vim.api.nvim_set_hl(0, 'rustTSFuncMacro', { fg = '#5E99D4' })
-- vim.api.nvim_set_hl(0, 'rustTSFunction', { fg = '#5FB4B4' })
-- vim.api.nvim_set_hl(0, 'rustTSKeyword', { fg = '#C992C9' })
-- vim.api.nvim_set_hl(0, 'rustTSOperator', { fg = '#FA7A57' })
-- vim.api.nvim_set_hl(0, 'rustTSPunctBracket', { fg = '#CBD3E2' })
-- vim.api.nvim_set_hl(0, 'rustTSPunctDelimiter', { fg = '#A6ACB9' })
-- vim.api.nvim_set_hl(0, 'rustTSType', { fg = '#FAAE57' })
-- vim.api.nvim_set_hl(0, 'rustTSTypeBuiltin', { fg = '#C695C6', italic = true })

------- TOML ------
vim.api.nvim_set_hl(0, 'tomlTSProperty', { link = 'TSLabel' })

------ YAML ------
vim.api.nvim_set_hl(0, 'yamlTSField', { link = 'TSLabel' })

-- typescript
-- vim.api.nvim_set_hl(0, 'typescriptTSKeyword', { fg = '#EF5D64' })
-- vim.api.nvim_set_hl(0, 'typescriptTSType', { fg = '#5FB4B4' })
