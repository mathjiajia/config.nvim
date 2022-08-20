-- Modified from https://github.com/rebelot/kanagawa.nvim
vim.g.colors_name = 'kanagawa'

local c = require 'themes.color'

local palette_colors = {
	-- Bg Shades
	sumiInk0  = '#16161D',
	sumiInk1b = '#181820',
	sumiInk1  = '#1F1F28',
	sumiInk2  = '#2A2A37',
	sumiInk3  = '#363646',
	sumiInk4  = '#54546D',

	-- Popup and Floats
	waveBlue1 = '#223249',
	waveBlue2 = '#2D4F67',

	-- Diff and Git
	winterGreen  = '#2B3328',
	winterYellow = '#49443C',
	winterRed    = '#43242B',
	winterBlue   = '#252535',
	autumnGreen  = '#76946A',
	autumnRed    = '#C34043',
	autumnYellow = '#DCA561',

	-- Diag
	samuraiRed  = '#E82424',
	roninYellow = '#FF9E3B',
	waveAqua1   = '#6A9589',
	dragonBlue  = '#658594',

	-- Fg and Comments
	oldWhite      = '#C8C093',
	fujiWhite     = '#DCD7BA',
	fujiGray      = '#727169',
	springViolet1 = '#938AA9',

	oniViolet     = '#957FB8',
	crystalBlue   = '#7E9CD8',
	springViolet2 = '#9CABCA',
	springBlue    = '#7FB4CA',
	lightBlue     = '#A3D4D5', -- unused yet
	waveAqua2     = '#7AA89F', -- improve lightness: desaturated greenish Aqua

	-- waveAqua2 = '#68AD99',
	waveAqua4 = '#7AA880',
	-- waveAqua5 = '#6CAF95',
	-- waveAqua3 = '#68AD99',

	springGreen = '#98BB6C',
	boatYellow1 = '#938056',
	boatYellow2 = '#C0A36E',
	carpYellow  = '#E6C384',

	sakuraPink   = '#D27E99',
	waveRed      = '#E46876',
	peachRed     = '#FF5D62',
	surimiOrange = '#FFA066',
	katanaGray   = '#717C7C',
}

local colors = {}
if vim.o.background == 'dark' then
	colors = {
		bg        = palette_colors.sumiInk1,
		bg_dim    = palette_colors.sumiInk1b,
		bg_dark   = palette_colors.sumiInk0,
		bg_light0 = palette_colors.sumiInk2,
		bg_light1 = palette_colors.sumiInk3,
		bg_light2 = palette_colors.sumiInk4,
		bg_light3 = palette_colors.springViolet1,

		bg_menu     = palette_colors.waveBlue1,
		bg_menu_sel = palette_colors.waveBlue2,

		bg_status = palette_colors.sumiInk0,
		bg_visual = palette_colors.waveBlue1,
		bg_search = palette_colors.waveBlue2,

		fg_border  = palette_colors.sumiInk4,
		fg_dark    = palette_colors.oldWhite,
		fg_reverse = palette_colors.waveBlue1,

		fg_comment = palette_colors.fujiGray,
		fg         = palette_colors.fujiWhite,
		fg_menu    = palette_colors.fujiWhite,

		co  = palette_colors.surimiOrange,
		st  = palette_colors.springGreen,
		nu  = palette_colors.sakuraPink,
		id  = palette_colors.carpYellow,
		fn  = palette_colors.crystalBlue,
		sm  = palette_colors.oniViolet,
		kw  = palette_colors.oniViolet,
		op  = palette_colors.boatYellow2,
		pp  = palette_colors.surimiOrange,
		ty  = palette_colors.waveAqua2,
		sp  = palette_colors.springBlue,
		sp2 = palette_colors.waveRed,
		sp3 = palette_colors.peachRed,
		br  = palette_colors.springViolet2,
		re  = palette_colors.boatYellow2,
		dep = palette_colors.katanaGray,

		diag = {
			error   = palette_colors.samuraiRed,
			warning = palette_colors.roninYellow,
			info    = palette_colors.dragonBlue,
			hint    = palette_colors.waveAqua1,
		},

		diff = {
			add    = palette_colors.winterGreen,
			delete = palette_colors.winterRed,
			change = palette_colors.winterBlue,
			text   = palette_colors.winterYellow,
		},

		git = {
			added   = palette_colors.autumnGreen,
			removed = palette_colors.autumnRed,
			changed = palette_colors.autumnYellow,
		},
	}
else
	colors = {
		bg = tostring(c(palette_colors.fujiWhite):lighten(1.1):saturate(1.8)),
		bg_dim = tostring(c(palette_colors.fujiWhite):lighten(1.1):saturate(1.5):lighten(0.95)),
		bg_dark = tostring(c(palette_colors.fujiWhite):lighten(0.9):saturate(0.8)),
		bg_light0 = tostring(c(palette_colors.oldWhite):lighten(1.1):saturate(1.15)),
		bg_light1 = tostring(c(palette_colors.oldWhite):lighten(1.17)),
		bg_light2 = tostring(c(palette_colors.springViolet1):lighten(1):saturate(0.5)),
		bg_light3 = tostring(c(palette_colors.springViolet1):lighten(0.65)),

		bg_menu = tostring(c(palette_colors.waveBlue1):lighten(4):saturate(0.30):hue(1)),
		bg_menu_sel = tostring(c(palette_colors.waveBlue1):lighten(4.25):saturate(0.5):hue(1)),

		bg_status = tostring(c(palette_colors.fujiWhite):lighten(1):saturate(1)),
		bg_visual = tostring(c(palette_colors.waveBlue1):lighten(4):saturate(0.20)),
		bg_search = tostring(c(palette_colors.waveBlue2):lighten(2.8):hue(1.17):saturate(0.5)),

		fg_border = tostring(c(palette_colors.oldWhite):lighten(0.5):saturate(0.7)),
		fg_dark = tostring(c(palette_colors.sumiInk1):lighten(1.5):saturate(0.6)),
		fg_reverse = palette_colors.fujiWhite,

		fg_comment = tostring(c(palette_colors.fujiGray):lighten(0.92)),
		fg = tostring(c(palette_colors.sumiInk1):lighten(2):saturate(0.8)),
		fg_menu = tostring(c(palette_colors.sumiInk4):lighten(0.90)),

		co = tostring(c(palette_colors.surimiOrange):lighten(0.5)),
		st = tostring(c(palette_colors.springGreen):lighten(0.48)),
		nu = tostring(c(palette_colors.sakuraPink):lighten(0.5)),
		id = tostring(c(palette_colors.carpYellow):lighten(0.40):saturate(1.2)),
		fn = tostring(c(palette_colors.crystalBlue):lighten(0.5):saturate(1.1)),
		sm = tostring(c(palette_colors.oniViolet):lighten(0.5):saturate(1)),
		kw = tostring(c(palette_colors.oniViolet):lighten(0.5):saturate(1)),
		op = tostring(c(palette_colors.boatYellow2):lighten(0.65):saturate(1.2)),
		pp = tostring(c(palette_colors.surimiOrange):lighten(0.5)),
		ty = tostring(c(palette_colors.waveAqua2):lighten(0.5):saturate(1.3)),
		sp = tostring(c(palette_colors.springBlue):lighten(0.45):saturate(1.5)),
		sp2 = tostring(c(palette_colors.waveRed):lighten(0.5):saturate(1.1)),
		sp3 = tostring(c(palette_colors.peachRed):lighten(0.68):saturate(0.7):hue(0.98)),
		br = tostring(c(palette_colors.springViolet2):lighten(0.6)),
		re = tostring(c(palette_colors.boatYellow2):lighten(0.65):saturate(1.2)),
		dep = tostring(c(palette_colors.katanaGray):lighten(0.5)),

		diag = {
			error = tostring(c(palette_colors.samuraiRed):lighten(0.7)),
			warning = tostring(c(palette_colors.roninYellow):lighten(0.77):saturate(0.9)),
			info = tostring(c(palette_colors.dragonBlue):lighten(0.7)),
			hint = tostring(c(palette_colors.waveAqua1):lighten(0.7)),
		},

		diff = {
			add = tostring(c(palette_colors.winterGreen):lighten(3.5):saturate(1.1)),
			delete = tostring(c(palette_colors.winterRed):lighten(3.5):saturate(1.3):hue(1.1)),
			change = tostring(c(palette_colors.winterBlue):lighten(4.7):saturate(0.7):hue(0.7)),
			text = tostring(c(palette_colors.winterYellow):lighten(2.99):saturate(5.5)),
		},
		git = {
			added = tostring(c(palette_colors.autumnGreen):lighten(0.75):saturate(1.3)),
			removed = tostring(c(palette_colors.autumnRed):lighten(1):saturate(1)),
			changed = tostring(c(palette_colors.autumnYellow):lighten(0.95):saturate(1.5)),
		},
	}
end

---------- BASICS ----------
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.fg_comment, italic = true })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = colors.bg_light0 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = colors.bg_light3, bold = true })
vim.api.nvim_set_hl(0, 'Cursor', { fg = colors.bg, bg = colors.fg })
vim.api.nvim_set_hl(0, 'lCursor', { link = 'Cursor' })
-- vim.api.nvim_set_hl(0, 'CursorIM', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.bg_light1 })
vim.api.nvim_set_hl(0, 'CursorColumn', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'Directory', { fg = colors.fn })
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = colors.diff.add })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = colors.diff.change })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = colors.git.removed, bg = colors.diff.delete })
vim.api.nvim_set_hl(0, 'DiffText', { bg = colors.diff.text })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = colors.bg })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.diag.error })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.bg_status, bg = colors.bg_status })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.bg_light1, bg = colors.bg_dim })
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.bg_light3, bg = colors.bg_light0 })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = colors.bg_light2 })
-- vim.api.nvim_set_hl(0, 'SignColumnSB', { link = 'SignColumn' })
vim.api.nvim_set_hl(0, 'Substitute', { fg = colors.fg, bg = colors.git.removed })
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.diag.warning, bold = true })
vim.api.nvim_set_hl(0, 'MatchParen', { bold = true }) -- MODIFIED
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = colors.diag.warning, bold = true })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = colors.fg_dark })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', {})
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = colors.diag.info, bg = colors.bg })
vim.api.nvim_set_hl(0, 'NonText', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = colors.fg_dark, bg = colors.bg_dim })
-- vim.api.nvim_set_hl(0, 'NormalSB', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = colors.fg_dark, bg = colors.bg_dark })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = colors.fg_border, bg = colors.bg_dark })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.fg_menu, bg = colors.bg_menu })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.fg_menu, bg = colors.bg_menu_sel })
vim.api.nvim_set_hl(0, 'PmenuSbar', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colors.bg_search })
vim.api.nvim_set_hl(0, 'Question', { link = 'MoreMsg' })
vim.api.nvim_set_hl(0, 'QuickFixLine', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'Search', { fg = colors.fg, bg = colors.bg_search })
vim.api.nvim_set_hl(0, 'CurSearch', { link = 'Search' })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.bg_visual, bg = colors.diag.warning })
vim.api.nvim_set_hl(0, 'SpecialKey', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = colors.diag.error })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = colors.diag.warning })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = colors.diag.warning })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = colors.diag.warning })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg_dark, bg = colors.bg_status })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colors.fg_comment, bg = colors.bg_status })
vim.api.nvim_set_hl(0, 'TabLine', { fg = colors.bg_light3, bg = colors.bg_dark })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = colors.bg })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colors.fg_dark, bg = colors.bg_light1 })
vim.api.nvim_set_hl(0, 'Title', { fg = colors.fn, bold = true })
vim.api.nvim_set_hl(0, 'Visual', { bg = colors.bg_visual })
vim.api.nvim_set_hl(0, 'VisualNOS', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = colors.diag.warning })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'Pmenu' })

---------- SYNTAX ----------
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.co })
vim.api.nvim_set_hl(0, 'String', { fg = colors.st })
vim.api.nvim_set_hl(0, 'Character', { link = 'String' })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.nu })
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.co, bold = true })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })

vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.id })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.fn, italic = true })
vim.api.nvim_set_hl(0, 'Method', { link = 'Function' })
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.sm, bold = true })
-- vim.api.nvim_set_hl(0, 'Conditional', {})
-- vim.api.nvim_set_hl(0, 'Repeat', {})
-- vim.api.nvim_set_hl(0, 'Label', { link = 'Statement' })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.op })
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.kw, italic = true })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.sp2 })

vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.pp })
-- vim.api.nvim_set_hl(0, 'Include', {})
-- vim.api.nvim_set_hl(0, 'Define', {})
-- vim.api.nvim_set_hl(0, 'Macro', {})
-- vim.api.nvim_set_hl(0, 'PreCondit', {})

vim.api.nvim_set_hl(0, 'Type', { fg = colors.ty })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'StorageClass', {})
-- vim.api.nvim_set_hl(0, 'Structure', {})
-- vim.api.nvim_set_hl(0, 'Typedef', {})

vim.api.nvim_set_hl(0, 'Special', { fg = colors.sp })
-- vim.api.nvim_set_hl(0, 'SpecialChar', {})
-- vim.api.nvim_set_hl(0, 'Tag', {})
-- vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.br })
-- vim.api.nvim_set_hl(0, 'SpecialComment', {})
-- vim.api.nvim_set_hl(0, 'Debug', {})

-- vim.api.nvim_set_hl(0, 'Underlined', { fg = colors.sp, underline = true })

vim.api.nvim_set_hl(0, 'Ignore', { link = 'NonText' })

vim.api.nvim_set_hl(0, 'Error', { fg = colors.diag.error })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.fg_reverse, bg = colors.diag.info, bold = true })

---------- MISC ----------
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = colors.sp })
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = colors.diff.delete })

vim.api.nvim_set_hl(0, 'healthError', { fg = colors.diag.error })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = colors.springGreen })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = colors.diag.warning })

vim.api.nvim_set_hl(0, 'qfFileName', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'qfLineNr', { link = 'lineNr' })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = colors.diag.error })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = colors.diag.warning })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = colors.diag.info })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = colors.diag.hint })

vim.api.nvim_set_hl(0, 'DiagnosticError', { link = 'DiagnosticError' })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { link = 'DiagnosticWarn' })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { link = 'DiagnosticInfo' })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { link = 'DiagnosticHint' })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = colors.diag.error })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = colors.diag.warning })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = colors.diag.info })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = colors.diag.hint })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = colors.diff.text })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = colors.fg_comment })
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = colors.diag.warning })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpDocumentation', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'CmpCompletion', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'CmpCompletionSel', { fg = 'NONE', bg = colors.bg_menu_sel })
vim.api.nvim_set_hl(0, 'CmpCompletionBorder', { fg = colors.bg_search, bg = colors.bg_menu })
vim.api.nvim_set_hl(0, 'CmpCompletionThumb', { link = 'PmenuThumb' })
vim.api.nvim_set_hl(0, 'CmpCompletionSbar', { link = 'PmenuSbar' })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = colors.fg_menu })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = colors.fg_comment, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = colors.fn })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' })

vim.api.nvim_set_hl(0, 'CmpItemKindDefault', { fg = colors.dep })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = colors.fg_comment })

vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = colors.fg_dark })

vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'Function' })

vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link = 'TSConstructor' })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link = 'Type' })

vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link = 'Identifier' })

vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = colors.sp })

vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'TSText' })

vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link = 'TSInclude' })

vim.api.nvim_set_hl(0, 'CmpItemKindFile', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = 'Directory' })



vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSParameterReference' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link = 'TSField' })

vim.api.nvim_set_hl(0, 'CmpItemKindValue', { link = 'String' })
-- vim.api.nvim_set_hl(0, 'CmpItemKindUnit', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindEvent', {})
-- vim.api.nvim_set_hl(0, 'CmpItemKindColor', {})

-- vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { link = 'String' })

-- GitSigns
vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = colors.git.added })
vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = colors.git.changed })
vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = colors.git.removed })
vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { bg = colors.diff.delete })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = colors.bg_light3 })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = colors.bg_light3, underline = true })


--------- NVIM-TREE ---------
-- vim.api.nvim_set_hl(0, 'NvimTreeNormal', { link = 'Normal' })
-- vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { link = 'NormalNC' })
-- vim.api.nvim_set_hl(0, 'NvimTreeRootFolder', { fg = colors.id, bold = true })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitDirty', { fg = colors.git.changed })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitNew', { fg = colors.git.added })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitDeleted', { fg = colors.git.removed })
-- vim.api.nvim_set_hl(0, 'NvimTreeSpecialFile', { fg = colors.sp })
-- -- vim.api.nvim_set_hl(0, 'NvimTreeIndentMarker', { fg = colors.sp })
-- vim.api.nvim_set_hl(0, 'NvimTreeImageFile', { fg = colors.sp2 })
-- vim.api.nvim_set_hl(0, 'NvimTreeSymlink', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'NvimTreeFolderName', { link = 'Directory' })
-- vim.api.nvim_set_hl(0, 'NvimTreeExecFile', { fg = colors.springGreen, bold = true })
-- vim.api.nvim_set_hl(0, 'NvimTreeGitStaged', { fg = colors.git.added })
-- vim.api.nvim_set_hl(0, 'NvimTreeOpenedFile', { fg = colors.sp, italic = true })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = colors.fg_border, bg = colors.bg })
vim.api.nvim_set_hl(0, 'TelescopeResultsClass', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TelescopeResultsStruct', { link = 'TSType' })
vim.api.nvim_set_hl(0, 'TelescopeResultsVariable', { link = 'TSVariable' })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
vim.api.nvim_set_hl(0, 'TSAttribute', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'TSBoolean', {})
-- vim.api.nvim_set_hl(0, 'TSCharacter', {})
-- vim.api.nvim_set_hl(0, 'TSComment', {})
-- vim.api.nvim_set_hl(0, 'TSNote', { fg = colors.fg_dark, bg = colors.diag.hint, nocombine = true, bold = true })
vim.api.nvim_set_hl(0, 'TSWarning', { link = 'Todo' })
vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = colors.kw })
-- vim.api.nvim_set_hl(0, 'TSConditional', {})
-- vim.api.nvim_set_hl(0, 'TSConstant', {})
-- vim.api.nvim_set_hl(0, 'TSConstBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSConstMacro', {})
-- vim.api.nvim_set_hl(0, 'TSError', { fg = colors.diag.error })
-- vim.api.nvim_set_hl(0, 'TSException', { link = 'Exception' })
vim.api.nvim_set_hl(0, 'TSException', { fg = colors.sp3, italic = true })
vim.api.nvim_set_hl(0, 'TSField', { link = 'Identifier' })
-- vim.api.nvim_set_hl(0, 'TSField', { link = 'Variable' })
-- vim.api.nvim_set_hl(0, 'TSFloat', {})
-- vim.api.nvim_set_hl(0, 'TSFunction', {})
-- vim.api.nvim_set_hl(0, 'TSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', {})
-- vim.api.nvim_set_hl(0, 'TSInclude', {})
vim.api.nvim_set_hl(0, 'TSKeyword', { link = 'Keyword' })
-- vim.api.nvim_set_hl(0, 'TSKeywordFunction', { link = 'Keyword' })
-- vim.api.nvim_set_hl(0, 'TSKeywordFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = colors.sp3, italic = true })
vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' })
vim.api.nvim_set_hl(0, 'TSMethod', { link = 'Function' })
-- vim.api.nvim_set_hl(0, 'TSNamespace', {})
-- vim.api.nvim_set_hl(0, 'TSNone', {})
-- vim.api.nvim_set_hl(0, 'TSNumber', {})
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = colors.op, bold = true })
vim.api.nvim_set_hl(0, 'TSParameter', { link = 'Identifier' })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = colors.br })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = colors.br })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = colors.br })
-- vim.api.nvim_set_hl(0, 'TSRepeat', {})
-- vim.api.nvim_set_hl(0, 'TSString', {})
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = colors.re })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = colors.re, bold = true })
-- vim.api.nvim_set_hl(0, 'TSSymbol', {})
-- vim.api.nvim_set_hl(0, 'TSType', {})
-- vim.api.nvim_set_hl(0, 'TSTypeBuiltin', {})
vim.api.nvim_set_hl(0, 'TSVariable', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = colors.sp2, italic = true })

-- vim.api.nvim_set_hl(0, 'TSTag', {})
-- vim.api.nvim_set_hl(0, 'TSTagDelimiter', {})
-- vim.api.nvim_set_hl(0, 'TSText', {})
-- vim.api.nvim_set_hl(0, 'TSTextReference', {})
-- vim.api.nvim_set_hl(0, 'TSEmphasis', {})
-- vim.api.nvim_set_hl(0, 'TSUnderline', {})
-- vim.api.nvim_set_hl(0, 'TSStrike', {})
-- vim.api.nvim_set_hl(0, 'TSTitle', {})
-- vim.api.nvim_set_hl(0, 'TSLiteral', {})
-- vim.api.nvim_set_hl(0, 'TSURI', {})

vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = palette_colors.waveAqua4 }) -- ADDED
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = palette_colors.crystalBlue, italic = true }) -- ADDED
vim.api.nvim_set_hl(0, 'TSMath', { fg = palette_colors.sakuraPink }) -- ADDED

---------- LUA ----------
-- vim.api.nvim_set_hl(0, 'luaTSProperty', {})

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = colors.co })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = colors.st })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = colors.sp2 })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = colors.ty })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = colors.id })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = colors.sp })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = colors.nu })

---------- TERMINAL COLORS ----------
vim.g.terminal_color_0  = '#090618' -- black
vim.g.terminal_color_1  = colors.autumnRed -- red
vim.g.terminal_color_2  = colors.autumnGreen -- green
vim.g.terminal_color_3  = colors.boatYellow2 -- yellow
vim.g.terminal_color_4  = colors.crystalBlue -- blue
vim.g.terminal_color_5  = colors.oniViolet -- magenta
vim.g.terminal_color_6  = colors.waveAqua1 -- cyan
vim.g.terminal_color_7  = colors.oldWhite -- white
vim.g.terminal_color_8  = colors.fujiGray -- bright black
vim.g.terminal_color_9  = colors.samuraiRed -- bright red
vim.g.terminal_color_10 = colors.springGreen -- bright green
vim.g.terminal_color_11 = colors.carpYellow -- bright yellow
vim.g.terminal_color_12 = colors.springBlue -- bright blue
vim.g.terminal_color_13 = colors.springViolet1 -- bright magenta
vim.g.terminal_color_14 = colors.waveAqua2 -- bright cyan
vim.g.terminal_color_15 = colors.fujiWhite -- bright white
vim.g.terminal_color_16 = colors.surimiOrange -- extended color 1
vim.g.terminal_color_17 = colors.peachRed -- extended color 2
