-- Modified from https://github.com/olimorris/onedarkpro.nvim
vim.g.colors_name = 'onedark'

local colors = {}

if vim.g.theme_style == 'dark' then
	colors = {
		bg = '#282C34',
		fg = '#ABB2BF',
		red = '#E06C75',
		orange = '#D19A66',
		yellow = '#E5C07B',
		green = '#98C379',
		cyan = '#56B6C2',
		blue = '#61AFEF',
		purple = '#C678DD',
		white = '#ABB2BF',
		black = '#282C34',
		gray = '#5C6370',
		highlight = '#E2BE7D',

		-- Git diff
		diff_add = '#109868',
		diff_delete = '#9a353d',
		diff_change = '#e0af68',
		diff_text = '#005869',

		cursorline = '#2E323A',
		color_column = '#2E323A',
		comment = '#7D828D',
		indentline = '#373B42',
		menu = '#3D4148',
		menu_scroll = '#33373E',
		menu_scroll_thumb = '#4E8CDF',
		selection = '#53565D',

		-- Lines
		bg_statusline = '#33373E',
		fg_gutter = '#3D4148',
		fg_sidebar = '#ABB2BF',

		teledark = '#22262e',
		teleblack = '#2e323a',

		Rb1 = '#FFD500',
		Rb2 = '#D170CD',
		Rb3 = '#00A2FF',
	}
else
	colors = {
		bg = '#FAFAFA',
		fg = '#383A42',
		red = '#f6483f',
		orange = '#A06600',
		yellow = '#EEA825',
		green = '#24A442',
		cyan = '#56B6C2',
		blue = '#2A77FA',
		purple = '#A626A4',
		white = '#FAFAFA',
		black = '#6A6A6A',
		gray = '#BEBEBE',
		highlight = '#FFE792',

		-- Git diff
		diff_add = '#CAE3E8',
		diff_delete = '#F5C6C6',
		diff_change = '#ADBAC7',
		diff_text = '#A6D0D8',

		-- Additional colors
		cursorline = '#F3F3F3',
		color_column = '#F3F3F3',
		comment = '#989898',
		indentline = '#E9E9E9',
		menu = '#EEEEEE',
		menu_scroll = '#E1E1E1',
		menu_scroll_thumb = '#5592FB',
		selection = '#E1E1E1',

		-- Lines
		bg_statusline = '#EEEEEE',
		fg_gutter = '#EEEEEE',
		fg_sidebar = '#383A42',

		teledark = '#FFFFFF',
		teleblack = '#F4F4F4',

		Rb1 = '#0028FF',
		Rb2 = '#009619',
		Rb3 = '#853302',
	}
end

------ BASICS ------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = colors.color_column })
vim.api.nvim_set_hl(0, 'Conceal', {})
vim.api.nvim_set_hl(0, 'Cursor', { fg = colors.bg, bg = colors.black })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = colors.gray })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.teleblack }) -- FIXED
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.fg, bg = colors.cursorline })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {})
vim.api.nvim_set_hl(0, 'Directory', { fg = colors.blue })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = colors.bg })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.red })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = colors.gray })
vim.api.nvim_set_hl(0, 'FoldColumn', {})
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.gray })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.yellow, bg = colors.selection })
-- vim.api.nvim_set_hl(0, 'lCursor', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.gray })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = colors.cyan, underline = true })
vim.api.nvim_set_hl(0, 'ModeMsg', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = colors.green })
vim.api.nvim_set_hl(0, 'MsgArea', { link = 'ModeMsg' })
vim.api.nvim_set_hl(0, 'MsgSeparator', { link = 'ModeMsg' })
vim.api.nvim_set_hl(0, 'NonText', { fg = colors.gray })
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = colors.fg, bg = colors.color_column })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = colors.menu })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = colors.menu_scroll })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.bg, bg = colors.blue })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colors.menu_scroll_thumb })
vim.api.nvim_set_hl(0, 'Question', { fg = colors.gray })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = colors.cursorline })
vim.api.nvim_set_hl(0, 'Search', { fg = colors.yellow, bg = colors.selection, underline = true })
-- vim.api.nvim_set_hl(0, 'SignColumn', {})
-- vim.api.nvim_set_hl(0, 'SpecialKey', {})
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg, bg = colors.bg_statusline })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colors.fg, bg = colors.color_column })
vim.api.nvim_set_hl(0, 'Substitute', { fg = colors.bg, bg = colors.yellow })
vim.api.nvim_set_hl(0, 'TabLine', {})
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colors.purple, bg = colors.bg_statusline })
-- vim.api.nvim_set_hl(0, 'TermCursor', { bg = colors.purple })
-- vim.api.nvim_set_hl(0, 'TermCursorNC', { bg = colors.gray })
-- vim.api.nvim_set_hl(0, 'VertSplit', {})
vim.api.nvim_set_hl(0, 'Visual', { bg = colors.selection })
vim.api.nvim_set_hl(0, 'VisualNOS', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = colors.comment })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = colors.black, bg = colors.blue })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.gray })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = colors.diff_add })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = colors.diff_change })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = colors.diff_delete })
vim.api.nvim_set_hl(0, 'DiffText', { bg = colors.diff_text })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = colors.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = colors.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = colors.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = colors.green })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Character', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.comment, italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Debug', {})
vim.api.nvim_set_hl(0, 'Define', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'Error', { fg = colors.error_red })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'Float', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.blue, italic = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'Ignore', {})
vim.api.nvim_set_hl(0, 'Include', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'Italic', { italic = true })
vim.api.nvim_set_hl(0, 'Label', { fg = colors.red })
vim.api.nvim_set_hl(0, 'Macro', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.cyan, italic = true })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'Repeat', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'Special', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = colors.comment })
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'String', { fg = colors.green, italic = true })
vim.api.nvim_set_hl(0, 'Structure', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'Tag', {})
vim.api.nvim_set_hl(0, 'Title', { fg = colors.green })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'Type', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'Typedef', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', {})
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', {})

-- vim.api.nvim_set_hl(0, 'healthError', {})
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, 'healthWarning', {})

-- vim.api.nvim_set_hl(0, 'qfLineNr', {})
-- vim.api.nvim_set_hl(0, 'qfFileName', {})

------ DIAGNOSTIC ------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = colors.cyan })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = colors.red, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = colors.yellow, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = colors.blue, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = colors.cyan, underline = true })

------ GIT ------
-- vim.api.nvim_set_hl(0, 'diffAdded', { fg = colors.green })
-- vim.api.nvim_set_hl(0, 'diffChanged', { fg = colors.yellow })
-- vim.api.nvim_set_hl(0, 'diffRemoved', { fg = colors.red })
-- vim.api.nvim_set_hl(0, 'diffFile', { fg = colors.yellow })
-- vim.api.nvim_set_hl(0, 'diffNewFile', { fg = colors.yellow })
-- vim.api.nvim_set_hl(0, 'diffLine', { fg = colors.blue })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = colors.selection })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = colors.selection })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = colors.selection })

-- vim.api.nvim_set_hl(0, 'LspCodeLens', {})
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', {})
-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {})

------ AERIAL ------
-- vim.api.nvim_set_hl(0, 'AerialArrayIcon', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'AerialClassIcon', { fg = colors.purple })
-- vim.api.nvim_set_hl(0, 'AerialConstantIcon', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { link = 'TSConstructor' })
-- vim.api.nvim_set_hl(0, 'AerialEnumIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { link = 'TSField' })
-- vim.api.nvim_set_hl(0, 'AerialEventIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialFieldIcon', { link = 'TSField' })
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

------ CMP ------
vim.api.nvim_set_hl(0, 'CmpDocumentation', { fg = colors.fg, bg = colors.menu })
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { fg = colors.fg, bg = colors.menu })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = colors.fg, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = colors.cyan, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = colors.blue })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = colors.green })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, 'CmpItemKindEnum', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindEvent', {})
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = colors.fg })
-- vim.api.nvim_set_hl(0, 'CmpItemKindFile', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindFolder', {})
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link = 'CmpItemKindMethod' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindClass' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = colors.blue })
-- vim.api.nvim_set_hl(0, 'CmpItemKindModule', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindOperator', {})
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = colors.red })
-- vim.api.nvim_set_hl(0, 'CmpItemKindReference', {})
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = colors.green })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = colors.fg })
-- vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindUnit', {})
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = colors.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = colors.red })
-- vim.api.nvim_set_hl(0, 'CmpItemKindVColor', {})

------ INDENTBLANKLINE ------
vim.api.nvim_set_hl(0, 'IndentLine', { fg = colors.indentline })
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { link = 'IndentLine' })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { link = 'IndentLine' })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { link = 'IndentLine' })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { underline = true })

------ NEOTREE ------
-- vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = colors.color_column })
-- vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = colors.cyan, underline = true })
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = colors.blue })
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = colors.purple })
-- vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = colors.purple, bold = true })
-- vim.api.nvim_set_hl(0, 'NeoTreeFileIcon', { fg = colors.blue })
-- vim.api.nvim_set_hl(0, 'NeoTreeFileName', { fg = colors.fg })
-- vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { fg = colors.purple, italic = true })
-- vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = colors.gray })
-- vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg = colors.bg, bg = colors.gray })

------ NOTIFY ------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = colors.orange })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = colors.red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = colors.orange })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = colors.yellow, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = colors.blue, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = colors.orange, italic = true })

------ PACKER ------
vim.api.nvim_set_hl(0, 'packerFail', { fg = colors.red })
vim.api.nvim_set_hl(0, 'packerSuccess', { fg = colors.green })
vim.api.nvim_set_hl(0, 'packerWorking', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'packerOutput', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'packerStatusFail', { fg = colors.red })
vim.api.nvim_set_hl(0, 'packerStatusSuccess', { fg = colors.green })

------ RAINBOW ------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = colors.Rb1 })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = colors.Rb2 })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = colors.Rb3 })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = colors.Rb1 })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = colors.Rb2 })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = colors.Rb3 })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = colors.Rb2 })

------ TELESCOPE ------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = colors.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = colors.fg, bg = colors.teleblack })
-- vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = colors.purple, bg = colors.cursorline })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = colors.purple })
-- vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg = colors.comment, bg = colors.cursorline })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = colors.green })

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = colors.fg, bg = colors.teleblack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = colors.teledark, bg = colors.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = colors.teleblack, bg = colors.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = colors.menu, bg = colors.green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.menu, bg = colors.red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = colors.teledark, bg = colors.blue })

------ TREESITTER ------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' })
vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'TSConstMacro', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = colors.fg, italic = true })
vim.api.nvim_set_hl(0, 'TSEnvironment', { link = 'Macro' })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' })
vim.api.nvim_set_hl(0, 'TSException', { link = 'Exception' })
vim.api.nvim_set_hl(0, 'TSField', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = colors.purple })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSMath', { fg = colors.red }) -- FIXED
vim.api.nvim_set_hl(0, 'TSMethod', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = colors.red, italic = true })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = colors.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSString', { fg = colors.green })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = colors.cyan, italic = true })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = colors.green, italic = true })
vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'Special' })
vim.api.nvim_set_hl(0, 'TSStrong', { fg = colors.fg, bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSTag', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSText', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSTextReference', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSType', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = colors.yellow })
vim.api.nvim_set_hl(0, 'TSUnderline', { fg = colors.fg, underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = colors.blue })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = colors.red })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = colors.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = colors.yellow })

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
-- vim.api.nvim_set_hl(0, 'luaTSField', { fg = c.vscYellow })
-- vim.api.nvim_set_hl(0, 'luaTSFunction', {})
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
vim.api.nvim_set_hl(0, 'pythonTSConstant', { fg = colors.orange })
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
vim.api.nvim_set_hl(0, 'pythonTSParameter', { fg = colors.orange })
-- vim.api.nvim_set_hl(0, 'pythonTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'pythonTSPunctDelimiter', {})
-- vim.api.nvim_set_hl(0, 'pythonTSRepeat', {})
-- vim.api.nvim_set_hl(0, 'pythonTSString', {})
-- vim.api.nvim_set_hl(0, 'pythonTSStringEscape', {})
vim.api.nvim_set_hl(0, 'pythonTSType', { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, 'pythonTSTypeBuiltin', {})
-- vim.api.nvim_set_hl(0, 'pythonTSVariable', {})
-- vim.api.nvim_set_hl(0, 'pythonTSVariableBuiltin', {})

vim.g.terminal_color_0 = colors.gray
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.purple
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.fg
vim.g.terminal_color_8 = colors.black
vim.g.terminal_color_9 = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.purple
vim.g.terminal_color_14 = colors.cyan
vim.g.terminal_color_15 = colors.fg
