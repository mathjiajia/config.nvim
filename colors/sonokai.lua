-- Modified from https://github.com/sainnhe/sonokai
vim.g.colors_name = 'sonokai'

local cp = {
	black       = '#181A1C',
	bg0         = '#2B2D3A',
	bg1         = '#2F2D41',
	bg2         = '#333648',
	bg3         = '#363A4E',
	bg4         = '#393E53',
	bg_red      = '#FF6188',
	diff_red    = '#55393D',
	bg_green    = '#A9DC76',
	diff_green  = '#394634',
	bg_blue     = '#77D5F0',
	diff_blue   = '#354157',
	diff_yellow = '#4E432F',
	fg          = '#E1E3E4',
	red         = '#FB617E',
	orange      = '#F89860',
	yellow      = '#EDC763',
	green       = '#9ED06C',
	blue        = '#6DCAE8',
	purple      = '#BB97EE',
	grey        = '#7E8294',
	grey_dim    = '#5A5E7A',
}

---------- BASIC ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.bg1 })
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {})
vim.api.nvim_set_hl(0, 'Directory', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = cp.bg0, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, underline = true })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.grey, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.bg0, bg = cp.bg_red })
-- vim.api.nvim_set_hl(0, 'lCursor', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = cp.bg4 })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = cp.fg, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.bg4 })
vim.api.nvim_set_hl(0, 'Normal', { fg = cp.fg, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = cp.fg, bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = cp.fg, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.fg, bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = cp.bg0, bg = cp.blue })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.grey })
vim.api.nvim_set_hl(0, 'Question', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = cp.bg0, bg = cp.bg_green })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.bg4 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.fg, bg = cp.bg3 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.grey, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.bg0, bg = cp.yellow })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.fg, bg = cp.bg4 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = cp.grey, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.bg0, bg = cp.bg_red })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', {})
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.bg3 })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.bg3, underline = true })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.bg4 })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'PmenuSel' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = cp.black })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = cp.grey })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = cp.bg_diff_green })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = cp.bg_diff_blue })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = cp.bg_diff_red })
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.bg0, bg = cp.blue })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.purple })

------ SYNTAX ------
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Constant', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'Debug', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Define', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Float', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'Ignore', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'Include', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'Method', {})
vim.api.nvim_set_hl(0, 'Number', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.red })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.red })
vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Special', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'Statement', { fg = cp.red })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'String', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'Struct', {})
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Title', { fg = cp.red, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'Type', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', { fg = cp.bg0, bg = cp.green })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = cp.bg0, bg = cp.red })

vim.api.nvim_set_hl(0, 'healthError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = cp.green })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = cp.yellow })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = cp.diff_red, undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg = cp.diff_yellow, undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg = cp.diff_blue, undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg = cp.diff_green, undercurl = true, sp = cp.green })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = cp.green })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = cp.bg2 })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { fg = cp.green })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = cp.bg0, bg = cp.bg_green })

---------- AERIAL ----------
vim.api.nvim_set_hl(0, 'AerialLine', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'AerialGuide', { link = 'LineNr' })
vim.api.nvim_set_hl(0, 'AerialFileIcon', { fg = cp.green })
vim.api.nvim_set_hl(0, 'AerialModuleIcon', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'AerialNamespaceIcon', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'AerialPackageIcon', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'AerialClassIcon', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'AerialMethodIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'AerialPropertyIcon', { fg = cp.red })
vim.api.nvim_set_hl(0, 'AerialFieldIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'AerialEnumIcon', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'AerialInterfaceIcon', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { fg = cp.green })
vim.api.nvim_set_hl(0, 'AerialVariableIcon', { fg = cp.red })
vim.api.nvim_set_hl(0, 'AerialConstantIcon', { fg = cp.red })
vim.api.nvim_set_hl(0, 'AerialStringIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialNumberIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialArrayIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialObjectIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialKeyIcon', { fg = cp.red })
vim.api.nvim_set_hl(0, 'AerialNullIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialStructIcon', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'AerialEventIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialOperatorIcon', { fg = cp.cyan })
vim.api.nvim_set_hl(0, 'AerialTypeParameterIcon', { fg = cp.yellow })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.fg, strikethrough = true }) -- FIXED
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.fg })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.orange })

---------- GITSIGNS ----------
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = cp.green })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = cp.red })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = cp.green })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = cp.red })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = cp.green })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = cp.red })
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = cp.grey1 })

---------- INDENT BLANKLINES ----------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = cp.grey })

---------- NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = cp.purple })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = cp.purple })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.purple })

---------- NVIMTREE ----------
vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'NvimTreeMarkdownFile', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NvimTreeGitMerge', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = cp.red })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.green })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = cp.diff_green })

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSComment', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'TSConditional', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = cp.bg0, bg = cp.red, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
-- vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' })
vim.api.nvim_set_hl(0, 'TSException', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.green, italic = true })
vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.bg0, bg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TSString', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSText', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })
vim.api.nvim_set_hl(0, 'TSType', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.blue, underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.orange, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.bg0, bg = cp.yellow, bold = true })

---------- TERMINAL COLORS ----------
vim.g.terminal_color_0  = cp.black
vim.g.terminal_color_1  = cp.red
vim.g.terminal_color_2  = cp.green
vim.g.terminal_color_3  = cp.yellow
vim.g.terminal_color_4  = cp.blue
vim.g.terminal_color_5  = cp.purple
vim.g.terminal_color_6  = cp.orange
vim.g.terminal_color_7  = cp.fg
vim.g.terminal_color_8  = cp.grey
vim.g.terminal_color_9  = cp.red
vim.g.terminal_color_10 = cp.green
vim.g.terminal_color_11 = cp.yellow
vim.g.terminal_color_12 = cp.blue
vim.g.terminal_color_13 = cp.purple
vim.g.terminal_color_14 = cp.orange
vim.g.terminal_color_15 = cp.fg
