-- Modified from https://github.com/catppuccin/nvim
vim.g.colors_name = 'catppuccin'

local util = require 'themes.util'

local cp = {
    rosewater = '#F5E0DC',
    flamingo  = '#F2CDCD',
    pink      = '#F5C2E7',
    mauve     = '#DDB6F2',
    red       = '#F28FAD',
    maroon    = '#E8A2AF',
    peach     = '#F8BD96',
    yellow    = '#FAE3B0',
    green     = '#ABE9B3',
    teal      = '#B5E8E0',
    sky       = '#89DCEB',
    sapphire  = '#74C7EC',
    blue      = '#96CDFB',
    lavender  = '#CDCFFF',

    text     = '#D9E0EE',
    subtext1 = '#BAC2DE',
    subtext0 = '#A6ADC8',
    overlay2 = '#C3BAC6',
    overlay1 = '#988BA2',
    overlay0 = '#6E6C7E',
    surface2 = '#575268',
    surface1 = '#45475A',
    surface0 = '#302D41',

    base   = '#1E1E2E',
    mantle = '#1A1826',
    crust  = '#161320',
}

cp.linenr = cp.overlay1

local error = cp.red
local warn  = cp.yellow
local info  = cp.sky
local hint  = cp.rosewater

local operators  = cp.sky
local math_logic = cp.peach

---------- BASIC ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.surface0 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.overlay1 })
vim.api.nvim_set_hl(0, 'CurSearch', { fg = cp.mantle, bg = cp.red })
vim.api.nvim_set_hl(0, 'Cursor', { fg = cp.base, bg = cp.text })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.mantle })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = util.darken(cp.surface0, 0.64, cp.base) })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Directory', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = cp.base })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.overlay0, bg = cp.base })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.blue, bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.mantle, bg = cp.pink })
vim.api.nvim_set_hl(0, 'lCursor', { fg = cp.base, bg = cp.text })
vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.linenr })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = cp.surface0, bold = true })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = cp.flamingo, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = cp.text })
vim.api.nvim_set_hl(0, 'MsgSeparator', {})
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'Normal', { fg = cp.text, bg = cp.base })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = cp.text, bg = cp.mantle })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = cp.text, bg = cp.base })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.overlay2, bg = cp.surface0 })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = cp.surface1, bold = true }) -- remove fg
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'Question', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = cp.pink, bg = cp.surface2, bold = true })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.surface1, bg = cp.base })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.text })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.text, bg = cp.mantle })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.surface1, bg = cp.mantle })
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.pink, bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.mantle, bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = cp.black })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.green, bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.surface1 })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'WinBar', { fg = cp.rosewater })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = util.darken(cp.green, 0.18, cp.base) })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = util.darken(cp.blue, 0.07, cp.base) })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = util.darken(cp.red, 0.18, cp.base) })
vim.api.nvim_set_hl(0, 'DiffText', { bg = util.darken(cp.blue, 0.18, cp.base) })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.green })

------ SYNTAX ------
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.overlay1, italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Constant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Debug', { link = 'Special' })
vim.api.nvim_set_hl(0, 'Define', { link = 'PreProc' })
-- vim.api.nvim_set_hl(0, 'Delimiter', {})
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'Exception', {})
vim.api.nvim_set_hl(0, 'Float', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.blue, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.flamingo })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
vim.api.nvim_set_hl(0, 'Include', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.pink, italic = true })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Macro', { link = 'PreProc' })
vim.api.nvim_set_hl(0, 'Number', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'PreCondit', { link = 'PreProc' })
vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Special', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'SpecialChar', { link = 'Special' })
vim.api.nvim_set_hl(0, 'SpecialComment', { link = 'Special' })
vim.api.nvim_set_hl(0, 'Statement', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'String', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Tag', { link = 'Special' })
vim.api.nvim_set_hl(0, 'Title', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.base, bg = cp.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = cp.crust })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = cp.overlay0, bg = cp.base })

vim.api.nvim_set_hl(0, 'healthError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = cp.yellow })

vim.api.nvim_set_hl(0, 'qfLineNr', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'qfFileName', { fg = cp.blue })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = error, italic = true })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = warn, italic = true })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = info, italic = true })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = hint, italic = true })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = error })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = warn })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = info })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = hint })

vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', { fg = error, italic = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', { fg = warn, italic = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', { fg = info, italic = true })
vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', { fg = hint, italic = true })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = cp.surface1 })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = cp.peach })

----------- AERIAL -----------
vim.api.nvim_set_hl(0, 'AerialLine', { fg = cp.yellow, bg = cp.none })
vim.api.nvim_set_hl(0, 'AerialGuide', { fg = cp.overlay2 })
vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { link = 'TSBoolean' })
vim.api.nvim_set_hl(0, 'AerialClassIcon', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'AerialConstantIcon', { link = 'TSConstant' })
vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { link = 'TSConstructor' })
vim.api.nvim_set_hl(0, 'AerialFieldIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { link = 'TSFunction' })
vim.api.nvim_set_hl(0, 'AerialMethodIcon', { link = 'TSMethod' })
vim.api.nvim_set_hl(0, 'AerialNamespaceIcon', { link = 'TSNamespace' })
vim.api.nvim_set_hl(0, 'AerialNumberIcon', { link = 'TSNumber' })
vim.api.nvim_set_hl(0, 'AerialOperatorIcon', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'AerialTypeParameterIcon', { link = 'TSParameter' })
vim.api.nvim_set_hl(0, 'AerialPropertyIcon', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'AerialStringIcon', { link = 'TSString' })
vim.api.nvim_set_hl(0, 'AerialVariableIcon', { link = 'TSConstant' })
vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialEnumIcon', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'AerialFileIcon', { link = 'TSURI' })
vim.api.nvim_set_hl(0, 'AerialModuleIcon', { link = 'TSNamespace' })
vim.api.nvim_set_hl(0, 'AerialPackageIcon', { link = 'TSNamespace' })
vim.api.nvim_set_hl(0, 'AerialInterfaceIcon', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'AerialStructIcon', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'AerialEventIcon', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'AerialArrayIcon', { link = 'TSConstant' })
vim.api.nvim_set_hl(0, 'AerialObjectIcon', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'AerialKeyIcon', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'AerialNullIcon', { link = 'TSType' })

----------- BUFFERLINE -----------
-- -- buffers
-- vim.api.nvim_set_hl(0, 'BufferLineBackground', { bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineBackcrust', { fg = cp.text, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineBufferVisible', { fg = cp.surface1, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { fg = cp.text, bg = cp.base, bold = true, italic = true })
-- -- tabs
-- vim.api.nvim_set_hl(0, 'BufferLineTab', { fg = cp.surface1, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineTabSelected', { fg = cp.sky, bg = cp.base })
-- vim.api.nvim_set_hl(0, 'BufferLineTabClose', { fg = cp.red, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { fg = cp.peach, bg = cp.base })
-- -- separators
-- vim.api.nvim_set_hl(0, 'BufferLineSeparator', { fg = cp.crust, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { fg = cp.crust, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { fg = cp.crust, bg = cp.base })
-- -- close buttons
-- vim.api.nvim_set_hl(0, 'BufferLineCloseButton', { fg = cp.surface1, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible', { fg = cp.surface1, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected', { fg = cp.red, bg = cp.base })
-- -- Empty fill
-- vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = cp.crust })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.overlay2 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.overlay0, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.text })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.text, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.text, bold = true })

-- kind support
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.blue })

------ GITSIGNS ------
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = cp.green, bg = cp.base })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = cp.yellow, bg = cp.base })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = cp.red, bg = cp.base })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = cp.surface0 })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = cp.text })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = cp.text, underline = true })

--------- LEAP ---------
vim.api.nvim_set_hl(0, 'LeapMatch', { fg = util.brighten(cp.green, 0.3), underline = true, nocombine = true })
vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { fg = cp.base, bg = util.brighten(cp.green, 0.3), nocombine = true })
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { fg = cp.base, bg = util.brighten(cp.sky, 0.3), nocombine = true })

-------- NEOTREE --------
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = cp.text, bg = cp.mantle })
vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = cp.pink, bold = true })
vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NeoTreeUntracked', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { fg = cp.pink })

---------- NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = cp.rosewater })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = cp.rosewater })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.peach, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.rosewater, italic = true })

--------- NVIM-TREE ---------
-- vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeFolderIcon', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg = cp.text, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFolderName', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeEmptyFolderName', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = cp.overlay0 })
-- vim.api.nvim_set_hl(0, 'NvimTreeVertSplit', { fg = cp.base, bg = cp.base })
-- vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = 'NONE', bold = true })
-- vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'NvimTreeStatuslineNc', { fg = cp.mantle, bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = cp.flamingo })
-- vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { fg = cp.text })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = cp.pink })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red, bg = cp.base })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.teal, bg = cp.base })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.yellow, bg = cp.base })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.blue, bg = cp.base })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.pink, bg = cp.base })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.flamingo, bg = cp.base })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.green, bg = cp.base })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = cp.text, bg = cp.surface0, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = cp.crust })
-- vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = cp.crust })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = cp.mantle })
-- vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = cp.crust })
-- vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = cp.crust, fg = cp.crust })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = cp.mantle, fg = cp.crust })
-- vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = cp.crust, fg = cp.crust })
-- vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.crust })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.text })
-- vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.crust })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
-- vim.api.nvim_set_hl(0, 'TSAttribute', {})
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = math_logic, bold = true, italic = true })
-- vim.api.nvim_set_hl(0, 'TSCharacter', {})
-- vim.api.nvim_set_hl(0, 'TSComment', {})
vim.api.nvim_set_hl(0, 'TSConditional', { fg = cp.mauve, italic = true })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.lavender })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.lavender })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = cp.base, bg = cp.red })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = cp.maroon, italic = true })
-- vim.api.nvim_set_hl(0, 'TSError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSException', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.rosewater })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = math_logic })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = cp.blue, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.mauve, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.maroon })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = cp.sapphire })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.teal, italic = true })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.rosewater, italic = true })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.base, bg = cp.blue })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = math_logic })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = operators, bold = true })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.rosewater, italic = true })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.overlay2 })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.maroon })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = cp.mauve, bold = true })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.gray, strikethrough = true })
vim.api.nvim_set_hl(0, 'TSString', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.peach })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', {})
vim.api.nvim_set_hl(0, 'TSStrong', { fg = cp.maroon, bold = true })
-- vim.api.nvim_set_hl(0, 'TSSymbol', {})
vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.mauve, italic = true })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.maroon })
vim.api.nvim_set_hl(0, 'TSText', { fg = cp.text })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.lavender, bold = true })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSType', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.rosewater, italic = true, underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.text })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.base, bg = cp.yellow })

-- ADDED
vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.flamingo, italic = true })

--- LANGUAGE ---
------ BASH ------
-- vim.api.nvim_set_hl(0, 'bashTSFuncBuiltin', { fg = cp.red, italic = true })
-- vim.api.nvim_set_hl(0, 'bashTSParameter', { fg = cp.yellow, italic = true })

------ CPP ------
-- vim.api.nvim_set_hl(0, 'cppTSProperty', { fg = cp.text })

------ HTML ------
-- vim.api.nvim_set_hl(0, 'htmlH1', { fg = cp.pink, bold = true })
-- vim.api.nvim_set_hl(0, 'htmlH2', { fg = cp.blue, bold = true })

------ JAVA ------
-- vim.api.nvim_set_hl(0, 'javaTSField', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'javaTSType', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'javaTSConstant', { fg = cp.teal })

------ JSON ------
-- vim.api.nvim_set_hl(0, 'jsonTSLabel', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'javaTSConstant', { fg = cp.teal })

------ LUA ------
vim.api.nvim_set_hl(0, 'luaTSConstructor', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'luaTSField', { fg = cp.lavender })

------ MARKDOWN ------
-- vim.api.nvim_set_hl(0, 'mkdHeading', { fg = cp.peach, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdCode', { fg = cp.text, bg = cp.overlay0 })
-- vim.api.nvim_set_hl(0, 'mkdCodeDelimiter', { fg = cp.text, bg = cp.base })
-- vim.api.nvim_set_hl(0, 'mkdCodeStart', { fg = cp.peach, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdLink', { fg = cp.blue, underline = true })

------ TSX ------
-- vim.api.nvim_set_hl(0, 'tsxTSConstructor', { fg = cp.lavender })
-- vim.api.nvim_set_hl(0, 'tsxTSTagAttribute', { fg = cp.mauve })

------ TYPESCRIPT ------
-- vim.api.nvim_set_hl(0, 'typescriptTSConstructor', { fg = cp.lavender })
-- vim.api.nvim_set_hl(0, 'typescriptTSProperty', { fg = cp.lavender, italic = true })

------ YAML ------
-- vim.api.nvim_set_hl(0, 'yamlTSField', { fg = cp.blue })

---------- TERMINAL COLORS ----------
vim.g.terminal_color_0 = cp.overlay0
vim.g.terminal_color_8 = cp.overlay1

vim.g.terminal_color_1 = cp.red
vim.g.terminal_color_9 = cp.red

vim.g.terminal_color_2  = cp.green
vim.g.terminal_color_10 = cp.green

vim.g.terminal_color_3  = cp.yellow
vim.g.terminal_color_11 = cp.yellow

vim.g.terminal_color_4  = cp.blue
vim.g.terminal_color_12 = cp.blue

vim.g.terminal_color_5  = cp.pink
vim.g.terminal_color_13 = cp.pink

vim.g.terminal_color_6  = cp.sky
vim.g.terminal_color_14 = cp.sky

vim.g.terminal_color_7  = cp.text
vim.g.terminal_color_15 = cp.text
