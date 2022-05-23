-- Modified from https://github.com/catppuccin/nvim
vim.g.colors_name = 'catppuccin'

local util = require 'utils.colors'
local cp   = {}

if vim.g.theme_style == 'mocha' then
	cp = {
		rosewater = '#F5E0DC',
		flamingo  = '#F2CDCD',
		pink      = '#F5C2E7',
		mauve     = '#CBA6F7',
		red       = '#F38BA8',
		maroon    = '#EBA0AC',
		peach     = '#FAB387',
		yellow    = '#F9E2AF',
		green     = '#A6E3A1',
		teal      = '#94E2D5',
		sky       = '#89DCEB',
		blue      = '#90C1FB',
		sapphire  = '#74C7EC',
		lavender  = '#B4BEFE',

		text     = '#C6D0F5',
		subtext1 = '#B3BCDF',
		subtext0 = '#A1A8C9',
		overlay2 = '#8E95B3',
		overlay1 = '#7B819D',
		overlay0 = '#696D86',
		surface2 = '#565970',
		surface1 = '#43465A',
		surface0 = '#313244',

		base   = '#1E1E2E',
		mantle = '#181825',
		crust  = '#11111B',

		teledark  = '#1A1826',
		teleblack = '#252434',
	}
elseif vim.g.theme_style == 'macchiato' then
	cp = {
		rosewater = '#F4DBD6',
		flamingo  = '#F0C6C6',
		pink      = '#F5BDE6',
		mauve     = '#C6A0F6',
		red       = '#ED8796',
		maroon    = '#EE99A0',
		peach     = '#F5A97F',
		yellow    = '#EED49F',
		green     = '#A6DA95',
		teal      = '#8BD5CA',
		sky       = '#91D7E3',
		blue      = '#86AEF8',
		sapphire  = '#7DC4E4',
		lavender  = '#B9BEF8',
		text      = '#C5CFF5',

		subtext1 = '#B3BCE0',
		subtext0 = '#A1AACB',
		overlay2 = '#8F97B7',
		overlay1 = '#7D84A2',
		overlay0 = '#6C728D',
		surface2 = '#5A5F78',
		surface1 = '#484C64',
		surface0 = '#363A4F',

		base   = '#24273A',
		mantle = '#1E2030',
		crust  = '#181926',

		teledark  = '#1E2134',
		teleblack = '#2A2D40',
	}
elseif vim.g.theme_style == 'latte' then
	cp = {
		rosewater = '#DE9584',
		flamingo  = '#DD7878',
		pink      = '#EC83D0',
		mauve     = '#8839EF',
		red       = '#D20F39',
		maroon    = '#E64553',
		peach     = '#FE640B',
		yellow    = '#E49320',
		green     = '#40A02B',
		teal      = '#179299',
		sky       = '#04A5E5',
		blue      = '#2A6EF5',
		sapphire  = '#209FB5',
		lavender  = '#7287FD',
		text      = '#4C4F69',

		subtext1 = '#5C5F77',
		subtext0 = '#6C6F85',
		overlay2 = '#7C7F93',
		overlay1 = '#8C8FA1',
		overlay0 = '#9CA0B0',
		surface2 = '#ACB0BE',
		surface1 = '#BCC0CC',
		surface0 = '#CCD0DA',

		base   = '#EFF1F5',
		mantle = '#E6E9EF',
		crust  = '#DCE0E8',

		teledark  = '#FFFFFF',
		teleblack = '#F6F6F6',
	}
else -- frappe
	cp = {
		rosewater = '#F2D5CF',
		flamingo  = '#EEBEBE',
		pink      = '#F4B8E4',
		mauve     = '#CA9EE6',
		red       = '#E78284',
		maroon    = '#EA999C',
		peach     = '#EF9F76',
		yellow    = '#E5C890',
		green     = '#A6D189',
		teal      = '#81C8BE',
		sky       = '#99D1DB',
		blue      = '#8CAAEE',
		sapphire  = '#85C1DC',
		lavender  = '#BFB7E4',
		text      = '#C6CEEF',

		subtext1 = '#B5BDDC',
		subtext0 = '#A5ACC9',
		overlay2 = '#949BB7',
		overlay1 = '#838AA4',
		overlay0 = '#737891',
		surface2 = '#62677E',
		surface1 = '#51566C',
		surface0 = '#414559',

		base = '#303446',
		mantle = '#292C3C',
		crust = '#232634',

		teledark  = '#FFFFFF',
		teleblack = '#F6F6F6',
	}
end

local function vary_color(palettes, default)
	local flvr = vim.g.catppuccin_flavour

	if palettes[flvr] ~= nil then
		return palettes[flvr]
	end
	return default
end

cp.cursorline = vary_color({ latte = cp.mantle }, util.darken(cp.surface0, 0.64, cp.base))
cp.linenr = vary_color({ latte = cp.crust }, cp.surface1)

local error = cp.red
local warn  = cp.yellow
local info  = cp.sky
local hint  = cp.teal

local darkening_percentage = 0.095

local diag_error = util.darken(error, darkening_percentage, cp.base)
local diag_warn  = util.darken(warn, darkening_percentage, cp.base)
local diag_info  = util.darken(info, darkening_percentage, cp.base)
local diag_hint  = util.darken(hint, darkening_percentage, cp.base)

local operators  = cp.sky
local math_logic = cp.peach

---------- BASIC ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.surface0 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.overlay1 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = cp.base, bg = cp.text })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.mantle })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.cursorline })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.lavender })
vim.api.nvim_set_hl(0, 'Directory', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = cp.base })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.overlay0, bg = cp.base })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.blue, bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.surface1, bg = cp.pink })
-- vim.api.nvim_set_hl(0, 'lCursor', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.linenr })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = cp.text, bold = true })
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
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = cp.text, bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'Question', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = cp.pink, bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.surface1, bg = cp.base })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.text })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.text, bg = cp.surface0 }) -- FIXED
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.surface1, bg = cp.mantle }) -- FIXED
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.pink, bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.mantle, bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = cp.base }) -- FIXED
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.green, bg = cp.surface0 }) -- FIXED
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.surface1, bold = true })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.surface1 })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = cp.crust })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = cp.green, bg = cp.base })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = cp.yellow, bg = cp.base })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = cp.red, bg = cp.base })
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.blue, bg = cp.base })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.green })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.surface2, italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Constant', { fg = cp.peach })
-- vim.api.nvim_set_hl(0, 'Debug', {})
-- vim.api.nvim_set_hl(0, 'Define', {})
-- vim.api.nvim_set_hl(0, 'Delimiter', {})
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'Exception', {})
vim.api.nvim_set_hl(0, 'Float', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.flamingo })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
vim.api.nvim_set_hl(0, 'Include', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.peach })
-- vim.api.nvim_set_hl(0, 'Macro', {})
vim.api.nvim_set_hl(0, 'Number', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.sky })
-- vim.api.nvim_set_hl(0, 'PreCondit', {})
vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Special', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'SpecialChar', {})
vim.api.nvim_set_hl(0, 'Statement', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'String', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'Tag', {})
vim.api.nvim_set_hl(0, 'Title', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.base, bg = cp.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = cp.crust })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = cp.overlay0, bg = cp.base })

vim.api.nvim_set_hl(0, 'healthError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = cp.yellow })

vim.api.nvim_set_hl(0, 'qfLineNr', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'qfFileName', { fg = cp.blue })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = diag_error, fg = error, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg = diag_warn, fg = warn, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg = diag_info, fg = info, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg = diag_hint, fg = hint, underline = true })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = error })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = warn })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = info })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = hint })

------ GIT ------
vim.api.nvim_set_hl(0, 'diffAdded', { fg = cp.green })
vim.api.nvim_set_hl(0, 'diffRemoved', { fg = cp.red })
vim.api.nvim_set_hl(0, 'diffChanged', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'diffOldFile', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'diffNewFile', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'diffFile', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'diffLine', { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'diffIndexLine', { fg = cp.pink })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = cp.surface1 })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = cp.surface1 })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = cp.peach })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.overlay2 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.overlay0, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.text, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.text, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.text })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.flamingo })

------ GITSIGNS ------
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = cp.green, bg = cp.base })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = cp.yellow, bg = cp.base })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = cp.red, bg = cp.base })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = cp.surface0 })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = cp.text })

--------- NEOTREE ---------
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = cp.overlay0 })
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = cp.text, bg = cp.base }) -- FIXED
vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = cp.pink, bold = true })
vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'NeoTreeUntracked', { fg = cp.blue })

---------- NVIM NOTIFY ----------
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

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.green })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = cp.text, bg = cp.teleblack })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = cp.text, bg = cp.surface0, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = cp.red, bg = cp.teleblack })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = cp.fg, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.teledark, bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = cp.teleblack, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.base, bg = cp.green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.base, bg = cp.red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.teledark, bg = cp.blue })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
-- vim.api.nvim_set_hl(0, 'TSAttribute', {})
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = math_logic })
-- vim.api.nvim_set_hl(0, 'TSCharacter', {})
-- vim.api.nvim_set_hl(0, 'TSComment', {})
vim.api.nvim_set_hl(0, 'TSConditional', { fg = cp.mauve, italic = true })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.sapphire })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = cp.base, bg = cp.red })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = cp.maroon, italic = true })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green }) -- ADDED
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.flamingo, italic = true }) -- ADDED
-- vim.api.nvim_set_hl(0, 'TSError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSException', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = math_logic })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = cp.sapphire })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.teal, italic = true })
vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.base, bg = cp.blue })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = math_logic })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = operators })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.maroon, italic = true })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.teal })
-- vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.overlay2 })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = cp.overlay2 })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.gray, strikethrough = true })
vim.api.nvim_set_hl(0, 'TSString', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.peach })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', {})
vim.api.nvim_set_hl(0, 'TSStrong', { fg = cp.maroon, bold = true })
-- vim.api.nvim_set_hl(0, 'TSSymbol', {})
vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.teal, italic = true })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'TSText', { fg = cp.text })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.lavender, bold = true })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSType', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.rosewater, italic = true, underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.text })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.base, bg = cp.yellow })

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

------ LUA ------
vim.api.nvim_set_hl(0, 'luaTSConstructor', { fg = cp.lavender })

------ MARKDOWN ------
-- vim.api.nvim_set_hl(0, 'mkdHeading', { fg = cp.peach, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdCode', { fg = cp.text, bg = cp.overlay0 })
-- vim.api.nvim_set_hl(0, 'mkdCodeDelimiter', { fg = cp.text, bg = cp.base })
-- vim.api.nvim_set_hl(0, 'mkdCodeStart', { fg = cp.peach, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdLink', { fg = cp.blue, underline = true })

-- vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = cp.peach, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownCode', { fg = cp.flamingo })
-- vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = cp.flamingo })
-- vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = cp.blue, underline = true })
-- vim.api.nvim_set_hl(0, 'markdownH1', { fg = cp.lavender })
-- vim.api.nvim_set_hl(0, 'markdownH2', { fg = cp.mauve })
-- vim.api.nvim_set_hl(0, 'markdownH3', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'markdownH4', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'markdownH5', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'markdownH6', { fg = cp.teal })

------ TSX ------
-- vim.api.nvim_set_hl(0, 'tsxTSConstructor', { fg = cp.lavender })
-- vim.api.nvim_set_hl(0, 'tsxTSTagAttribute', { fg = cp.mauve })

------ TYPESCRIPT ------
-- vim.api.nvim_set_hl(0, 'typescriptTSConstructor', { fg = cp.lavender })

------ YAML ------
-- vim.api.nvim_set_hl(0, 'yamlTSField', { fg = cp.blue })

------ TERMINAL ------
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
