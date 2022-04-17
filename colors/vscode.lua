-- Modified from https://github.com/Mofiqul/vscode.nvim
vim.g.colors_name = 'vscode'

local c = {}

if vim.g.theme_style == 'dark' then
	c = {
		vscFront = '#D4D4D4',
		vscBack = '#1E1E1E',

		vscTeleDark = '#181818',
		vscTeleBlack = '#222222',

		vscTabCurrent = '#252526',
		vscTabOther = '#2D2D2D',
		vscTabOutside = '#1E1E1E',

		vscLeftDark = '#252526',
		vscLeftMid = '#373737',
		vscLeftLight = '#636369',

		vscPopupFront = '#BBBBBB',
		vscPopupBack = '#272727',
		vscPopupMatchBlue = '#00A6FF',
		vscPopupHighlightBlue = '#004b72',
		vscPopupHighlightGray = '#343B41',

		vscSplitLight = '#898989',
		vscSplitDark = '#444444',
		vscSplitThumb = '#424242',

		vscCursorDarkDark = '#222222',
		vscCursorDark = '#51504F',
		vscCursorLight = '#AEAFAD',
		vscSelection = '#264F78',
		vscLineNumber = '#5A5A5A',
		vscLineNumberSelected = '#C8C8C8',

		vscDiffRedDark = '#971713',
		vscDiffRedLight = '#6F1313',
		vscDiffGreenDark = '#587A00',
		vscDiffGreenLight = '#4B5632',
		vscDiffBlue = '#007E9F',
		vscSearchCurrent = '#4B5632',
		vscSearch = '#264F78',

		vscContext = '#404040',
		vscContextCurrent = '#707070',

		-- Syntax colors
		vscGray = '#808080',
		vscViolet = '#646695',
		vscBlue = '#569CD6',
		vscDarkBlue = '#223E55',
		vscMediumBlue = '#18A2FE',
		vscLightBlue = '#9CDCFE',
		vscGreen = '#6A9955',
		vscBlueGreen = '#4EC9B0',
		vscLightGreen = '#B5CEA8',
		vscRed = '#F44747',
		vscOrange = '#CE9178',
		vscLightRed = '#D16969',
		vscYellowOrange = '#D7BA7D',
		vscYellow = '#DCDCAA',
		vscPink = '#C586C0',

		-- Rianbow
		vscRb1 = '#FFD700',
		vscRb2 = '#DA70D6',
		vscRb3 = '#179FFF',
	}
else
	c = {
		vscFront = '#343434',
		vscBack = '#FFFFFF',

		vscTeleDark = '#FDFDFD',
		vscTeleBlack = '#F1F7FD',

		vscTabCurrent = '#E8E8E8',
		vscTabOther = '#CECECE',
		vscTabOutside = '#FFFFFF',

		vscLeftDark = '#F3F3F3',
		vscLeftMid = '#E5E5E5',
		vscLeftLight = '#F3F3F3',

		vscPopupFront = '#000000',
		vscPopupBack = '#F3F3F3',
		vscPopupMatchBlue = '#0064C1',
		vscPopupHighlightBlue = '#0064C1',
		vscPopupHighlightGray = '#767676',

		vscSplitLight = '#EEEEEE',
		vscSplitDark = '#DDDDDD',
		vscSplitThumb = '#DFDFDF',

		vscCursorDarkDark = '#E5EBF1',
		vscCursorDark = '#D5D5D5',
		vscCursorLight = '#767676',
		vscSelection = '#ADD6FF',
		vscLineNumber = '#157995',
		vscLineNumberSelected = '#012671',

		vscDiffRedDark = '#FFCCCC',
		vscDiffRedLight = '#FFA3A3',
		vscDiffRedLightLight = '#FFCCCC',
		vscDiffGreenDark = '#DBE6C2',
		vscDiffGreenLight = '#EBF1DD',
		vscSearchCurrent = '#A8AC94',
		vscSearch = '#F8C9AB',

		vscContext = '#D2D2D2',
		vscContextCurrent = '#929292',

		-- Syntax colors
		vscGray = '#000000',
		vscViolet = '#000080',
		vscBlue = '#0000FF',
		vscDarkBlue = '#007ACC',
		vscLightBlue = '#0451A5',
		vscGreen = '#008000',
		vscBlueGreen = '#16825D',
		vscLightGreen = '#098658',
		vscRed = '#FF0000',
		vscOrange = '#C72E0F',
		vscLightRed = '#A31515',
		vscYellowOrange = '#800000',
		vscYellow = '#795E26',
		vscPink = '#AF00DB',

		-- Rianbow
		vscRb1 = '#002EFF',
		vscRb2 = '#009619',
		vscRb3 = '#853302',
	}
end

c.vscPopupMatchFront = '#FFFFFF'

---------- BASIC ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'Conceal', { fg = c.vscGray, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Cursor', { fg = c.vscCursorDark, bg = c.vscCursorLight })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = c.vscCursorDarkDark })
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.vscLineNumberSelected, bg = c.vscBack })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {})
vim.api.nvim_set_hl(0, 'Directory', { fg = c.vscBlue, bg = c.vscBack })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = c.vscBack, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = c.vscRed, bg = c.vscBack })
-- vim.api.nvim_set_hl(0, 'FloatBorder', {})
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Folded', { fg = c.vscLeftLight, bg = c.vscLeftDark, underline = true })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = 'NONE', bg = c.vscSearchCurrent })
-- vim.api.nvim_set_hl(0, 'lCursor', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = c.vscCursorDark })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = c.vscFront, bg = c.vscLeftDark })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = c.vscFront, bg = c.vscLeftDark })
-- vim.api.nvim_set_hl(0, 'MsgArea', {})
vim.api.nvim_set_hl(0, 'NonText', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Normal', { fg = c.vscFront, bg = c.vscBack })
-- vim.api.nvim_set_hl(0, 'NormalFloat', {})
-- vim.api.nvim_set_hl(0, 'NormalNC', {})
vim.api.nvim_set_hl(0, 'Pmenu', { fg = c.vscPopupFront, bg = c.vscPopupBack })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = c.vscPopupBack })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = c.vscPopupMatchFront, bg = c.vscPopupHighlightBlue })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = c.vscCursorDark })
vim.api.nvim_set_hl(0, 'Question', { fg = c.vscBlue }) -- removed bg
-- vim.api.nvim_set_hl(0, 'QuickFixLine', {})
vim.api.nvim_set_hl(0, 'Search', { fg = 'NONE', bg = c.vscSearch })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = c.vscBack })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.vscFront, bg = c.vscLeftMid })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = c.vscFront, bg = c.vscLeftDark })
-- vim.api.nvim_set_hl(0, 'Substitute', {})
vim.api.nvim_set_hl(0, 'TabLine', { fg = c.vscFront, bg = c.vscTabOther })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = c.vscFront, bg = c.vscTabOutside }) -- FIXED
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = c.vscFront, bg = c.vscTabCurrent })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', { fg = c.vscSplitDark, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Visual', { fg = 'NONE', bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'VisualNOS', { fg = 'NONE', bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = c.vscRed, bg = c.vscBack, bold = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = c.vscLineNumber, bg = 'NONE', undercurl = true })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = 'NONE', bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = c.vscPopupHighlightGray })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = c.vscDiffGreenDark, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = c.vscDiffBlue, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = c.vscDiffRedDark, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'DiffText', { fg = c.vscDiffRedLight, bg = c.vscBack })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = c.vscRed })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Boolean', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Character', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'Comment', { fg = c.vscGreen }) -- removed bg
vim.api.nvim_set_hl(0, 'Constant', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Conditional', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Debug', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'Define', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'Error', { fg = c.vscRed, bg = c.vscBack, undercurl = true })
vim.api.nvim_set_hl(0, 'Exception', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Float', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'Function', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'Ignore', { fg = c.vscFront, bg = c.vscBack, undercurl = true })
vim.api.nvim_set_hl(0, 'Include', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Label', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Macro', { fg = c.vscPink })
-- vim.api.nvim_set_hl(0, 'Method', { link = 'Function' })
vim.api.nvim_set_hl(0, 'Number', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'Operator', { fg = c.vscFront })
-- vim.api.nvim_set_hl(0, 'PreCondit', {})
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Repeat', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Special', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = c.vscGreen })
vim.api.nvim_set_hl(0, 'Statement', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'String', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'Structure', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Type' })
vim.api.nvim_set_hl(0, 'Tag', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'Title', { fg = 'NONE', bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = c.vscYellowOrange, bg = c.vscBack, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Typedef', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Underlined', { fg = 'NONE', bg = 'NONE', underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', {})
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', {})

-- vim.api.nvim_set_hl(0, 'healthError', {})
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = c.vscBlueGreen })
-- vim.api.nvim_set_hl(0, 'healthWarning', {})

-- vim.api.nvim_set_hl(0, 'qfLineNr', {})
-- vim.api.nvim_set_hl(0, 'qfFileName', {})

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = c.vscRed })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = c.vscDarkBlue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = c.vscBlueGreen })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underdash = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underdash = true, sp = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underdash = true, sp = c.vscDarkBlue })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underdash = true, sp = c.vscBlueGreen })

------ GIT -----
-- vim.api.nvim_set_hl(0, 'diffAdded', { link = 'DiffAdd' })
-- vim.api.nvim_set_hl(0, 'diffChanged', { link = 'DiffChange' })
-- vim.api.nvim_set_hl(0, 'diffRemoved', { link = 'DiffDelete' })

------ GITCOMMIT -----
-- vim.api.nvim_set_hl(0, 'gitcommitHeader', { fg = c.vscGray })
-- vim.api.nvim_set_hl(0, 'gitcommitOnBranch', { fg = c.vscGray })
-- vim.api.nvim_set_hl(0, 'gitcommitBranch', { fg = c.vscPink })
-- vim.api.nvim_set_hl(0, 'gitcommitComment', { fg = c.vscGray })
-- vim.api.nvim_set_hl(0, 'gitcommitSelectedType', { fg = c.vscGreen })
-- vim.api.nvim_set_hl(0, 'gitcommitSelectedFile', { fg = c.vscGreen })
-- vim.api.nvim_set_hl(0, 'gitcommitDiscardedType', { fg = c.vscRed })
-- vim.api.nvim_set_hl(0, 'gitcommitDiscardedFile', { fg = c.vscRed })
-- vim.api.nvim_set_hl(0, 'gitcommitOverflow', { fg = c.vscRed })
-- vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = c.vscPink })
-- vim.api.nvim_set_hl(0, 'gitcommitBlank', { fg = c.vscPink })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = c.vscCursorDark })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

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
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = c.vscGray, strikethrough = true })

vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = c.vscBlue })

vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = c.vscLightBlue })

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = c.vscFront })

------ GITSIGNS ------
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = c.vscGreen })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = c.vscRed })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = c.vscBack, bg = c.vscGreen })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = c.vscBack, bg = c.vscYellow })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = c.vscBack, bg = c.vscRed })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = c.vscContext, nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = c.vscContext, nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = c.vscContext, nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = c.vscContextCurrent, nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { fg = c.vscContextCurrent, nocombine = true })

--------- NEOTREE ---------
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeGitModified', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeNormal', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeRootName', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', {})
-- vim.api.nvim_set_hl(0, 'NeoTreeUntracked', {})

---------- NVIM NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = c.vscRed })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = c.vscGreen })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = c.vscGray })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = c.vscBlue })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = c.vscRed })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = c.vscGreen })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = c.vscGray })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = c.vscBlue })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = c.vscRed, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = c.vscYellow, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = c.vscGreen, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = c.vscGray, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = c.vscBlue, italic = true })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = c.vscRb1 })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = c.vscRb2 })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = c.vscRb3 })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = c.vscRb1 })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = c.vscRb2 })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = c.vscRb3 })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = c.vscRb2 })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = c.vscTeleDark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = c.white, bg = c.vscTeleBlack })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = c.vscFront, bg = c.vscPopupHighlightBlue })
vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg = c.vscFront, bg = c.vscPopupHighlightBlue })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = c.vscViolet, bold = true })

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = c.vscFront, bg = c.vscTeleBlack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = c.vscTeleDark, bg = c.vscTeleDark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = c.vscTeleBlack, bg = c.vscTeleBlack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = c.black, bg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = c.black, bg = c.vscLightRed })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = c.vscTeleDark, bg = c.vscBlue })

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSConditional', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = c.vscRed, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSError', { fg = c.vscRed })
vim.api.nvim_set_hl(0, 'TSException', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSField', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSMath', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSNote', { fg = c.vscBlueGreen, bold = true })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSString', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = c.vscOrange, bold = true })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSStrong', { fg = c.vscFront, bold = true })
vim.api.nvim_set_hl(0, 'TSStructure', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSTag', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = c.vscGray })
vim.api.nvim_set_hl(0, 'TSText', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = c.vscBlue, bold = true })
vim.api.nvim_set_hl(0, 'TSType', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSUnderline', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'TSURI', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = c.vscYellowOrange })

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
vim.api.nvim_set_hl(0, 'luaTSPunctBracket', {})
-- vim.api.nvim_set_hl(0, 'luaTSPunctDelimiter', {})
-- vim.api.nvim_set_hl(0, 'luaTSString', {})
-- vim.api.nvim_set_hl(0, 'LuaTSVariable', {})

------ MARKDOWN ------
-- vim.api.nvim_set_hl(0, 'markdownBold', { fg = c.vscBlue, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownCode', { fg = c.vscOrange })
-- vim.api.nvim_set_hl(0, 'markdownRule', { fg = c.vscBlue, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownCodeDelimiter', { fg = c.vscFront })
-- vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = c.vscBlue })
-- vim.api.nvim_set_hl(0, 'markdownFootnote', { fg = c.vscOrange })
-- vim.api.nvim_set_hl(0, 'markdownFootnoteDefinition', { fg = c.vscOrange })
-- vim.api.nvim_set_hl(0, 'markdownUrl', { fg = c.vscFront, underline = true })
-- vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = c.vscOrange })
-- vim.api.nvim_set_hl(0, 'markdownEscape', { fg = c.vscOrange })
-- vim.api.nvim_set_hl(0, 'markdownTSPunctSpecial', { fg = c.vscBlue, bold = true })

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

------ TERMINAL ------
vim.g.terminal_color_0 = c.vscBack
vim.g.terminal_color_8 = c.vscGray

vim.g.terminal_color_1 = c.vscRed
vim.g.terminal_color_9 = c.vscRed

vim.g.terminal_color_2 = c.vscGreen
vim.g.terminal_color_10 = c.vscGreen

vim.g.terminal_color_3 = c.vscYellow
vim.g.terminal_color_11 = c.vscYellow

vim.g.terminal_color_4 = c.vscBlue
vim.g.terminal_color_12 = c.vscBlue

vim.g.terminal_color_5 = c.vscPink
vim.g.terminal_color_13 = c.vscPink

vim.g.terminal_color_6 = c.vscBlueGreen
vim.g.terminal_color_14 = c.vscBlueGreen

vim.g.terminal_color_7 = c.vscFront
vim.g.terminal_color_15 = c.vscFront
