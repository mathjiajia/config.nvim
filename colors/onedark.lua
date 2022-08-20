-- Modified from https://github.com/olimorris/onedarkpro.nvim
vim.g.colors_name = 'onedark'

local utils = require 'themes.util'
local palette = {}

if vim.o.background == 'dark' then
	palette = {
		bg        = '#282C34',
		fg        = '#ABB2BF',
		red       = '#E06C75',
		orange    = '#D19A66',
		yellow    = '#E5C07B',
		green     = '#98C379',
		cyan      = '#56B6C2',
		blue      = '#61AFEF',
		purple    = '#C678DD',
		white     = '#ABB2BF',
		black     = '#282C34',
		gray      = '#5C6370',
		highlight = '#E2BE7D',

		-- Git diff
		diff_add    = '#003E4A',
		diff_delete = '#501B20',
		diff_text   = '#005869',
	}

	-- Additional colors
	palette.cursorline   = utils.lighten(palette.bg, 0.97)
	palette.color_column = utils.lighten(palette.bg, 0.97)
	palette.indentline   = utils.lighten(palette.bg, 0.93)
	palette.selection    = utils.lighten(palette.bg, 0.8)

	palette.bg_statusline = utils.lighten(palette.bg, 0.95)
	palette.fg_gutter     = utils.lighten(palette.bg, 0.90)
	palette.fg_sidebar    = palette.fg

	palette.virtual_text_error       = utils.lighten(palette.red, 0.7)
	palette.virtual_text_warning     = utils.lighten(palette.yellow, 0.7)
	palette.virtual_text_information = utils.lighten(palette.blue, 0.7)
	palette.virtual_text_hint        = utils.lighten(palette.cyan, 0.8)

	palette.pmenu = utils.darken(palette.bg, 0.85)
	palette.pmenusel = utils.lighten(palette.bg, 0.97)
	palette.pmenuthumb = utils.lighten(palette.bg, 0.5)
else
	palette = {
		bg        = '#FAFAFA',
		fg        = '#383A42',
		red       = '#F6483F',
		orange    = '#A06600',
		yellow    = '#EEA825',
		green     = '#24A442',
		cyan      = '#56B6C2',
		blue      = '#2A77FA',
		purple    = '#A626A4',
		white     = '#FAFAFA',
		black     = '#6A6A6A',
		gray      = '#BEBEBE',
		highlight = '#E2BE7D',

		-- Git diff
		diff_add    = '#CAE3E8',
		diff_delete = '#F5C6C6',
		diff_text   = '#A6D0D8',
	}

	-- Additional colors
	palette.cursorline   = utils.darken(palette.bg, 0.97)
	palette.color_column = utils.darken(palette.bg, 0.97)
	palette.indentline   = utils.darken(palette.bg, 0.93)
	palette.selection    = utils.darken(palette.bg, 0.90)

	palette.bg_statusline = utils.darken(palette.bg, 0.95)
	palette.fg_gutter     = utils.darken(palette.bg, 0.90)
	palette.fg_sidebar    = palette.fg

	palette.virtual_text_error       = utils.lighten(palette.red, 0.6)
	palette.virtual_text_warning     = utils.lighten(palette.yellow, 0.6)
	palette.virtual_text_information = utils.lighten(palette.blue, 0.6)
	palette.virtual_text_hint        = utils.lighten(palette.cyan, 0.6)

	palette.pmenu = utils.darken(palette.bg, 0.95)
	palette.pmenusel = utils.darken(palette.bg, 0.98)
	palette.pmenuthumb = utils.darken(palette.bg, 0.5)
end

---------- BASICS ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = palette.color_column })
vim.api.nvim_set_hl(0, 'Conceal', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'Cursor', { bg = palette.purple, fg = palette.bg })
-- vim.api.nvim_set_hl(0, 'lCursor', {})
-- vim.api.nvim_set_hl(0, 'CursorIM', { bg = palette.red })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = palette.gray })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = palette.cursorline })
vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = palette.cursorline, fg = palette.purple, bold = true })
vim.api.nvim_set_hl(0, 'Directory', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = palette.diff_add })
vim.api.nvim_set_hl(0, 'DiffChange', { underline = true })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = palette.diff_delete })
vim.api.nvim_set_hl(0, 'DiffText', { bg = palette.diff_text })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = palette.bg })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = palette.red })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'Folded', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = palette.bg })
vim.api.nvim_set_hl(0, 'Substitute', { bg = palette.yellow, fg = palette.bg })
vim.api.nvim_set_hl(0, 'LineNr', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = palette.cyan, underline = true })
vim.api.nvim_set_hl(0, 'ModeMsg', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'MsgArea', { link = 'ModeMsg' })
vim.api.nvim_set_hl(0, 'MsgSeparator', { link = 'ModeMsg' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = palette.green })
vim.api.nvim_set_hl(0, 'NonText', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'Normal', { bg = palette.bg, fg = palette.fg })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = palette.color_column, fg = palette.fg })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = palette.pmenu })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = palette.pmenu })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = palette.pmenusel })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = palette.pmenusel, fg = palette.fg })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = palette.pmenuthumb })
vim.api.nvim_set_hl(0, 'Question', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = palette.cursorline })
vim.api.nvim_set_hl(0, 'Search', { bg = palette.selection, fg = palette.yellow, underline = true })
-- vim.api.nvim_set_hl(0, 'SpecialKey', {})
vim.api.nvim_set_hl(0, 'IncSearch', { bg = palette.selection, fg = palette.yellow })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = palette.bg_statusline, fg = palette.fg })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = palette.color_column, fg = palette.fg })
vim.api.nvim_set_hl(0, 'TabLine', { bg = palette.bg })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = palette.bg, fg = palette.fg })
vim.api.nvim_set_hl(0, 'TabLineSel', { bg = palette.gray, fg = palette.purple })
vim.api.nvim_set_hl(0, 'TermCursor', { bg = palette.purple })
vim.api.nvim_set_hl(0, 'TermCursorNC', { bg = palette.gray })
vim.api.nvim_set_hl(0, 'Title', { fg = palette.green })
vim.api.nvim_set_hl(0, 'Visual', { bg = palette.selection })
vim.api.nvim_set_hl(0, 'VisualNOS', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'WinBar', { bg = palette.bg, fg = palette.fg })
vim.api.nvim_set_hl(0, 'WinBarNC', { bg = palette.color_column })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = palette.blue, fg = palette.black })

---------- SPELLING ----------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = palette.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = palette.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = palette.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = palette.green })

---------- SYNTAX ----------
vim.api.nvim_set_hl(0, 'Comment', { fg = palette.gray, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'String', { fg = palette.green, italic = true })
vim.api.nvim_set_hl(0, 'Character', { fg = palette.green })
vim.api.nvim_set_hl(0, 'Number', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'Boolean', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'Float', { fg = palette.orange })

vim.api.nvim_set_hl(0, 'Identifier', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'Function', { fg = palette.blue, italic = true })

vim.api.nvim_set_hl(0, 'Statement', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Conditional', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'Repeat', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Label', { fg = palette.red })

vim.api.nvim_set_hl(0, 'Operator', { fg = palette.cyan, italic = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'Exception', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'PreProc', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'Include', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Define', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Macro', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = palette.yellow })

vim.api.nvim_set_hl(0, 'Type', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'Structure', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'Typedef', { fg = palette.purple })

vim.api.nvim_set_hl(0, 'Special', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = palette.orange })
-- vim.api.nvim_set_hl(0, 'Tag', {})
vim.api.nvim_set_hl(0, 'Delimiter', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = palette.gray })
-- vim.api.nvim_set_hl(0, 'Debug', {})

-- vim.api.nvim_set_hl(0, 'Ignore', {})

vim.api.nvim_set_hl(0, 'Error', { fg = palette.error_red })
vim.api.nvim_set_hl(0, 'Todo', { fg = palette.purple })

---------- MISC ----------
-- vim.api.nvim_set_hl(0, 'debugPC', {})
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', {})

-- vim.api.nvim_set_hl(0, 'healthError', {})
-- vim.api.nvim_set_hl(0, 'healthSuccess', {})
-- vim.api.nvim_set_hl(0, 'healthWarning', {})

-- vim.api.nvim_set_hl(0, 'qfLineNr', {})
-- vim.api.nvim_set_hl(0, 'qfFileName', {})

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = palette.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = palette.cyan })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { fg = palette.red, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { fg = palette.yellow, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { fg = palette.blue, undercurl = true })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { fg = palette.cyan, undercurl = true })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = palette.virtual_text_error })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = palette.virtual_text_warn })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = palette.virtual_text_info })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = palette.virtual_text_hint })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = palette.selection })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

-- vim.api.nvim_set_hl(0, 'LspCodeLens', {})
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', {})
-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {})

---------- AERIAL ----------
vim.api.nvim_set_hl(0, 'AerialClass', { fg = palette.purple, bold = true, italic = true })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpDocumentation', { bg = palette.menu, fg = palette.fg })
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { bg = palette.menu, fg = palette.fg })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = palette.blue, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = palette.blue, underline = true })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = palette.gray })

vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link = 'CmpItemKindMethod' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindClass' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = palette.green })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = palette.green })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = palette.yellow })
-- vim.api.nvim_set_hl(0, 'CmpItemKindUnit', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindVColor', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindReference', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindFolder', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindEvent', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindOperator', {})

---------- COPILOT ----------
vim.api.nvim_set_hl(0, 'CopilotSuggestion', { fg = palette.gray, italic = true })

---------- GITSIGNS ----------
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })

---------- INDENTBLANKLINE ----------
vim.api.nvim_set_hl(0, 'IndentLine', { fg = palette.indentline })
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { link = 'IndentLine' })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { link = 'IndentLine' })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { link = 'IndentLine' })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { underline = true })

---------- NEOTREE ----------
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { bg = palette.color_column })
vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = palette.cyan, underline = true })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = palette.purple, bold = true })
vim.api.nvim_set_hl(0, 'NeoTreeFileIcon', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'NeoTreeFileName', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { bg = palette.purple, fg = palette.bg })
vim.api.nvim_set_hl(0, 'NeoTreeFloatTitle', { bg = palette.purple, fg = palette.bg })

vim.api.nvim_set_hl(0, 'NeoTreeGitAdded', { fg = palette.green })
vim.api.nvim_set_hl(0, 'NeoTreeGitConflict', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'NeoTreeGitDeleted', { fg = palette.red })
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'NeoTreeGitIgnored', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = palette.gray })

vim.api.nvim_set_hl(0, 'NeoTreeModified', { fg = palette.red })


---------- NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = palette.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = palette.orange })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = palette.red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = palette.orange })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = palette.yellow, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = palette.blue, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = palette.orange, italic = true })

---------- NVIM-TREE ----------
-- vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { fg = colors.bg })
-- vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = colors.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = colors.purple })
-- vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = colors.purple })
-- vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = colors.gray })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = colors.purple })
-- vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = colors.green })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = colors.purple })
-- vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { link = 'Special' })
-- vim.api.nvim_set_hl(0, 'NvimTreeMarkdownFile', { fg = colors.red })
-- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = colors.gray })

-- vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = colors.red })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { fg = colors.yellow })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitMerge', { fg = colors.cyan })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitRenamed', { fg = colors.yellow })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = colors.green })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = colors.red })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = palette.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = palette.orange })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = palette.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = palette.cyan })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = palette.purple })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = palette.cursorline, fg = palette.purple })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { bg = palette.cursorline, fg = palette.gray })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = palette.gray })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'TelescopeBorder' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = 'TelescopeBorder' })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = palette.green })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TelescopePrompt', { link = 'TelescopeNormal' })

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' })
vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSConstMacro', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' })
vim.api.nvim_set_hl(0, 'TSException', { link = 'Exception' })
vim.api.nvim_set_hl(0, 'TSField', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = palette.purple })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = palette.yellow })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = palette.red, italic = true })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = palette.purple, italic = true })
vim.api.nvim_set_hl(0, 'TSString', { fg = palette.green })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = palette.green, italic = true })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = palette.cyan, italic = true })
vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'Special' })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSTag', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSText', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSStrong', { fg = palette.fg, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = palette.fg, italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { fg = palette.fg, underline = true })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSURI', { fg = palette.blue })
vim.api.nvim_set_hl(0, 'TSMath', { fg = palette.red }) -- Modified
vim.api.nvim_set_hl(0, 'TSTextReference', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'TSEnvironment', { link = 'Macro' })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSNote', { fg = palette.fg })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSType', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = palette.yellow })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = palette.red })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = palette.yellow, italic = true })

---------- TERMINAL COLORS ----------
vim.g.terminal_color_0  = palette.gray
vim.g.terminal_color_1  = palette.red
vim.g.terminal_color_2  = palette.green
vim.g.terminal_color_3  = palette.yellow
vim.g.terminal_color_4  = palette.blue
vim.g.terminal_color_5  = palette.purple
vim.g.terminal_color_6  = palette.cyan
vim.g.terminal_color_7  = palette.fg
vim.g.terminal_color_8  = palette.black
vim.g.terminal_color_9  = palette.red
vim.g.terminal_color_10 = palette.green
vim.g.terminal_color_11 = palette.yellow
vim.g.terminal_color_12 = palette.blue
vim.g.terminal_color_13 = palette.purple
vim.g.terminal_color_14 = palette.cyan
vim.g.terminal_color_15 = palette.fg
