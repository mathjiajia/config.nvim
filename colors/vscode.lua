-- Modified from https://github.com/Mofiqul/vscode.nvim
vim.g.colors_name = 'vscode'

local c = {}

if vim.g.theme_style == 'dark' then
	c = {
		vscNone  = 'NONE',
		vscFront = '#D4D4D4',
		vscBack  = '#1E1E1E',

		vscTabCurrent = '#1E1E1E',
		vscTabOther   = '#2D2D2D',
		vscTabOutside = '#252526',

		vscLeftDark  = '#252526',
		vscLeftMid   = '#373737',
		vscLeftLight = '#636369',

		vscPopupFront         = '#BBBBBB',
		vscPopupBack          = '#272727',
		vscPopupHighlightBlue = '#004b72',
		vscPopupHighlightGray = '#343B41',

		vscSplitLight = '#898989',
		vscSplitDark  = '#444444',
		vscSplitThumb = '#424242',

		vscCursorDarkDark = '#222222',
		vscCursorDark     = '#51504F',
		vscCursorLight    = '#AEAFAD',
		vscSelection      = '#264F78',
		vscLineNumber     = '#5A5A5A',

		vscDiffRedDark       = '#4B1818',
		vscDiffRedLight      = '#6F1313',
		vscDiffRedLightLight = '#FB0101',
		vscDiffGreenDark     = '#373D29',
		vscDiffGreenLight    = '#4B5632',
		vscSearchCurrent     = '#515c6a',
		vscSearch            = '#613315',

		vscContext        = '#404040',
		vscContextCurrent = '#707070',

		vscFoldBackground = '#202d39',

		-- Syntax colors
		vscGray         = '#808080',
		vscViolet       = '#646695',
		vscBlue         = '#569CD6',
		vscDarkBlue     = '#223E55',
		vscMediumBlue   = '#18a2fe',
		vscLightBlue    = '#9CDCFE',
		vscGreen        = '#6A9955',
		vscBlueGreen    = '#4EC9B0',
		vscLightGreen   = '#B5CEA8',
		vscRed          = '#F44747',
		vscOrange       = '#CE9178',
		vscLightRed     = '#D16969',
		vscYellowOrange = '#D7BA7D',
		vscYellow       = '#DCDCAA',
		vscPink         = '#C586C0',

		-- Rianbow
		vscRb1 = '#FFD700',
		vscRb2 = '#DA70D6',
		vscRb3 = '#179FFF',
	}
else
	c = {
		vscNone  = 'NONE',
		vscFront = '#343434',
		vscBack  = '#FFFFFF',

		vscTabCurrent = '#FFFFFF',
		vscTabOther   = '#CECECE',
		vscTabOutside = '#E8E8E8',

		vscLeftDark  = '#F3F3F3',
		vscLeftMid   = '#E5E5E5',
		vscLeftLight = '#F3F3F3',

		vscPopupFront         = '#000000',
		vscPopupBack          = '#F3F3F3',
		vscPopupHighlightBlue = '#0064c1',
		vscPopupHighlightGray = '#767676',

		vscSplitLight = '#EEEEEE',
		vscSplitDark  = '#DDDDDD',
		vscSplitThumb = '#DFDFDF',

		vscCursorDarkDark = '#E5EBF1',
		vscCursorDark     = '#6F6F6F',
		vscCursorLight    = '#767676',
		vscSelection      = '#ADD6FF',
		vscLineNumber     = '#098658',

		vscDiffRedDark       = '#FFCCCC',
		vscDiffRedLight      = '#FFA3A3',
		vscDiffRedLightLight = '#FFCCCC',
		vscDiffGreenDark     = '#DBE6C2',
		vscDiffGreenLight    = '#EBF1DD',
		vscSearchCurrent     = '#A8AC94',
		vscSearch            = '#F8C9AB',

		vscContext        = '#D2D2D2',
		vscContextCurrent = '#929292',

		vscFoldBackground = '#e6f3ff',

		-- Syntax colors
		vscGray         = '#000000',
		vscViolet       = '#000080',
		vscBlue         = '#0000FF',
		vscDarkBlue     = '#007ACC',
		vscLightBlue    = '#0451A5',
		vscGreen        = '#008000',
		vscBlueGreen    = '#16825D',
		vscLightGreen   = '#098658',
		vscRed          = '#FF0000',
		vscOrange       = '#C72E0F',
		vscLightRed     = '#A31515',
		vscYellowOrange = '#800000',
		vscYellow       = '#795E26',
		vscPink         = '#AF00DB',

		-- Rianbow
		vscRb1 = '#002EFF',
		vscRb2 = '#009619',
		vscRb3 = '#853302',
	}
end

c.vscUiBlue = '#084671'
c.vscUiOrange = '#F28B25'
c.vscPopupHighlightLightBlue = '#D7EAFE'

local isDark = vim.o.background == 'dark'

---------- BASIC ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { fg = 'NONE', bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'Cursor', { fg = c.vscCursorDark, bg = c.vscCursorLight })
vim.api.nvim_set_hl(0, 'CursorColumn', { fg = 'NONE', bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.vscPopupFront, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Directory', { fg = c.vscBlue, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = c.vscBack, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = c.vscRed, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Folded', { fg = 'NONE', bg = c.vscFoldBackground })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = c.vscNone, bg = c.vscSearchCurrent })
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = c.vscNone, bg = c.vscCursorDark })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = c.vscFront, bg = c.vscLeftDark })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = c.vscFront, bg = c.vscLeftDark })
vim.api.nvim_set_hl(0, 'NonText', { fg = (isDark and c.vscLineNumber or c.vscTabOther), bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Normal', { fg = c.vscFront, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = c.vscPopupFront, bg = c.vscPopupBack })
vim.api.nvim_set_hl(0, 'PmenuSbar', { fg = 'NONE', bg = c.vscPopupHighlightGray })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = isDark and c.vscPopupFront or c.vscBack, bg = c.vscPopupHighlightBlue })
vim.api.nvim_set_hl(0, 'PmenuThumb', { fg = 'NONE', bg = c.vscPopupFront })
vim.api.nvim_set_hl(0, 'Question', { fg = c.vscBlue, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Search', { fg = c.vscNone, bg = c.vscSearch })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = 'NONE', bg = c.vscBack })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = c.vscBlue, bg = c.vscNone })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.vscFront, bg = c.vscLeftMid })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = c.vscFront, bg = c.vscLeftDark })
vim.api.nvim_set_hl(0, 'TabLine', { fg = c.vscFront, bg = c.vscTabOther })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = c.vscFront, bg = c.vscTabOutside })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = c.vscFront, bg = c.vscTabCurrent })
vim.api.nvim_set_hl(0, 'Title', { fg = c.vscNone, bg = c.vscNone, bold = true })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = c.vscSplitDark, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Visual', { fg = c.vscNone, bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'VisualNOS', { fg = c.vscNone, bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = c.vscRed, bg = c.vscBack, bold = true })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = c.vscNone, bg = c.vscSelection })

---------- DIFF ----------
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = 'NONE', bg = c.vscDiffGreenLight })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = 'NONE', bg = c.vscDiffRedDark })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = 'NONE', bg = c.vscDiffRedLight })
vim.api.nvim_set_hl(0, 'DiffText', { fg = 'NONE', bg = c.vscDiffRedLight })

---------- SPELL ----------
vim.api.nvim_set_hl(0, 'SpellBad', { fg = c.vscRed, bg = c.vscBack, undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellCap', { fg = c.vscRed, bg = c.vscBack, undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellLocal', { fg = c.vscRed, bg = c.vscBack, undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellRare', { fg = c.vscRed, bg = c.vscBack, undercurl = true, sp = c.vscRed })

---------- SYNTAX ----------
vim.api.nvim_set_hl(0, 'Boolean', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Character', { fg = c.vscOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Comment', { fg = c.vscGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Conceal', { fg = c.vscFront, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Conditional', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Constant', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Debug', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Define', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Error', { fg = c.vscRed, bg = c.vscBack, undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'Exception', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Float', { fg = c.vscLightGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Function', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Ignore', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Include', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Label', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Macro', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Number', { fg = c.vscLightGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Operator', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Repeat', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Special', { fg = c.vscYellowOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = c.vscGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Statement', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'String', { fg = c.vscOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Structure', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Tag', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Todo', { fg = c.vscYellowOrange, bg = c.vscBack, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Typedef', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Underlined', { fg = c.vscNone, bg = 'NONE', underline = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = isDark and c.vscLineNumber or c.vscTabOther })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = c.vscRed, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscYellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscBlue })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = 'NONE', bg = 'NONE', undercurl = true, sp = c.vscBlue })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText',
	{ fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
vim.api.nvim_set_hl(0, 'LspReferenceRead',
	{ fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })
vim.api.nvim_set_hl(0, 'LspReferenceWrite',
	{ fg = 'NONE', bg = isDark and c.vscPopupHighlightGray or c.vscPopupHighlightLightBlue })

---------- BUFFERLINE ----------
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { fg = c.vscLeftDark, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'BufferLineFill', { fg = 'NONE', bg = c.vscLeftDark })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = c.vscUiOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = c.vscPopupFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = c.vscCursorDark, bg = c.vscPopupBack, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = isDark and c.vscMediumBlue or c.vscDarkBlue, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy',
	{ fg = isDark and c.vscMediumBlue or c.vscDarkBlue, bg = 'NONE', bold = true })

vim.api.nvim_set_hl(0, 'CmpItemKind', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = 'CmpItemKindConstructor' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link = 'CmpItemKindKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSParameterReference' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { link = 'cssColor' })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { link = 'TSURI' })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = 'TSURI' })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { link = 'TSConstant' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link = 'TSConstant' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link = 'TSStructure' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link = 'TSParameter' })

---------- GITSIGNS ----------
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = c.vscGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = c.vscRed, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = c.vscBack, bg = c.vscGreen })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = c.vscBack, bg = c.vscYellow })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = c.vscBack, bg = c.vscRed })

---------- INDENT BLANKLINES ----------
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = c.vscContextCurrent, bg = 'NONE', nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { fg = c.vscContextCurrent, bg = 'NONE', nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = c.vscContext, bg = 'NONE', nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = c.vscContext, bg = 'NONE', nocombine = true })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = c.vscContext, bg = 'NONE', nocombine = true })

---------- NVIM TREE ----------
vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = c.vscFront, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = c.vscGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { fg = c.vscViolet, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = c.vscGray, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = c.vscPink, bg = 'NONE', underline = true })
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg = c.vscFront, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'NvimTreeCursorLine', { fg = 'NONE', bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'NvimTreeVertSplit', { fg = c.vscSplitDark, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'NvimTreeEndOfBuffer', { fg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = 'NONE', bg = c.vscCursorDarkDark })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = c.vscRb1 })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = c.vscRb2 })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = c.vscRb3 })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = c.vscRb1 })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = c.vscRb2 })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = c.vscRb3 })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = c.vscRb2 })

---------- TELESCOPE ----------
if isDark then
	vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = c.vscBlue, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = c.vscLineNumber, bg = 'NONE' })

	vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = c.vscLineNumber, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = c.vscLineNumber, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = c.vscLineNumber, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg = c.vscFront, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = c.vscFront, bg = c.vscPopupHighlightBlue })
	vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg = c.vscFront, bg = c.vscPopupHighlightBlue })
	vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = c.vscMediumBlue, bg = 'NONE', bold = true })
	vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = c.vscFront, bg = 'NONE' })
else
	vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = c.vscDarkBlue, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = c.vscTabOther, bg = 'NONE' })

	vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = c.vscTabOther, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { fg = c.vscTabOther, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { fg = c.vscTabOther, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg = c.vscFront, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = c.vscBack, bg = c.vscPopupHighlightBlue })
	vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg = c.vscBack, bg = c.vscPopupHighlightBlue })
	vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = c.vscDarkBlue, bg = 'NONE', bold = true, nil })
	vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = c.vscFront, bg = 'NONE' })
end

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = c.vscBlueGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = c.vscOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSComment', { fg = c.vscGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSConditional', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = c.vscBlueGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = c.vscBlueGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = c.vscRed, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = c.vscFront, bg = 'NONE', italic = true })
vim.api.nvim_set_hl(0, 'TSError', { fg = c.vscRed, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSException', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSField', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = c.vscLightGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = c.vscYellow, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = c.vscBlueGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSNote', { fg = c.vscBlueGreen, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = c.vscLightGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = c.vscPink, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSString', { fg = c.vscOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = isDark and c.vscOrange or c.vscYellowOrange, bold = true })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = c.vscOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSStrong', { fg = isDark and c.vscBlue or c.vscViolet, bold = true })
vim.api.nvim_set_hl(0, 'TSStructure', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSTag', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = c.vscGray, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSText', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = isDark and c.vscOrange or c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = isDark and c.vscBlue or c.vscYellowOrange, bold = true })
vim.api.nvim_set_hl(0, 'TSType', { fg = c.vscBlueGreen, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = c.vscBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSUnderline', { fg = c.vscYellowOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSURI', { fg = c.vscFront, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = c.vscLightBlue, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = c.vscYellowOrange, bg = 'NONE', bold = true })

------ MARKDOWN ------
vim.api.nvim_set_hl(0, 'markdown_inlineTSLiteral', { fg = c.vscOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'markdownTSLiteral', { fg = c.vscOrange, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'markdownTSPunctSpecial', { fg = isDark and c.vscBlue or c.vscYellowOrange, bold = true })

---------- TERMINAL COLORS ----------
vim.g.terminal_color_0 = c.vscBack
vim.g.terminal_color_8 = c.vscGray

vim.g.terminal_color_1 = c.vscRed
vim.g.terminal_color_9 = c.vscRed

vim.g.terminal_color_2  = c.vscGreen
vim.g.terminal_color_10 = c.vscGreen

vim.g.terminal_color_3  = c.vscYellow
vim.g.terminal_color_11 = c.vscYellow

vim.g.terminal_color_4  = c.vscBlue
vim.g.terminal_color_12 = c.vscBlue

vim.g.terminal_color_5  = c.vscPink
vim.g.terminal_color_13 = c.vscPink

vim.g.terminal_color_6  = c.vscBlueGreen
vim.g.terminal_color_14 = c.vscBlueGreen

vim.g.terminal_color_7  = c.vscFront
vim.g.terminal_color_15 = c.vscFront
