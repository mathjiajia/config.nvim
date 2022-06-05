-- Modified from https: //github.com/rebelot/kanagawa.nvim
vim.g.colors_name = 'kanagawa'

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

	-- waveAqua2 = "#68AD99",
	waveAqua4 = '#7AA880',
	-- waveAqua5 = "#6CAF95",
	-- waveAqua3 = "#68AD99",

	springGreen = '#98BB6C',
	boatYellow1 = '#938056',
	boatYellow2 = '#C0A36E',
	carpYellow  = '#E6C384',

	sakuraPink   = '#D27E99',
	waveRed      = '#E46876',
	peachRed     = '#FF5D62',
	surimiOrange = '#FFA066',
	katanaGray   = '#717C7C',

	teledark  = '#191922',
	teleblack = '#25252E',
}

local colors = {
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

------ BASICS ------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = colors.bg_light0 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = colors.bg_light3, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'Cursor', { fg = colors.bg, bg = colors.fg })
vim.api.nvim_set_hl(0, 'CursorColumn', { link = 'CursorLine' })
-- vim.api.nvim_set_hl(0, 'CursorIM', {})
vim.api.nvim_set_hl(0, 'CursorLine', { bg = colors.bg_light0 }) -- FIXED
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = colors.diag.warning, bg = 'NONE', bold = true })
vim.api.nvim_set_hl(0, 'CurSearch', { link = 'Search' })
vim.api.nvim_set_hl(0, 'Directory', { fg = colors.fn })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = colors.bg })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = colors.diag.error, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = colors.fg_border }) -- FIXED
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = colors.bg_light2, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Folded', { fg = colors.bg_light3, bg = colors.bg_light0 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = colors.bg_visual, bg = colors.diag.warning })
-- vim.api.nvim_set_hl(0, 'lCursor', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = colors.bg_light1, bold = true }) -- FIXED
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = colors.diag.warning, bold = true, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = colors.diag.info, bg = colors.bg })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = colors.fg_dark, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'NonText', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = colors.fg, bg = colors.bg_dark })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = colors.fg, bg = colors.bg })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = colors.fg_menu, bg = colors.bg_menu })
vim.api.nvim_set_hl(0, 'PmenuSbar', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = colors.fg_menu, bg = colors.bg_menu_sel })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = colors.bg_search })
vim.api.nvim_set_hl(0, 'Question', { fg = colors.diag.info }) -- FIXED
vim.api.nvim_set_hl(0, 'QuickFixLine', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'Search', { fg = colors.fg, bg = colors.bg_search })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = colors.bg_light2, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'SpecialKey', { link = 'NonText' })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = colors.fg_dark, bg = colors.bg_light1 }) -- FIXED
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = colors.fg_comment, bg = colors.bg_status })
vim.api.nvim_set_hl(0, 'Substitute', { fg = colors.fg, bg = colors.git.removed })
vim.api.nvim_set_hl(0, 'TabLine', { fg = colors.bg_light3, bg = colors.bg_dark })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = colors.bg })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = colors.fg_dark, bg = colors.bg_light1 })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', { fg = colors.bg_status, bg = colors.bg_status })
vim.api.nvim_set_hl(0, 'Visual', { bg = colors.bg_visual })
vim.api.nvim_set_hl(0, 'VisualNOS', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = colors.diag.warning, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = colors.bg_light1, bg = colors.bg })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = 'NONE', bg = colors.diff.add })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = 'NONE', bg = colors.diff.change })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = colors.git.removed, bg = colors.diff.delete })
vim.api.nvim_set_hl(0, 'DiffText', { fg = 'NONE', bg = colors.diff.text })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = colors.diag.error })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = colors.diag.warning })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = colors.diag.warning })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = colors.diag.warning })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Boolean', { fg = colors.co, bold = true })
vim.api.nvim_set_hl(0, 'Character', { link = 'String' })
vim.api.nvim_set_hl(0, 'Comment', { fg = colors.fg_comment, italic = true })
-- vim.api.nvim_set_hl(0, 'Conditional', {})
vim.api.nvim_set_hl(0, 'Constant', { fg = colors.co })
-- vim.api.nvim_set_hl(0, 'Debug', {})
-- vim.api.nvim_set_hl(0, 'Define', {})
-- vim.api.nvim_set_hl(0, 'Delimiter', { fg = colors.br })
vim.api.nvim_set_hl(0, 'Error', { fg = colors.diag.error, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'Exception', { fg = colors.sp2 })
vim.api.nvim_set_hl(0, 'Float', { link = 'Number' })
vim.api.nvim_set_hl(0, 'Function', { fg = colors.fn, italic = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = colors.id })
vim.api.nvim_set_hl(0, 'Ignore', { link = 'NonText' })
-- vim.api.nvim_set_hl(0, 'Include', {})
vim.api.nvim_set_hl(0, 'Keyword', { fg = colors.kw, italic = true })
-- vim.api.nvim_set_hl(0, 'Label', { link = 'Statement' })
-- vim.api.nvim_set_hl(0, 'Macro', {})
vim.api.nvim_set_hl(0, 'Method', { link = 'Function' })
vim.api.nvim_set_hl(0, 'Number', { fg = colors.nu })
vim.api.nvim_set_hl(0, 'Operator', { fg = colors.op })
-- vim.api.nvim_set_hl(0, 'PreCondit', {})
vim.api.nvim_set_hl(0, 'PreProc', { fg = colors.pp })
-- vim.api.nvim_set_hl(0, 'Repeat', {})
vim.api.nvim_set_hl(0, 'Special', { fg = colors.sp })
-- vim.api.nvim_set_hl(0, 'SpecialChar', {})
-- vim.api.nvim_set_hl(0, 'SpecialComment', {})
vim.api.nvim_set_hl(0, 'Statement', { fg = colors.sm }) -- FIXED
-- vim.api.nvim_set_hl(0, 'StorageClass', {})
vim.api.nvim_set_hl(0, 'String', { fg = colors.st })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'Structure', {})
-- vim.api.nvim_set_hl(0, 'Tag', {})
vim.api.nvim_set_hl(0, 'Title', { fg = colors.fn, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = colors.fg_reverse, bg = colors.diag.info, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = colors.ty })
-- vim.api.nvim_set_hl(0, 'Typedef', {})
vim.api.nvim_set_hl(0, 'Underlined', { fg = colors.sp, underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = colors.sp })
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = colors.diff.delete })

-- vim.api.nvim_set_hl(0, 'healthError', { fg = colors.diag.error })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = colors.springGreen })
-- vim.api.nvim_set_hl(0, 'healthWarning', { fg = colors.diag.warning })

vim.api.nvim_set_hl(0, 'qfFileName', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'qfLineNr', { link = 'lineNr' })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = colors.diag.error })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = colors.diag.warning })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = colors.diag.info })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = colors.diag.hint })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { undercurl = true, sp = colors.diag.error })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { undercurl = true, sp = colors.diag.warning })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { undercurl = true, sp = colors.diag.info })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { undercurl = true, sp = colors.diag.hint })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = colors.diff.text })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = colors.fg_comment })
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', {})
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = colors.diag.warning })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpDocumentation', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'CmpCompletion', { link = 'Pmenu' })
vim.api.nvim_set_hl(0, 'CmpCompletionSel', { link = 'PmenuSel' })
vim.api.nvim_set_hl(0, 'CmpCompletionBorder', { fg = colors.bg_search, bg = colors.bg_menu })
vim.api.nvim_set_hl(0, 'CmpCompletionThumb', { link = 'PmenuThumb' })
vim.api.nvim_set_hl(0, 'CmpCompletionSbar', { link = 'PmenuSbar' })

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = colors.fg_menu, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = colors.fg_comment, bg = 'NONE', strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = colors.fn, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' })
vim.api.nvim_set_hl(0, 'CmpItemKindDefault', { fg = colors.dep, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = colors.fg_comment, bg = 'NONE' })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link = 'TSConstructor' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { link = 'Function' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { link = 'TSKeyword' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'Function' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { link = 'TSInclude' })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSParameterReference' })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = colors.sp, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'TSText' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { link = 'String' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = colors.fg_dark, bg = 'NONE' })

-- GitSigns
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'diffAdded' })
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'diffChanged' })
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'diffDeleted' })
-- vim.api.nvim_set_hl(0, 'GitSignsDeleteLn', { fg = 'NONE', bg = colors.diff.delete })

-------- INDENT BLANKLINES --------
-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = colors.bg_light2 })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = colors.bg_light2 })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = colors.bg_light2 })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = colors.bg_light3 })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = colors.bg_light3, underdash = true })

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
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { link = 'DiagnosticError' })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { link = 'DiagnosticWarning' })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { link = 'DiagnosticInfo' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = colors.co })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { link = 'DiagnosticHint' })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'NotifyERRORBorder' })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'NotifyWARNBorder' })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'NotifyINFOBorder' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = colors.diag.error, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = colors.diag.warning, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = colors.diag.info, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = colors.co, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = colors.diag.hint, italic = true })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = colors.co })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = colors.st })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = colors.sp2 })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = colors.ty })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = colors.id })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = colors.sp })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = colors.nu })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = palette_colors.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = colors.fg, bg = palette_colors.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = colors.sp3, bg = palette_colors.teleblack })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = colors.fg, bg = palette_colors.teleblack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = palette_colors.teledark, bg = palette_colors.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = palette_colors.teleblack, bg = palette_colors.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = colors.bg, bg = colors.st })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = colors.bg, bg = colors.sp2 })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = palette_colors.teledark, bg = colors.fn })

---------- TREESITTER ----------

-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
vim.api.nvim_set_hl(0, 'TSAttribute', { link = 'Constant' })
-- vim.api.nvim_set_hl(0, 'TSBoolean', {})
-- vim.api.nvim_set_hl(0, 'TSCharacter', {})
-- vim.api.nvim_set_hl(0, 'TSComment', {})
-- vim.api.nvim_set_hl(0, 'TSConditional', {})
-- vim.api.nvim_set_hl(0, 'TSConstant', {})
-- vim.api.nvim_set_hl(0, 'TSConstBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSConstMacro', {})
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = colors.kw })
vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = palette_colors.waveAqua4 }) -- ADDED
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = palette_colors.crystalBlue, italic = true }) -- ADDED
-- vim.api.nvim_set_hl(0, 'TSError', { fg = colors.diag.error })
vim.api.nvim_set_hl(0, 'TSException', { fg = colors.sp3, italic = true })
-- vim.api.nvim_set_hl(0, 'TSException', {})
vim.api.nvim_set_hl(0, 'TSField', { link = 'Identifier' })
-- vim.api.nvim_set_hl(0, 'TSField', {})
-- vim.api.nvim_set_hl(0, 'TSFloat', {})
-- vim.api.nvim_set_hl(0, 'TSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', {})
-- vim.api.nvim_set_hl(0, 'TSFunction', {})
-- vim.api.nvim_set_hl(0, 'TSInclude', {})
vim.api.nvim_set_hl(0, 'TSKeyword', { link = 'Keyword' })
-- vim.api.nvim_set_hl(0, 'TSKeywordFunction', {})
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = colors.op, bold = true })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = colors.sp3, italic = true })
vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' })
-- vim.api.nvim_set_hl(0, 'TSLiteral', {})
vim.api.nvim_set_hl(0, 'TSMath', { fg = palette_colors.sakuraPink }) -- ADDED
vim.api.nvim_set_hl(0, 'TSMethod', { link = 'Function' })
-- vim.api.nvim_set_hl(0, 'TSNamespace', {})
-- vim.api.nvim_set_hl(0, 'TSNone', {})
-- vim.api.nvim_set_hl(0, 'TSNote', {})
-- vim.api.nvim_set_hl(0, 'TSNumber', {})
vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSParameter', { link = 'Identifier' })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { link = 'Identifier' })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = colors.br })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = colors.br })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = colors.br })
-- vim.api.nvim_set_hl(0, 'TSRepeat', {})
-- vim.api.nvim_set_hl(0, 'TSStrike', {})
-- vim.api.nvim_set_hl(0, 'TSString', {})
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = colors.re, bold = true })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = colors.re })
-- vim.api.nvim_set_hl(0, 'TSSymbol', {})
-- vim.api.nvim_set_hl(0, 'TSTag', {})
-- vim.api.nvim_set_hl(0, 'TSTagDelimiter', {})
-- vim.api.nvim_set_hl(0, 'TSText', {})
-- vim.api.nvim_set_hl(0, 'TSTextReference', {})
-- vim.api.nvim_set_hl(0, 'TSTitle', {})
-- vim.api.nvim_set_hl(0, 'TSType', {})
-- vim.api.nvim_set_hl(0, 'TSTypeBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSUnderline', {})
-- vim.api.nvim_set_hl(0, 'TSURI', {})
vim.api.nvim_set_hl(0, 'TSVariable', { fg = colors.fg })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = colors.sp2, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { link = 'Todo' })

--- LANGUAGE ---
------ HTML ------
-- vim.api.nvim_set_hl(0, 'htmlH1', {})
-- vim.api.nvim_set_hl(0, 'htmlH2', {})

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

------ MARKDOWN ------
-- vim.api.nvim_set_hl(0, 'mkdHeading', {})
-- vim.api.nvim_set_hl(0, 'mkdCode', {})
-- vim.api.nvim_set_hl(0, 'mkdCodeDelimiter', {})
-- vim.api.nvim_set_hl(0, 'mkdCodeStart', {})
-- vim.api.nvim_set_hl(0, 'mkdCodeEnd', {})
-- vim.api.nvim_set_hl(0, 'mkdLink', {})

-- vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', {})
vim.api.nvim_set_hl(0, 'markdownCode', { fg = colors.st })
vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = colors.st })
vim.api.nvim_set_hl(0, 'markdownEscape', { fg = 'NONE' })
-- vim.api.nvim_set_hl(0, 'markdownH1', {})
-- vim.api.nvim_set_hl(0, 'markdownH2', {})
-- vim.api.nvim_set_hl(0, 'markdownLinkText', {})

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

vim.g.terminal_color_0  = palette_colors.sumiInk0
vim.g.terminal_color_1  = palette_colors.autumnRed
vim.g.terminal_color_2  = palette_colors.autumnGreen
vim.g.terminal_color_3  = palette_colors.boatYellow2
vim.g.terminal_color_4  = palette_colors.crystalBlue
vim.g.terminal_color_5  = palette_colors.oniViolet
vim.g.terminal_color_6  = palette_colors.waveAqua1
vim.g.terminal_color_7  = palette_colors.oldWhite
vim.g.terminal_color_8  = palette_colors.fujiGray
vim.g.terminal_color_9  = palette_colors.samuraiRed
vim.g.terminal_color_10 = palette_colors.springGreen
vim.g.terminal_color_11 = palette_colors.carpYellow
vim.g.terminal_color_12 = palette_colors.springBlue
vim.g.terminal_color_13 = palette_colors.springViolet1
vim.g.terminal_color_14 = palette_colors.waveAqua2
vim.g.terminal_color_15 = palette_colors.fujiWhite
