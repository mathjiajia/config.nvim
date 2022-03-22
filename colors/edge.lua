vim.g.colors_name = 'edge'

local cp = {}

if vim.g.theme_style == 'dark' then
	cp = {
		black = '#202023',
		bg0 = '#2b2d37',
		bg1 = '#333644',
		bg2 = '#363a49',
		bg3 = '#3a3e4e',
		bg4 = '#404455',
		bg_grey = '#7e869b',
		bg_red = '#ec7279',
		diff_red = '#55393d',
		bg_green = '#a0c980',
		diff_green = '#394634',
		bg_blue = '#6cb6eb',
		diff_blue = '#354157',
		bg_purple = '#d38aea',
		diff_yellow = '#4e432f',
		fg = '#c5cdd9',
		red = '#ec7279',
		yellow = '#deb974',
		green = '#a0c980',
		cyan = '#5dbbc1',
		blue = '#6cb6eb',
		purple = '#d38aea',
		grey = '#7e8294',
		grey_dim = '#5b5e71',

		teledark = '#252731',
		teleblack = '#31333d',
	}
else
	cp = {
		black = '#dde2e7',
		bg0 = '#fafafa',
		bg1 = '#eef1f4',
		bg2 = '#e8ebf0',
		bg3 = '#e8ebf0',
		bg4 = '#dde2e7',
		bg_grey = '#bcc5cf',
		bg_red = '#e17373',
		diff_red = '#f6e4e4',
		bg_green = '#76af6f',
		diff_green = '#e5eee4',
		bg_blue = '#6996e0',
		diff_blue = '#e3eaf6',
		bg_purple = '#bf75d6',
		diff_yellow = '#f0ece2',
		fg = '#4b505b',
		red = '#d05858',
		yellow = '#be7e05',
		green = '#608e32',
		cyan = '#3a8b84',
		blue = '#5079be',
		purple = '#b05ccc',
		grey = '#8790a0',
		grey_dim = '#bac3cb',

		teledark = '#ffffff',
		teleblack = '#f4f4f4',
	}
end

---------- BASICS ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.teleblack })
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.grey })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {})
vim.api.nvim_set_hl(0, 'Directory', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = cp.bg0, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, underline = true })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.grey_dim })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.grey, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.bg0, bg = cp.bg_blue })
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
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.bg_grey })
vim.api.nvim_set_hl(0, 'Question', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = cp.bg0, bg = cp.bg_green })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.bg4 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.fg, bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.grey, bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.bg0, bg = cp.yellow })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.fg, bg = cp.bg4 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = cp.grey, bg = cp.bg0 }) -- FIXED
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.bg0, bg = cp.bg_purple })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', {})
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.bg3 })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.bg3, underline = true })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.bg4 })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'PmenuSel' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = cp.black })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', {})

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = cp.diff_green })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = cp.diff_blue })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = cp.diff_red })
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.bg0, bg = cp.blue })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.purple })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Constant', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'Debug', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Define', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Float', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.cyan, italic = true })
vim.api.nvim_set_hl(0, 'Ignore', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'Include', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'Method', {})
vim.api.nvim_set_hl(0, 'Number', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Special', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'Statement', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'String', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.red, italic = true })
-- vim.api.nvim_set_hl(0, 'Struct', {})
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Title', { fg = cp.purple, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'Type', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = cp.diff_red, undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg = cp.diff_yellow, undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg = cp.diff_blue, undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg = cp.diff_green, undercurl = true, sp = cp.green })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = cp.green })

---------- NVIM LSPCONFIG ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = cp.bg2 })

-- vim.api.nvim_set_hl(0, 'LspCodeLens', {})
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', {})
-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {})

---------- AERIAL ----------
-- vim.api.nvim_set_hl(0, 'AerialArrayIcon', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { link = 'Boolean' })
-- vim.api.nvim_set_hl(0, 'AerialClassIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialConstantIcon', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { link = 'TSConstructor' })
-- vim.api.nvim_set_hl(0, 'AerialEnumIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { link = 'TSField' })
-- vim.api.nvim_set_hl(0, 'AerialEventIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialFieldIcon', { fg = cp.green })
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

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.fg, strikethrough = true }) -- FIXED
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.fg })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = cp.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = cp.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.fg })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.red })

-------- INDENT BLANKLINES --------
-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {})
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', {})
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', {})
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = cp.grey })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = cp.grey, underdash = true })

--------- NEOTREE ---------
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = cp.white, bg = cp.black2 }) -- FIXED
-- vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = cp.pink, bold = true })
-- vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'NeoTreeUntracked', { fg = cp.blue })

---------- NVIM NOTIFY ----------
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

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.green })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = cp.white, bg = cp.teleblack })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = cp.diff_green })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = cp.red, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.teledark, bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = cp.teleblack, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.bg2, bg = cp.green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.bg2, bg = cp.red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.teledark, bg = cp.blue })

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = cp.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSComment', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'TSConditional', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.cayn, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.cayn, italic = true })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = cp.bg0, bg = cp.red, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
-- vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' })
vim.api.nvim_set_hl(0, 'TSException', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.green, italic = true })
vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.yellow, italic = true })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.bg0, bg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.grey })
vim.api.nvim_set_hl(0, 'TSString', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
-- vim.api.nvim_set_hl(0, 'TSStructure', { fg = cp.cayn, italic = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.red, italic = true })
-- vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSText', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })
vim.api.nvim_set_hl(0, 'TSType', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.green, underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.cayn, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.bg0, bg = cp.yellow, bold = true })

--- LANGUAGE ---
------ LATEX ------
-- vim.api.nvim_set_hl(0, 'latexTSComment', {})
-- vim.api.nvim_set_hl(0, 'latexTSEmphasis', {})
-- vim.api.nvim_set_hl(0, 'latexTSEnvironment', {})
-- vim.api.nvim_set_hl(0, 'latexTSEnvironmentName', {})
-- vim.api.nvim_set_hl(0, 'latexTSFuncMacro', {})
-- vim.api.nvim_set_hl(0, 'latexTSFunction', {})
-- vim.api.nvim_set_hl(0, 'latexTSInclude', {})
-- vim.api.nvim_set_hl(0, 'latexTSMath', {})
-- vim.api.nvim_set_hl(0, 'latexTSNamespace', {})
-- vim.api.nvim_set_hl(0, 'latexTSOperator', {})
-- vim.api.nvim_set_hl(0, 'latexTSParameter', {})
-- vim.api.nvim_set_hl(0, 'latexTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'latexTSPunctSpecial', {})
-- vim.api.nvim_set_hl(0, 'latexTSString', {})
-- vim.api.nvim_set_hl(0, 'latexTSStringRegex', {})
-- vim.api.nvim_set_hl(0, 'latexTSTextReference', {})
-- vim.api.nvim_set_hl(0, 'latexTSTitle', {})

------ LUA ------
-- vim.api.nvim_set_hl(0, 'LuaTSBoolean', {})
-- vim.api.nvim_set_hl(0, 'LuaTSComment', {})
-- vim.api.nvim_set_hl(0, 'luaTSConditional', {})
-- vim.api.nvim_set_hl(0, 'luaTSConstructor', {})
-- vim.api.nvim_set_hl(0, 'luaTSField', {})
-- vim.api.nvim_set_hl(0, 'luaTSFunction', {})
-- vim.api.nvim_set_hl(0, 'luaTSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'LuaTSKeyword', {})
-- vim.api.nvim_set_hl(0, 'luaTSKeywordFunction', {})
-- vim.api.nvim_set_hl(0, 'luaTSMethod', {})
-- vim.api.nvim_set_hl(0, 'luaTSNumber', {})
-- vim.api.nvim_set_hl(0, 'luaTSOperator', {})
-- vim.api.nvim_set_hl(0, 'luaTSParameter', {})
-- vim.api.nvim_set_hl(0, 'luaTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'luaTSPunctDelimiter', {})
-- vim.api.nvim_set_hl(0, 'luaTSString', {})
-- vim.api.nvim_set_hl(0, 'LuaTSVariable', {})

------ NEORG ------
-- vim.api.nvim_set_hl(0, 'NeorgCodeBlock', {})
-- vim.api.nvim_set_hl(0, 'NeorgLinkLocationURL', {})

------ PYTHON ------
-- vim.api.nvim_set_hl(0, 'pythonTSBoolean', {})
-- vim.api.nvim_set_hl(0, 'pythonTSComment', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConditional', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConstant', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConstBuiltin', {})
-- vim.api.nvim_set_hl(0, 'pythonTSConstructor', {})
-- vim.api.nvim_set_hl(0, 'pythonTSField', {})
-- vim.api.nvim_set_hl(0, 'pythonTSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'pythonTSFunction', {})
-- vim.api.nvim_set_hl(0, 'pythonTSInclude', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeyword', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordFunction', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordOperator', {})
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordReturn', {})
-- vim.api.nvim_set_hl(0, 'pythonTSMethod', {})
-- vim.api.nvim_set_hl(0, 'pythonTSNumber', {})
-- vim.api.nvim_set_hl(0, 'pythonTSOperator', {})
-- vim.api.nvim_set_hl(0, 'pythonTSParameter', {})
-- vim.api.nvim_set_hl(0, 'pythonTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'pythonTSPunctDelimiter', {})
-- vim.api.nvim_set_hl(0, 'pythonTSRepeat', {})
-- vim.api.nvim_set_hl(0, 'pythonTSString', {})
-- vim.api.nvim_set_hl(0, 'pythonTSStringEscape', {})
-- vim.api.nvim_set_hl(0, 'pythonTSType', {})
-- vim.api.nvim_set_hl(0, 'pythonTSTypeBuiltin', {})
-- vim.api.nvim_set_hl(0, 'pythonTSVariable', {})
-- vim.api.nvim_set_hl(0, 'pythonTSVariableBuiltin', {})

vim.g.terminal_color_0 = cp.black
vim.g.terminal_color_1 = cp.red
vim.g.terminal_color_2 = cp.green
vim.g.terminal_color_3 = cp.yellow
vim.g.terminal_color_4 = cp.blue
vim.g.terminal_color_5 = cp.purple
vim.g.terminal_color_6 = cp.cyan
vim.g.terminal_color_7 = cp.fg
vim.g.terminal_color_8 = cp.grey
vim.g.terminal_color_9 = cp.red
vim.g.terminal_color_10 = cp.green
vim.g.terminal_color_11 = cp.yellow
vim.g.terminal_color_12 = cp.blue
vim.g.terminal_color_13 = cp.purple
vim.g.terminal_color_14 = cp.cyan
vim.g.terminal_color_15 = cp.fg