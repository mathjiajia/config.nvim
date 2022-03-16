vim.g.colors_name = 'sonokai'

local cp = {
	black = '#181a1c',
	bg0 = '#1E1E2E',
	bg1 = '#2F2D41',
	bg2 = '#333648',
	bg3 = '#363a4e',
	bg4 = '#393e53',
	bg_red = '#ff6188',
	diff_red = '#55393d',
	bg_green = '#a9dc76',
	diff_green = '#394634',
	bg_blue = '#77d5f0',
	diff_blue = '#354157',
	diff_yellow = '#4e432f',
	fg = '#e1e3e4',
	red = '#fb617e',
	orange = '#f89860',
	yellow = '#edc763',
	green = '#9ed06c',
	blue = '#6dcae8',
	purple = '#bb97ee',
	grey = '#7e8294',
	grey_dim = '#5a5e7a',
}

---------- GROUPS ----------

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
vim.api.nvim_set_hl(0, 'lCursor', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.bg1 })

vim.api.nvim_set_hl(0, 'Directory', { fg = cp.green })
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = cp.bg_diff_green })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = cp.bg_diff_blue })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = cp.bg_diff_red })
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.bg0, bg = cp.blue })

-- vim.api.nvim_set_hl(0, 'EndOfBuffer', {})
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})

vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, underline = true })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = cp.black })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.grey, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.bg0, bg = cp.bg_red })
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.bg0, bg = cp.yellow })

vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.grey_dim })
-- vim.api.nvim_set_hl(0, 'LineNrAbove', {})
-- vim.api.nvim_set_hl(0, 'LineNrBelow', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {})
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})

vim.api.nvim_set_hl(0, 'MatchParen', { bg = cp.bg4 })
-- vim.api.nvim_set_hl(0, 'ModeMsg', {})
vim.api.nvim_set_hl(0, 'MsgArea', { fg = cp.fg })
-- vim.api.nvim_set_hl(0,'MsgSeparator', {})
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.bg4 })

vim.api.nvim_set_hl(0, 'Normal', { fg = cp.fg, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = cp.fg, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = cp.fg, bg = cp.bg0 })

vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.fg, bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = cp.bg0, bg = cp.blue })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.grey })

vim.api.nvim_set_hl(0, 'Question', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.blue, bold = true })

vim.api.nvim_set_hl(0, 'Search', { fg = cp.bg0, bg = cp.bg_green })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.bg4 })

vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.aqua })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.purple })

vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.fg, bg = cp.bg3 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.grey, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.fg, bg = cp.bg4 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = cp.grey, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.bg0, bg = cp.bg_red })

vim.api.nvim_set_hl(0, 'Title', { fg = cp.red, bold = true })
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.bg3 })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.bg3, underline = true })

vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.bg4 })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'PmenuSel' })

-- syntax groups
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.grey, italic = true })

vim.api.nvim_set_hl(0, 'Constant', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'String', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Number', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Float', { fg = cp.purple })

vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.green })

vim.api.nvim_set_hl(0, 'Statement', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.red })

vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Include', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Define', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.red })

vim.api.nvim_set_hl(0, 'Type', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.red })

vim.api.nvim_set_hl(0, 'Special', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.grey, italic = true })
-- vim.api.nvim_set_hl(0, 'Debug', {})

-- vim.api.nvim_set_hl(0, 'Underlined', {})
-- vim.api.nvim_set_hl(0, 'Ignore', {})
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.blue, italic = true })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = cp.bg_visual_red, undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg = cp.bg_visual_yellow, undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg = cp.bg_visual_blue, undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg = cp.bg_visual_green, undercurl = true, sp = cp.green })

---------- NVIM LSPCONFIG ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })
-- vim.api.nvim_set_hl(0, 'LspCodeLens', {})
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', {})
-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {})

---------- AERIAL ----------
vim.api.nvim_set_hl(0, 'AerialArrayIcon', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'AerialClassIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialConstantIcon', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { link = 'TSConstructor' })
vim.api.nvim_set_hl(0, 'AerialEnumIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialEventIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialFieldIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialFileIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { link = 'Function' })
vim.api.nvim_set_hl(0, 'AerialInterfaceIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialKeyIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialMethodIcon', { link = 'TSMethod' })
vim.api.nvim_set_hl(0, 'AerialModuleIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialNamespaceIcon', { link = 'TSNamespace' })
-- vim.api.nvim_set_hl(0, 'AerialNullIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialNumberIcon', { link = 'Number' })
vim.api.nvim_set_hl(0, 'AerialObjectIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialOperatorIcon', { link = '' })
vim.api.nvim_set_hl(0, 'AerialPackageIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialPropertyIcon', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'AerialStringIcon', { link = 'String' })
vim.api.nvim_set_hl(0, 'AerialStructIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialTypeParameterIcon', { link = 'TSParameter' })
vim.api.nvim_set_hl(0, 'AerialVariableIcon', { link = 'TSVariableBuiltin' })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.fg, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link = 'TSConstructor' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSParameterReference' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.fg })

---------- NVIM NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = cp.purple })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'NotifyERRORBorder' })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'NotifyWARNBorder' })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'NotifyINFOBorder' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.green, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.purple, italic = true })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.green })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = cp.fg, bg = cp.bg1, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.bg0, bg = cp.red })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.bg0, bg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.bg0, bg = cp.green })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeFrecencyScores', { fg = cp.red })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.yellow })

-- vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.orange })

-- vim.api.nvim_set_hl(0, 'TSString', { link = 'String' })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
-- vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
-- vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
-- vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
-- vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })

-- vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Macro' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = cp.fg })

-- vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' })
-- vim.api.nvim_set_hl(0, 'TSRepeat', { link = 'Repeat' })
-- vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' })
-- vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'TSKeywordOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'TSException', { link = 'Exception' })

-- vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSInclude', { link = 'Include' })

vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.orange, italic = true })

-- vim.api.nvim_set_hl(0, 'TSText', { link = 'TSNone' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.grey, strikethrough = true })

vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.green, italic = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.blue, underline = true })

-- vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.bg0, bg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.bg0, bg = cp.yellow, bold = true })
-- vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' })

vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.red })

-- vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.fg })
