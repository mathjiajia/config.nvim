-- Modified from Sublime Text Mariana Theme
vim.g.colors_name = 'mariana'

local cp = {
	highlight_bg = '#4E5A65',

	black = '#000000',
	blue = '#6699CC',
	blue_vibrant = '#5C99D6',
	blue2 = '#4E5A65',
	blue3 = '#343D46',
	blue4 = '#64738A',
	blue5 = '#5FB4B4',
	blue6 = '#A6ACB9',
	green = '#99C794',
	grey = '#333333',
	grey2 = '#393939',
	grey3 = '#8aa5cf',
	orange = '#F9AE58',
	orange2 = '#EE932B',
	orange3 = '#FAC761',
	pink = '#C695C6',
	red = '#EC5F66',
	red2 = '#F97B58',
	white = '#FFFFFF',
	white2 = '#F7F7F7',
	white3 = '#D8DEE9',

	pmenu_bg = '#3B424B',
	select = '#62686F',
	status = '#1E2227',
	statusnc = '#181C21',
	linenr = '#848B95',
	cursorlinenr = '#BFC5D0',
}

---------- BASIC ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.red })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.blue6 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = cp.bg, bg = cp.fg })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.highlight_bg })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.blue2 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.cursorlinenr })
vim.api.nvim_set_hl(0, 'Directory', { fg = cp.blue5 })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = cp.highlight_bg })
vim.api.nvim_set_hl(0, 'FloatShadow', { fg = cp.black, bg = cp.white3, blend = 80 })
vim.api.nvim_set_hl(0, 'FloatShadowThrough', { fg = cp.black, bg = cp.white3, blend = 100 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.blue5, bg = cp.highlight_bg })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.blue5, bg = cp.blue2 })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = cp.highlight_bg })
vim.api.nvim_set_hl(0, 'lCursor', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.linenr })
-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = cp.linenr })
-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = cp.linenr })
vim.api.nvim_set_hl(0, 'MatchParen', { underline = true, sp = cp.orange })
vim.api.nvim_set_hl(0, 'ModeMsg', { bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'MsgArea', {})
vim.api.nvim_set_hl(0, 'MsgSeparator', { bg = cp.highlight_bg, bold = true })
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'Normal', { fg = cp.white3, bg = cp.blue3 })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = cp.highlight_bg })
vim.api.nvim_set_hl(0, 'NormalNC', {})
vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.white3, bg = cp.pmenu_bg })
vim.api.nvim_set_hl(0, 'PmenuSbar', { fg = cp.white3, bg = cp.blue4 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = cp.select })
vim.api.nvim_set_hl(0, 'PmenuThumb', { fg = cp.blue6, bg = cp.white3 })
vim.api.nvim_set_hl(0, 'Question', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'QuickFixLine', { fg = cp.blue3, bg = cp.green })
vim.api.nvim_set_hl(0, 'Search', { fg = cp.blue3, bg = cp.green })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.blue5 })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.blue5 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.bg, bg = cp.status })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = cp.statusnc })
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.blue3, bg = cp.green })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.white3, bg = cp.blue6 })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = cp.bg })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.bg, bg = cp.blue4 })
vim.api.nvim_set_hl(0, 'TermCursor', { reverse = true })
vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', { bg = cp.highlight_bg })
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.highlight_bg })
-- vim.api.nvim_set_hl(0, 'VisualNC', {})
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.red2 })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = cp.blue3, bg = cp.orange3 })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = cp.highlight_bg })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = cp.green })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = cp.red })
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.blue5 })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.blue5 })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.pink })

vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.blue6 })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Constant', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Debug', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'Define', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.grey3 })
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Float', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.blue5 })
vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.blue5 })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
vim.api.nvim_set_hl(0, 'Include', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Number', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.red2 })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Special', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'Statement', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'String', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'Title', { fg = cp.pink, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.red2 })
vim.api.nvim_set_hl(0, 'Type', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Underlined', { fg = cp.blue, underline = true, sp = cp.blue })

------ MISC ------
vim.api.nvim_set_hl(0, 'healthError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = cp.green })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = cp.orange })

-- vim.api.nvim_set_hl(0, 'RedrawDebugClear', { bg = cp.orange3 })
-- vim.api.nvim_set_hl(0, 'RedrawDebugComposed', { bg = cp.green })
-- vim.api.nvim_set_hl(0, 'RedrawDebugNormal', { reverse = true })
-- vim.api.nvim_set_hl(0, 'RedrawDebugRecompose', { bg = cp.red })

vim.api.nvim_set_hl(0, 'qfLineNr', { fg = cp.white, bg = cp.highlight })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = cp.green })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = cp.orange })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = cp.error })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = cp.green })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = cp.orange })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.highlight })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = cp.highlight })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = cp.highlight })

------ Treesitter --
vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.white3 })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.white3 })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.red })

------ Diagnostic ------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = cp.orange3 })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = cp.blue6 })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.grey2, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.pink, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.pink, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemKindDefault', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'CmpItemMenuDefault', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.func })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.blue2 })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.keyword })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.method })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.variable })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = cp.highlight_bg })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', {})

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.green })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.blue5 })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.orange2 })

vim.g.terminal_color_0 = cp.black
vim.g.terminal_color_1 = cp.red
vim.g.terminal_color_2 = cp.green
vim.g.terminal_color_3 = cp.orange
vim.g.terminal_color_4 = cp.blue
vim.g.terminal_color_5 = cp.pink
vim.g.terminal_color_6 = cp.blue5
vim.g.terminal_color_7 = cp.white
vim.g.terminal_color_8 = cp.grey
vim.g.terminal_color_9 = cp.red
vim.g.terminal_color_10 = cp.green
vim.g.terminal_color_11 = cp.orange
vim.g.terminal_color_12 = cp.blue
vim.g.terminal_color_13 = cp.pink
vim.g.terminal_color_14 = cp.blue5
vim.g.terminal_color_15 = cp.white
