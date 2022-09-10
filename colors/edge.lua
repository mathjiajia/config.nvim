-- Modified from https://github.com/sainnhe/edge
vim.g.colors_name = 'edge'

local palette = {}

if vim.o.background == 'dark' then
	palette = {
		black       = '#202023',
		bg0         = '#2B2D37',
		bg1         = '#333644',
		bg2         = '#363A49',
		bg3         = '#3A3E4E',
		bg4         = '#404455',
		bg_grey     = '#7E869B',
		bg_red      = '#EC7279',
		diff_red    = '#55393D',
		bg_green    = '#A0C980',
		diff_green  = '#394634',
		bg_blue     = '#6CB6EB',
		diff_blue   = '#354157',
		bg_purple   = '#D38AEA',
		diff_yellow = '#4E432F',
		red         = '#EC7279',
		yellow      = '#DEB974',
		green       = '#A0C980',
		cyan        = '#5DBBC1',
		blue        = '#6CB6EB',
		purple      = '#D38AEA',
		fg          = '#C5CDD9',
		grey        = '#758094',
		grey_dim    = '#535C6A',
	}
else
	palette = {
		black       = '#DDE2E7',
		bg0         = '#FAFAFA',
		bg1         = '#EEF1F4',
		bg2         = '#E8EBF0',
		bg3         = '#E8EBF0',
		bg4         = '#DDE2E7',
		bg_grey     = '#BCC5CF',
		bg_red      = '#E17373',
		diff_red    = '#F6E4E4',
		bg_green    = '#76AF6F',
		diff_green  = '#E5EEE4',
		bg_blue     = '#6996E0',
		diff_blue   = '#E3EAF6',
		bg_purple   = '#BF75D6',
		diff_yellow = '#F0ECE2',
		fg          = '#4B505B',
		red         = '#D05858',
		yellow      = '#BE7E05',
		green       = '#608E32',
		cyan        = '#3A8B84',
		blue        = '#5079BE',
		purple      = '#B05CCC',
		grey        = '#8790A0',
		grey_dim    = '#BAC3CB',
	}
end

---------- BASIC ----------
vim.api.nvim_set_hl(0, 'Normal', { fg = palette.fg, bg = palette.bg0 })
-- vim.api.nvim_set_hl(0, 'NormalNC', { fg = palette.fg, bg = palette.bg0 })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = palette.bg4, bg = palette.bg0 })
vim.api.nvim_set_hl(0, 'Folded', { fg = palette.grey, bg = palette.bg1 })

vim.api.nvim_set_hl(0, 'SignColumn', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = palette.grey_dim })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = palette.bg0, bg = palette.bg_blue })
vim.api.nvim_set_hl(0, 'Search', { fg = palette.bg0, bg = palette.bg_green })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = palette.bg1 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = palette.grey_dim })

vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
vim.api.nvim_set_hl(0, 'lCursor', { link = 'Cursor' })

vim.api.nvim_set_hl(0, 'CursorLine', { bg = palette.bg1 })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = palette.bg1 })

vim.api.nvim_set_hl(0, 'LineNr', { fg = palette.grey_dim })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = palette.grey })

vim.api.nvim_set_hl(0, 'DiffAdd', { bg = palette.diff_green })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = palette.diff_blue })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = palette.diff_red })
vim.api.nvim_set_hl(0, 'DiffText', { fg = palette.bg0, bg = palette.blue })
vim.api.nvim_set_hl(0, 'Directory', { fg = palette.green })

vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = palette.red, bold = true, underline = true })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = palette.yellow, bold = true })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = palette.fg, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = palette.blue, bold = true })
-- vim.api.nvim_set_hl(0, 'MsgArea', {})
-- vim.api.nvim_set_hl(0, 'MsgSeparator', {})
vim.api.nvim_set_hl(0, 'MatchParen', { bg = palette.bg4 })
vim.api.nvim_set_hl(0, 'NonText', { fg = palette.bg4 })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = palette.bg4 })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = palette.bg4 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = palette.fg, bg = palette.bg2 })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = palette.bg2 })

vim.api.nvim_set_hl(0, 'PmenuSel', { fg = palette.bg0, bg = palette.blue })

vim.api.nvim_set_hl(0, 'WildMenu', { link = 'PmenuSel' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = palette.bg_grey })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = palette.fg, bg = palette.bg2 })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = palette.grey, bg = palette.bg2 })
vim.api.nvim_set_hl(0, 'Question', { fg = palette.yellow })

vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = palette.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = palette.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = palette.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = palette.purple })

vim.api.nvim_set_hl(0, 'StatusLine', { fg = palette.fg, bg = palette.bg2 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = palette.grey, bg = palette.bg1 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = palette.fg, bg = palette.bg4 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = palette.grey, bg = palette.bg1 })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = palette.bg0, bg = palette.bg_purple })

-- vim.api.nvim_set_hl(0, 'VertSplit', {})
vim.api.nvim_set_hl(0, 'Visual', { bg = palette.bg3 })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = palette.bg3, underline = true })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = palette.purple, bold = true })
vim.api.nvim_set_hl(0, 'Debug', { fg = palette.yellow })
-- vim.api.nvim_set_hl(0, 'debugPC', { fg = cp.bg0, bg = cp.bg_green })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = cp.bg0, bg = cp.bg_red })

vim.api.nvim_set_hl(0, 'Substitute', { fg = palette.bg0, bg = palette.yellow })
vim.api.nvim_set_hl(0, 'WinBarNC', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'TermCursor', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'healthError', { fg = palette.red })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = palette.green })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = palette.black })

------ SYNTAX ------
vim.api.nvim_set_hl(0, 'Type', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'Structure', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = palette.cyan, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = palette.yellow, italic = true })

vim.api.nvim_set_hl(0, 'PreProc', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Include', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Keyword', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Define', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Typedef', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Exception', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Conditional', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Repeat', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Statement', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'Macro', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'Error', { fg = palette.red })
vim.api.nvim_set_hl(0, 'Label', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'Special', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = palette.yellow })

vim.api.nvim_set_hl(0, 'Boolean', { fg = palette.green })
vim.api.nvim_set_hl(0, 'String', { fg = palette.green })
vim.api.nvim_set_hl(0, 'Character', { fg = palette.green })
vim.api.nvim_set_hl(0, 'Number', { fg = palette.green })
vim.api.nvim_set_hl(0, 'Float', { fg = palette.green })

vim.api.nvim_set_hl(0, 'Function', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'Operator', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Title', { fg = palette.purple, bold = true })
vim.api.nvim_set_hl(0, 'Tag', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = palette.fg })

vim.api.nvim_set_hl(0, 'Comment', { fg = palette.grey, italic = true })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = palette.grey, italic = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = palette.red, italic = true })

vim.api.nvim_set_hl(0, 'Ignore', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })
-- vim.api.nvim_set_hl(0, 'Method', {})
-- vim.api.nvim_set_hl(0, 'Struct', {})

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = palette.diff_red, undercurl = true, sp = palette.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg = palette.diff_yellow, undercurl = true, sp = palette.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg = palette.diff_blue, undercurl = true, sp = palette.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg = palette.diff_green, undercurl = true, sp = palette.green })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = palette.red })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = palette.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = palette.blue })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = palette.green })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = palette.bg2 })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = palette.bg2 })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = palette.bg2 })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { fg = palette.green })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = palette.bg0, bg = palette.green })

---------- AERIAL ----------
vim.api.nvim_set_hl(0, 'AerialLine', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'AerialGuide', { link = 'LineNr' })

vim.api.nvim_set_hl(0, 'AerialFileIcon', { fg = palette.green })
vim.api.nvim_set_hl(0, 'AerialModuleIcon', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'AerialNamespaceIcon', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'AerialPackageIcon', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'AerialClassIcon', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'AerialMethodIcon', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'AerialPropertyIcon', { fg = palette.red })
vim.api.nvim_set_hl(0, 'AerialFieldIcon', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'AerialEnumIcon', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'AerialInterfaceIcon', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { fg = palette.green })
vim.api.nvim_set_hl(0, 'AerialVariableIcon', { fg = palette.red })
vim.api.nvim_set_hl(0, 'AerialConstantIcon', { fg = palette.red })
vim.api.nvim_set_hl(0, 'AerialStringIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialNumberIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialArrayIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialObjectIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialKeyIcon', { fg = palette.red })
vim.api.nvim_set_hl(0, 'AerialNullIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialStructIcon', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'AerialEventIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialOperatorIcon', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'AerialTypeParameterIcon', { fg = palette.yellow })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = palette.blue, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = palette.blue, bold = true })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = palette.grey, strikethrough = true }) -- FIXED

vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = palette.fg })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = palette.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = palette.red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = palette.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = palette.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = palette.red })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = palette.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = palette.cayn })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = palette.green })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = palette.green })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = palette.red })

----- GITSIGNS -----
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = palette.green })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = palette.red })
vim.api.nvim_set_hl(0, 'GitSignsAddNr', { fg = palette.green })
vim.api.nvim_set_hl(0, 'GitSignsChangeNr', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'GitSignsDeleteNr', { fg = palette.red })
vim.api.nvim_set_hl(0, 'GitSignsAddLn', { fg = palette.green })
vim.api.nvim_set_hl(0, 'GitSignsChangeLn', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = palette.red })
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = palette.grey })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = palette.grey_dim })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = palette.grey_dim })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = palette.grey_dim })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = palette.grey })

---------- NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = palette.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = palette.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = palette.red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = palette.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = palette.red })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = palette.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = palette.purple })

---------- NVIM-TREE ----------
-- vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = cp.grey })
-- vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'NvimTreeMarkdownFile', { fg = cp.fg })
-- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = cp.grey })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitMerge', { fg = cp.cyan })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = cp.red })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = palette.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = palette.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = palette.green })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = palette.diff_green })

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSNote', { fg = palette.bg0, bg = palette.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = palette.bg0, bg = palette.yellow, bold = true })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = palette.bg0, bg = palette.red, bold = true })

vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = palette.green })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = palette.green })
vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSConditional', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = palette.cayn, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = palette.cayn, italic = true })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSException', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'TSField', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = palette.green })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = palette.blue })

vim.api.nvim_set_hl(0, 'TSInclude', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'TSLabel', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = palette.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSNone', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = palette.green })

vim.api.nvim_set_hl(0, 'TSOperator', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = palette.red, italic = true })

vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = palette.yellow })

vim.api.nvim_set_hl(0, 'TSRepeat', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSStorageClass', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'TSString', { fg = palette.green })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = palette.yellow })

vim.api.nvim_set_hl(0, 'TSSymbol', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSTag', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'TSText', { fg = palette.green })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = palette.grey })
vim.api.nvim_set_hl(0, 'TSMath', { fg = palette.green })

vim.api.nvim_set_hl(0, 'TSType', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSURI', { fg = palette.green, underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = palette.cayn, italic = true })

-- vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = palette.green })
-- vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = palette.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' })
-- vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = palette.purple })
-- vim.api.nvim_set_hl(0, 'TSLiteral', { fg = palette.green, italic = true })

-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
-- vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.purple })
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })

---------- TERMINAL COLORS ----------
vim.g.terminal_color_0  = palette.black
vim.g.terminal_color_1  = palette.red
vim.g.terminal_color_2  = palette.green
vim.g.terminal_color_3  = palette.yellow
vim.g.terminal_color_4  = palette.blue
vim.g.terminal_color_5  = palette.purple
vim.g.terminal_color_6  = palette.cyan
vim.g.terminal_color_7  = palette.fg
vim.g.terminal_color_8  = palette.grey
vim.g.terminal_color_9  = palette.red
vim.g.terminal_color_10 = palette.green
vim.g.terminal_color_11 = palette.yellow
vim.g.terminal_color_12 = palette.blue
vim.g.terminal_color_13 = palette.purple
vim.g.terminal_color_14 = palette.cyan
vim.g.terminal_color_15 = palette.fg
