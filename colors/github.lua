-- Modified from https://github.com/projekt0n/github-nvim-theme
vim.g.colors_name = 'github'

local c = {}

if vim.g.theme_style == 'dark' then
	c = {
		-- Background Colors
		bg = '#24292E',
		bg2 = '#1F2428',

		-- Foreground Colors
		fg = '#C9D1D9',
		fg_dark = '#666666',
		fg_gutter = '#E1E4E8',
		fg_light = '#D1D5DA',
		fg_term = '#D1D5DA',

		-- Background Highlights Colors
		bg_highlight = '#2C313A',
		bg_search = '#404030',
		bg_visual = '#444C56',
		bg_visual_selection = '#284566',
		border = '#C9D1D9',

		-- Cursor & LineNumber Colors
		cursor = '#C8E1FF',
		cursor_line_nr = '#E1E4E8',
		line_nr = '#444D56',

		-- LSP & Diagnostic Colors
		error = '#F97583',
		warning = '#CCA700',
		info = '#75BEFF',
		hint = '#EEEEB3',
		lsp = { ref_txt = '#265459' },

		-- Auto-Complication Colors
		pmenu = {
			bg = '#1F2428',
			sbar = '#32383E',
		},

		-- Git & Diff Colors
		git = {
			add = '#34D058',
			change = '#E2C08D',
			delete = '#EA4A5A',
			conflict = '#FFAB70',
			ignore = '#6A737D',
			renamed = '#73C991',
		},
		diff = {
			add = '#244032',
			add_fg = '#56D364',
			change = '#341A00',
			change_fg = '#E3B341',
			delete = '#462C32',
			delete_fg = '#F85149',
		},

		-- Syntax Colors
		syntax = {
			comment = '#6A737D',
			constant = '#79B8FF',
			string = '#9ECBFF',
			variable = '#79B8FF',
			keyword = '#F97583',
			func = '#B392F0',
			func_param = '#E1E4E8',
			match_paren_bg = '#25686C',
			tag = '#85E89D',
			html_arg = '#FDAEB7',
			param = '#FFAB70',
			json_label = '#79B8FF',
		},

		-- Terminal Colors
		orange = '#D18616',
		black = '#586069',
		bright_black = '#959DA5',
		white = '#D1D5DA',
		bright_white = '#FAFBFC',
		red = '#EA4A5A',
		bright_red = '#F97583',
		green = '#34D058',
		bright_green = '#85E89D',
		yellow = '#FFEA7F',
		bright_yellow = '#FFEA7F',
		blue = '#2188FF',
		bright_blue = '#79B8FF',
		magenta = '#B392F0',
		bright_magenta = '#B392F0',
		cyan = '#39C5CF',
		bright_cyan = '#56D4DD',

		-- Plugin Colors
		git_signs = {
			add = '#28A745',
			change = '#2188FF',
			delete = '#EA4A5A',
		},

		teledark = '#1E2328',
		teleblack = '#2A2F34',
	}
elseif vim.g.theme_style == 'light' then
	c = {
		-- Background Colors
		bg = '#FFFFFF',
		bg2 = '#F6F8FA',

		-- Foreground Colors
		fg = '#24292E',
		fg_dark = '#424242',
		fg_gutter = '#24292E',
		fg_light = '#24292E',
		fg_term = '#0E1116',

		-- Background Highlights Colors
		bg_highlight = '#D5E5F6',
		bg_search = '#FFF2BE',
		bg_visual = '#E1E4E8',
		bg_visual_selection = '#DBE9F9',
		border = '#044289',

		-- Cursor & LineNumber Colors
		cursor = '#044289',
		cursor_line_nr = '#24292E',
		line_nr = '#959DA5',

		-- LSP & Diagnostic Colors
		error = '#CB2431',
		warning = '#BF8803',
		info = '#75BEFF',
		hint = '#6C6C6C',
		lsp = { ref_txt = '#CCF3D5' },

		-- Auto-Complication Colors
		pmenu = {
			bg = '#F6F8FA',
			sbar = '#E7E9EB',
		},

		-- Git & Diff Colors
		git = {
			add = '#22863A',
			change = '#B08800',
			delete = '#CB2431',
			conflict = '#B08800',
			ignore = '#959DA5',
			renamed = '#007100',
		},
		diff = {
			add = '#D4F8DB',
			add_fg = '#22863A',
			change = '#FFF5B1',
			change_fg = '#B08800',
			delete = '#FAE5E7',
			delete_fg = '#CB2431',
		},

		-- Syntax Colors
		syntax = {
			comment = '#6A737D',
			constant = '#005CC5',
			string = '#032F62',
			variable = '#E36209',
			keyword = '#D73A49',
			func = '#6F42C1',
			func_param = '#24292E',
			match_paren_bg = '#CCF3D5',
			tag = '#22863A',
			html_arg = '#B31D28',
			param = '#E36209',
			json_label = '#005CC5',
		},

		-- Terminal Colors
		orange = '#D18616',
		black = '#24292F',
		bright_black = '#57606A',
		white = '#6E7781',
		bright_white = '#8C959F',
		red = '#CF222E',
		bright_red = '#A40E26',
		green = '#116329',
		bright_green = '#1A7F37',
		yellow = '#4D2D00',
		bright_yellow = '#633C01',
		blue = '#0969DA',
		bright_blue = '#218BFF',
		magenta = '#8250DF',
		bright_magenta = '#A475F9',
		cyan = '#1B7C83',
		bright_cyan = '#3192AA',

		-- Plugin Colors
		git_signs = {
			add = '#34D058',
			change = '#F9C513',
			delete = '#D73A49',
		},

		teledark = '#F6F8FA',
		teleblack = '#EAECEE',
	}
else
	c = {
		-- Background Colors
		bg = '#FFFFFF',
		bg2 = '#F6F8FA',

		-- foreground colors
		fg = '#24292F',
		fg_dark = '#666666',
		fg_gutter = '#BABBBD',
		fg_light = '#586069',
		fg_term = '#24292F',

		-- Background Highlights Colors
		bg_highlight = '#D5E5F6',
		bg_search = '#FFF2BE',
		bg_visual = '#E1E4E8',
		bg_visual_selection = '#DBE9F9',
		border = '#044289',

		-- Cursor & LineNumber Colors
		cursor = '#044289',
		cursor_line_nr = '#24292E',
		line_nr = '#BABBBD',

		-- LSP & Diagnostic Colors
		error = '#CB2431',
		warning = '#BF8803',
		info = '#75BEFF',
		hint = '#6C6C6C',
		lsp = { ref_txt = '#C6EED2' },

		-- Auto-Complication Colors
		pmenu = { bg = '#F6F8FA', sbar = '#F0F1F3' },

		-- Git & Diff Colors
		git = {
			add = '#28A745',
			change = '#895503',
			delete = '#D73A49',
			conflict = '#E36209',
			ignore = '#959DA5',
			renamed = '#007100',
		},
		diff = {
			add = '#D4F8DB',
			add_fg = '#22863A',
			change = '#FFF5B1',
			change_fg = '#B08800',
			delete = '#FAE5E7',
			delete_fg = '#CB2431',
		},

		-- Syntax Colors
		syntax = {
			comment = '#6A737D',
			constant = '#005CC5',
			string = '#032F62',
			variable = '#005CC5',
			keyword = '#D73A49',
			func = '#6F42C1',
			func_param = '#24292E',
			match_paren_bg = '#C6EED2',
			tag = '#22863A',
			html_arg = '#B31D28',
			param = '#E36209',
			json_label = '#005CC5',
		},

		-- Terminal Colors
		orange = '#D18616',
		black = '#24292E',
		bright_black = '#959DA5',
		white = '#6A737D',
		bright_white = '#D1D5DA',
		red = '#D73A49',
		bright_red = '#CB2431',
		green = '#28A745',
		bright_green = '#22863A',
		yellow = '#DBAB09',
		bright_yellow = '#B08800',
		blue = '#0366D6',
		bright_blue = '#005CC5',
		magenta = '#5A32A3',
		bright_magenta = '#5A32A3',
		cyan = '#0598BC',
		bright_cyan = '#3192AA',

		-- Plugin Colors
		git_signs = {
			add = '#28A745',
			change = '#2188FF',
			delete = '#D73A49',
		},

		teledark = '#F6F8FA',
		teleblack = '#EAECEE',
	}
end

local util = require('ui.util')

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = c.bg_visual })
vim.api.nvim_set_hl(0, 'Conceal', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'Cursor', { fg = c.bg, bg = c.fg })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = c.bg_highlight })
vim.api.nvim_set_hl(0, 'CursorIM', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = c.bg_highlight })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.cursor_line_nr })
vim.api.nvim_set_hl(0, 'Directory', { fg = c.blue })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = c.eob })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = c.error })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = c.border })
vim.api.nvim_set_hl(0, 'FoldColumn', { link = 'Folded' })
vim.api.nvim_set_hl(0, 'Folded', { fg = c.fg, bg = c.bg_visual_selection })
vim.api.nvim_set_hl(0, 'IncSearch', { link = 'Search' })
vim.api.nvim_set_hl(0, 'lCursor', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.line_nr })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = c.fg, bg = c.syntax.match_paren_bg })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = c.fg, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = c.blue })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', {})
vim.api.nvim_set_hl(0, 'NonText', { fg = c.eob })
vim.api.nvim_set_hl(0, 'Normal', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = c.fg, bg = c.bg_float })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'NormalSB', { fg = c.fg, bg = c.bg_sidebar })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = c.fg, bg = c.pmenu.bg })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = c.pmenu.bg })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = c.pmenu.bg, bg = util.darken(c.bright_blue, 0.75) })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = c.pmenu.sbar })
vim.api.nvim_set_hl(0, 'Question', { fg = c.blue })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = util.darken(c.blue, 0.2), bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = c.none, bg = c.bg_search })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = c.fg_gutter, bg = c.bg })
vim.api.nvim_set_hl(0, 'SignColumnSB', { fg = c.fg_gutter, bg = c.bg_sidebar })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = c.fg_gutter })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.bg, bg = c.blue })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = util.darken(c.fg, 0.5), bg = c.bg })
vim.api.nvim_set_hl(0, 'Substitute', { fg = c.black, bg = c.red })
vim.api.nvim_set_hl(0, 'TabLine', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = c.bg2 })
vim.api.nvim_set_hl(0, 'TabLineSel', { link = 'PmenuSel' })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
vim.api.nvim_set_hl(0, 'VertSplit', { fg = c.bg_visual, bg = c.bg })
vim.api.nvim_set_hl(0, 'Visual', { bg = c.bg_visual_selection })
vim.api.nvim_set_hl(0, 'VisualNOS', { link = 'Visual' })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = c.warning })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = util.darken(c.syntax.comment, 0.4) })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = c.bg_visual })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = c.diff.add_fg, bg = c.diff.add })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = c.diff.change_fg, bg = c.diff.change })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = c.diff.delete_fg, bg = c.diff.delete })
vim.api.nvim_set_hl(0, 'DiffText', { fg = c.fg_gutter })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { sp = c.error, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellCap', { sp = c.warning, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellLocal', { sp = c.info, undercurl = true })
vim.api.nvim_set_hl(0, 'SpellRare', { sp = c.hint, undercurl = true })

-- SYNTAX GROUPS
-- vim.api.nvim_set_hl(0, 'Boolean', {})
vim.api.nvim_set_hl(0, 'Character', { fg = c.syntax.variable })
vim.api.nvim_set_hl(0, 'Comment', { fg = c.syntax.comment, italic = true })
-- vim.api.nvim_set_hl(0, 'Conditional', {})
vim.api.nvim_set_hl(0, 'Constant', { fg = c.syntax.constant })
-- vim.api.nvim_set_hl(0, 'Debug', {})
-- vim.api.nvim_set_hl(0, 'Define', {})
-- vim.api.nvim_set_hl(0, 'Delimiter', {})
vim.api.nvim_set_hl(0, 'Error', { fg = c.error })
-- vim.api.nvim_set_hl(0, 'Exception', {})
-- vim.api.nvim_set_hl(0, 'Float', {})
vim.api.nvim_set_hl(0, 'Function', { fg = c.syntax.func })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
-- vim.api.nvim_set_hl(0, 'Include', {})
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.syntax.keyword, italic = true })
-- vim.api.nvim_set_hl(0, 'Label', {})
-- vim.api.nvim_set_hl(0, 'Macro', {})
-- vim.api.nvim_set_hl(0, 'Number', {})
vim.api.nvim_set_hl(0, 'Operator', { fg = c.syntax.keyword })
-- vim.api.nvim_set_hl(0, 'PreCondit', {})
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.syntax.keyword })
-- vim.api.nvim_set_hl(0, 'Repeat', {})
vim.api.nvim_set_hl(0, 'Special', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'SpecialChar', {})
-- vim.api.nvim_set_hl(0, 'SpecialComment', {})
vim.api.nvim_set_hl(0, 'Statement', { fg = c.syntax.keyword })
-- vim.api.nvim_set_hl(0, 'StorageClass', {})
vim.api.nvim_set_hl(0, 'String', { fg = c.syntax.string })
-- vim.api.nvim_set_hl(0, 'Structure', {})
-- vim.api.nvim_set_hl(0, 'Tag', {})
vim.api.nvim_set_hl(0, 'Title', { fg = c.syntax.variable, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = c.bg, bg = c.yellow })
vim.api.nvim_set_hl(0, 'Type', { fg = c.syntax.keyword })
-- vim.api.nvim_set_hl(0, 'Typedef', {})
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = c.bg_sidebar })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = c.info, bg = util.darken(c.info, 0.1) })

vim.api.nvim_set_hl(0, 'healthError', { fg = c.error })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = c.green })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = c.warning })

vim.api.nvim_set_hl(0, 'qfLineNr', { fg = c.syntax.keyword })
vim.api.nvim_set_hl(0, 'qfFileName', { fg = c.blue })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = c.error })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = c.warning })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = c.info })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = c.hint })

------ GIT ------
-- vim.api.nvim_set_hl(0, 'diffAdded', { link = 'DiffAdd' })
-- vim.api.nvim_set_hl(0, 'diffChanged', { link = 'DiffChange' })
-- vim.api.nvim_set_hl(0, 'diffRemoved', { link = 'DiffDelete' })
-- vim.api.nvim_set_hl(0, 'diffOldFile', { fg = c.yellow })
-- vim.api.nvim_set_hl(0, 'diffNewFile', { fg = c.orange })
-- vim.api.nvim_set_hl(0, 'diffFile', { fg = c.blue })
-- vim.api.nvim_set_hl(0, 'diffLine', { fg = c.fg_gutter })
-- vim.api.nvim_set_hl(0, 'diffIndexLine', { fg = c.magenta })

------ GITCOMMITS ------
-- vim.api.nvim_set_hl(0, 'gitcommitSummary', { fg = c.syntax.tag })

---------- NVIM LSPCONFIG ----------

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

---------- CMP ----------
-- Cmp
vim.api.nvim_set_hl(0, 'CmpDocumentation', { link = 'NormalFloat' })
vim.api.nvim_set_hl(0, 'CmpDocumentationBorder', { link = 'FloatBorder' })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = c.syntax.comment, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = c.blue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpItemAbbrMatch' })

-- Cmp Item Kind
vim.api.nvim_set_hl(0, 'CmpItemKindColorDefault', { fg = c.bright_red })
vim.api.nvim_set_hl(0, 'CmpItemKindPropertyDefault', { fg = c.syntax.func })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippetDefault', { fg = c.bright_yellow })

vim.api.nvim_set_hl(0, 'CmpItemKindVariableDefault', { fg = c.syntax.variable })
vim.api.nvim_set_hl(0, 'CmpItemKindClassDefault', { link = 'CmpItemKindVariableDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumDefault', { link = 'CmpItemKindVariableDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterfaceDefault', { link = 'CmpItemKindVariableDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindTextDefault', { link = 'CmpItemKindVariableDefault' })

vim.api.nvim_set_hl(0, 'CmpItemKindKeywordDefault', { fg = c.syntax.keyword })
vim.api.nvim_set_hl(0, 'CmpItemKindFieldDefault', { link = 'CmpItemKindKeywordDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindUnitDefault', { link = 'CmpItemKindKeywordDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindValueDefault', { link = 'CmpItemKindKeywordDefault' })

vim.api.nvim_set_hl(0, 'CmpItemKindFileDefault', { fg = c.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindFolderDefault', { link = 'CmpItemKindFileDefault' })

vim.api.nvim_set_hl(0, 'CmpItemKindFunctionDefault', { fg = c.syntax.func })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructorDefault', { link = 'CmpItemKindFunctionDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindEventDefault', { link = 'CmpItemKindFunctionDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindMethodDefault', { link = 'CmpItemKindFunctionDefault' })

vim.api.nvim_set_hl(0, 'CmpItemKindOperatorDefault', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMemberDefault', { link = 'CmpItemKindOperatorDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindReferenceDefault', { link = 'CmpItemKindOperatorDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { link = 'CmpItemKindOperatorDefault' })

vim.api.nvim_set_hl(0, 'CmpItemKindConstantDefault', { fg = c.syntax.constant })
vim.api.nvim_set_hl(0, 'CmpItemKindModuleDefault', { link = 'CmpItemKindConstantDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindStructDefault', { link = 'CmpItemKindConstantDefault' })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameterDefault', { link = 'CmpItemKindConstantDefault' })

------ GITSIGNS -----
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = c.git_signs.add })
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = c.git_signs.change })
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = c.git_signs.delete })
-- vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = util.darken(c.syntax.comment, 0.6) })

------ HOP ------
-- vim.api.nvim_set_hl(0, 'HopNextKey', { fg = c.magenta, bold = true })
-- vim.api.nvim_set_hl(0, 'HopNextKey1', { fg = c.blue, bold = true })
-- vim.api.nvim_set_hl(0, 'HopNextKey2', { fg = util.darken(c.bright_blue, 0.8) })
-- vim.api.nvim_set_hl(0, 'HopUnmatched', { fg = c.fg_dark })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = c.syntax.comment })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', {})
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', {})
-- vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = cp.white })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = cp.gray, underdash = true })

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
vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = util.darken(c.error, 0.9) })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = util.darken(c.warning, 0.9) })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = util.darken(c.green, 0.9) })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = util.darken(c.fg, 0.7) })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = util.darken(c.bright_magenta, 0.9) })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'NotifyERRORTitle' })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'NotifyWARNTitle' })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'NotifyINFOTitle' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { link = 'NotifyDEBUGTitle' })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { link = 'NotifyTRACETitle' })

vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { link = 'NotifyERRORTitle' })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { link = 'NotifyWARNTitle' })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { link = 'NotifyINFOTitle' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { link = 'NotifyDEBUGTitle' })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { link = 'NotifyTRACETitle' })

vim.api.nvim_set_hl(0, 'NotifyERRORBody', { fg = util.lighten(c.error, 0.1) })
vim.api.nvim_set_hl(0, 'NotifyWARNBody', { fg = util.lighten(c.warning, 0.1) })
vim.api.nvim_set_hl(0, 'NotifyINFOBody', { fg = util.lighten(c.green, 0.1) })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBody', { link = 'NotifyDEBUGTitle' })
vim.api.nvim_set_hl(0, 'NotifyTRACEBody', { fg = util.lighten(c.bright_magenta, 0.1) })

---------- RAINBOW ----------
-- vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.teal })
-- vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.flamingo })
-- vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.green })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = c.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = c.fg, bg = c.teleblack })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = c.syntax.constant, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeMultiSelection', { fg = c.syntax.comment })

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = c.fg })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = c.fg, bg = c.teleblack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = c.teledark, bg = c.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = c.teleblack, bg = c.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = c.bg, bg = c.green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = c.bg, bg = c.red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = c.teledark, bg = c.blue })

------------ TELESCOPE ----------
-- vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = cp.teledark })
-- vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = cp.white, bg = cp.teleblack })

-- vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = cp.red, bg = cp.teleblack })

-- vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.teledark, bg = cp.teledark })
-- vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = cp.teleblack, bg = cp.teleblack })

-- vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.black2, bg = cp.green })
-- vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.black2, bg = cp.red })
-- vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.teledark, bg = cp.blue })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
-- vim.api.nvim_set_hl(0, 'TSAttribute', {})
-- vim.api.nvim_set_hl(0, 'TSBoolean', {})
-- vim.api.nvim_set_hl(0, 'TSCharacter', {})
-- vim.api.nvim_set_hl(0, 'TSComment', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = c.bg, bg = c.info })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = c.bg, bg = c.warning })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = c.bg, bg = c.error })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'TSConditional', {})
vim.api.nvim_set_hl(0, 'TSConstant', { fg = c.syntax.constant })
vim.api.nvim_set_hl(0, 'commentTSConstant', { fg = c.syntax.keyword })
-- vim.api.nvim_set_hl(0, 'TSConstBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSConstMacro', {})
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = c.bright_green }) -- ADDED
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = c.info }) -- ADDED
-- vim.api.nvim_set_hl(0, 'TSError', {})
-- vim.api.nvim_set_hl(0, 'TSException', {})
vim.api.nvim_set_hl(0, 'TSField', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'TSFloat', {})
-- vim.api.nvim_set_hl(0, 'TSFunction', {})
-- vim.api.nvim_set_hl(0, 'TSFuncBuiltin', {})
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', {})
vim.api.nvim_set_hl(0, 'TSInclude', { fg = c.syntax.keyword })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = c.syntax.keyword, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = c.syntax.keyword })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = c.blue })
vim.api.nvim_set_hl(0, 'TSMath', { fg = c.yellow }) -- ADDED
-- vim.api.nvim_set_hl(0, 'TSMethod', {})
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
-- vim.api.nvim_set_hl(0, 'TSNumber', {})
vim.api.nvim_set_hl(0, 'TSOperator', { fg = c.syntax.keyword })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = c.syntax.func_param })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { fg = c.syntax.func })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = c.fg })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = c.fg })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'TSRepeat', {})
-- vim.api.nvim_set_hl(0, 'TSString', {})
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = c.syntax.variable })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = c.red })
-- vim.api.nvim_set_hl(0, 'TSSymbol', {})
vim.api.nvim_set_hl(0, 'TSType', { fg = c.syntax.keyword })
-- vim.api.nvim_set_hl(0, 'TSTypeBuiltin', {})
vim.api.nvim_set_hl(0, 'TSVariable', { fg = c.syntax.variable })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = c.syntax.variable })
vim.api.nvim_set_hl(0, 'TSTag', { fg = c.syntax.tag })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'TSText', {})
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = c.cyan }) -- FIXED
-- vim.api.nvim_set_hl(0, 'TSEmphasis', {})
-- vim.api.nvim_set_hl(0, 'TSUnderline', {})
-- vim.api.nvim_set_hl(0, 'TSStrike', {})
-- vim.api.nvim_set_hl(0, 'TSTitle', {})
-- vim.api.nvim_set_hl(0, 'TSLiteral', {})
-- vim.api.nvim_set_hl(0, 'TSURI', {})

--- LANGUAGE ---
-- Lua
vim.api.nvim_set_hl(0, 'luaTSConstructor', { fg = c.fg })

-- C
vim.api.nvim_set_hl(0, 'cTSLabel', { fg = c.fg })

-- CSS
-- vim.api.nvim_set_hl(0, 'cssTSProperty', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'cssTSType', { fg = c.syntax.tag })

-- html
vim.api.nvim_set_hl(0, 'htmlTSConstant', { fg = c.syntax.tag })
-- vim.api.nvim_set_hl(0, 'htmlTag', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'htmlEndTag', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'htmlTagName', { fg = c.syntax.tag })
-- vim.api.nvim_set_hl(0, 'htmlArg', { fg = c.syntax.html_arg })

-- javascript
-- vim.api.nvim_set_hl(0, 'javascriptTSType', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'javascriptTSParameter', { fg = c.syntax.param })
-- vim.api.nvim_set_hl(0, 'javascriptTSVariable', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'javascriptTSPunctDelimiter', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'javascriptTSStringRegex', { fg = c.syntax.string })
-- vim.api.nvim_set_hl(0, 'javascriptTSConstructor', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'javascriptTSProperty', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'regexTSStringEscape', { fg = c.syntax.keyword })

-- json
-- vim.api.nvim_set_hl(0, 'jsonTSLabel', { fg = c.syntax.json_label })

-- less
-- vim.api.nvim_set_hl(0, 'lessVariable', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'lessProperty', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'cssTagName', { fg = c.syntax.tag })
-- vim.api.nvim_set_hl(0, 'cssPseudoClassId', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'lessClassCall', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'lessClass', { fg = c.syntax.func })

-- make
-- vim.api.nvim_set_hl(0, 'makeSpecial', { fg = c.syntax.keyword })

-- obj-c
-- vim.api.nvim_set_hl(0, 'cBlock', { fg = c.syntax.func })

-- python
vim.api.nvim_set_hl(0, 'pythonTSType', { fg = c.syntax.func })
vim.api.nvim_set_hl(0, 'pythonTSParameter', { fg = c.syntax.param })

-- ruby
-- vim.api.nvim_set_hl(0, 'rubyTSType', { fg = c.syntax.func })

-- scss
-- vim.api.nvim_set_hl(0, 'scssTSVariable', { fg = c.syntax.param })
-- vim.api.nvim_set_hl(0, 'scssTSType', { fg = c.syntax.tag })
-- vim.api.nvim_set_hl(0, 'scssTSProperty', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'scssTSParameter', { fg = c.syntax.param })

-- sql
-- vim.api.nvim_set_hl(0, 'sqlFold', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'sqlKeyword', { fg = c.syntax.keyword })

-- typescript
-- vim.api.nvim_set_hl(0, 'typescriptTSType', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'typescriptTSConstructor', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'typescriptTSTypeBuiltin', { fg = c.syntax.variable })

-- xml
-- vim.api.nvim_set_hl(0, 'xmlProcessing', { fg = c.syntax.tag })
-- vim.api.nvim_set_hl(0, 'xmlTagName', { fg = c.syntax.tag })
-- vim.api.nvim_set_hl(0, 'xmlTag', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'xmlAttrib', { fg = c.syntax.tag })

-- yaml
-- vim.api.nvim_set_hl(0, 'yamlTSField', { fg = c.syntax.tag })

-- java
-- vim.api.nvim_set_hl(0, 'javaTSVariable', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'javaTSType', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'javaTSParameter', { fg = c.syntax.param })

-- Markdown
-- vim.api.nvim_set_hl(0, 'mkdCodeDelimiter', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'mkdCodeStart', { fg = c.syntax.variable, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdCodeEnd', { fg = c.syntax.variable, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = c.syntax.variable, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownH1', { fg = c.syntax.variable, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownH2', { fg = c.syntax.variable, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownH3', { fg = c.syntax.variable, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = c.fg, underline = true })
-- vim.api.nvim_set_hl(0, 'markdownUrl', { fg = c.fg, underline = true })

-- vim.api.nvim_set_hl(0, 'markdownHeadingRule', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'markdownListMarker', { fg = c.syntax.param })
-- vim.api.nvim_set_hl(0, 'markdownRule', { fg = c.syntax.variable })
-- vim.api.nvim_set_hl(0, 'markdownBold', { fg = c.fg, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownItalic', { fg = c.fg, italic = true })
-- vim.api.nvim_set_hl(0, 'markdownCode', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = c.fg })
-- vim.api.nvim_set_hl(0, 'markdownBlockquote', { fg = c.syntax.tag })
-- vim.api.nvim_set_hl(0, 'markdownCodeDelimiter', { fg = c.syntax.func })
-- vim.api.nvim_set_hl(0, 'markdownUrlTitle', { fg = c.syntax.string, underline = true })

-- go
-- vim.api.nvim_set_hl(0, 'goTSVariable', { fg = c.fg })
