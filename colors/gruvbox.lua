vim.g.colors_name = 'gruvbox'

local cp
if vim.g.gruvbox_style == 'dark' then
	cp = {
		bg0 = '#32302f',
		bg1 = '#282828',
		bg2 = '#282828',
		bg3 = '#3c3836',
		bg4 = '#3c3836',
		bg5 = '#504945',
		bg_statusline1 = '#282828',
		bg_statusline2 = '#32302f',
		bg_statusline3 = '#504945',
		bg_diff_green = '#32361a',
		bg_visual_green = '#333e34',
		bg_diff_red = '#3c1f1e',
		bg_visual_red = '#442e2d',
		bg_diff_blue = '#0d3138',
		bg_visual_blue = '#2e3b3b',
		bg_visual_yellow = '#473c29',
		bg_current_word = '#32302f',

		fg0 = '#d4be98',
		fg1 = '#ddc7a1',
		red = '#c14a4a',
		orange = '#e78a4e',
		yellow = '#d8a657',
		green = '#a9b665',
		aqua = '#89b482',
		blue = '#7daea3',
		purple = '#d3869b',
		bg_red = '#ea6962',
		bg_green = '#a9b665',
		bg_yellow = '#d8a657',

		grey0 = '#7c6f64',
		grey1 = '#928374',
		grey2 = '#a89984',

		teledark = '#2c2a29',
		teleblack = '#383635',
	}
else
	cp = {
		bg0 = '#f9f5d7',
		bg1 = '#f5edca',
		bg2 = '#f3eac7',
		bg3 = '#f2e5bc',
		bg4 = '#eee0b7',
		bg5 = '#ebdbb2',
		bg_statusline1 = '#f5edca',
		bg_statusline2 = '#f3eac7',
		bg_statusline3 = '#eee0b7',
		bg_diff_green = '#e4edc8',
		bg_visual_green = '#dde5c2',
		bg_diff_red = '#f8e4c9',
		bg_visual_red = '#f0ddc3',
		bg_diff_blue = '#e0e9d3',
		bg_visual_blue = '#d9e1cc',
		bg_visual_yellow = '#f9eabf',
		bg_current_word = '#f3eac7',

		fg0 = '#654735',
		fg1 = '#4f3829',
		red = '#c14a4a',
		orange = '#c35e0a',
		yellow = '#b47109',
		green = '#6c782e',
		aqua = '#4c7a5d',
		blue = '#45707a',
		purple = '#945e80',
		bg_red = '#ae5858',
		bg_green = '#6f8352',
		bg_yellow = '#a96b2c',

		grey0 = '#a89984',
		grey1 = '#928374',
		grey2 = '#7c6f64',

		teledark = '#fffbdd',
		teleblack = '#f3efd1',
	}
end

---------- BASICS ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.grey0 })
vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.bg1 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.teleblack })
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.grey1 })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {})
vim.api.nvim_set_hl(0, 'Directory', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', {})
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, underline = true })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.grey1 })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.grey1, bg = cp.bg2 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.bg0, bg = cp.bg_red })
vim.api.nvim_set_hl(0, 'lCursor', { link = 'Cursor' })
vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.bg5 })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = cp.bg4 })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = cp.fg0, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.yellow, bold = true })
-- vim.api.nvim_set_hl(0, 'MsgArea', {})
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.bg5 })
vim.api.nvim_set_hl(0, 'Normal', { fg = cp.fg0, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = cp.fg1, bg = cp.bg3 })
-- vim.api.nvim_set_hl(0, 'NormalNC', { fg = cp.fg0, bg = cp.bg0 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.fg1, bg = cp.bg3 })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = cp.bg3 })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = cp.bg3, bg = cp.bg_green }) -- USEFUL
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.grey0 })
vim.api.nvim_set_hl(0, 'Question', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.purple, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = cp.bg0, bg = cp.bg_green })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.bg5 })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.fg1, bg = cp.bg_statusline1 })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.grey1, bg = cp.bg_statusline1 })
vim.api.nvim_set_hl(0, 'Substitute', { bg = cp.yellow })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.fg1, bg = cp.bg_statusline3 })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = cp.fg1, bg = cp.bg0 }) -- FIXED
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.bg0, bg = cp.grey2 })
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', { fg = cp.bg5 })
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.bg_visual_green })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.bg_visual_green })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.bg5 })
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'PmenuSel' })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = cp.bg5 })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', {})

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = cp.bg_diff_green })
vim.api.nvim_set_hl(0, 'DiffChange', { bg = cp.bg_diff_blue })
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = cp.bg_diff_red })
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.bg0, bg = cp.blue })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.aqua })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.purple })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.grey1, italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'Debug', {})
vim.api.nvim_set_hl(0, 'Define', { fg = cp.purple, italic = true })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'Float', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
vim.api.nvim_set_hl(0, 'Include', { fg = cp.purple, italic = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.aqua })
-- vim.api.nvim_set_hl(0, 'Method', { link = 'Function' })
vim.api.nvim_set_hl(0, 'Number', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.purple, italic = true })
vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.purple, italic = true })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'Special', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.grey1, italic = true })
vim.api.nvim_set_hl(0, 'Statement', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'String', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Type' })
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'Title', { fg = cp.orange, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.purple, italic = true })
vim.api.nvim_set_hl(0, 'Type', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'Underlined', { underline = true })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = cp.bg_visual_red, undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg = cp.bg_visual_yellow, undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg = cp.bg_visual_blue, undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg = cp.bg_visual_green, undercurl = true, sp = cp.green })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = cp.green })

---------- NVIM LSPCONFIG ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.bg_current_word })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = cp.bg_current_word })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = cp.bg_current_word })

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
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.fg0, strikethrough = true }) -- FIXED
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.fg0 })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.blue })

-------- INDENT BLANKLINES --------
-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {})
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
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.grey1 })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = cp.purple })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = cp.grey1 })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = cp.purple })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.red })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.green })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.grey1 })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.purple })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.purple })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = cp.fg0, bg = cp.teleblack })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = cp.diff_green })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = cp.orange, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.teledark, bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = cp.teleblack, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.bg2, bg = cp.green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.bg2, bg = cp.red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.teledark, bg = cp.blue })

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'TSComment', { fg = cp.grey1 })
vim.api.nvim_set_hl(0, 'TSConditional', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = cp.bg0, bg = cp.red, bold = true })
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
-- vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.blue, italic = true })
-- vim.api.nvim_set_hl(0, 'TSError', {})
vim.api.nvim_set_hl(0, 'TSException', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.orange })
-- vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = cp.orange })
-- vim.api.nvim_set_hl(0, 'TSLiteral', {})
vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.green, bold = true })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.yellow, italic = true })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.bg0, bg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = cp.purple })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = cp.orange })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = cp.grey1 })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.grey1, strikethrough = true })
vim.api.nvim_set_hl(0, 'TSString', { fg = cp.aqua })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.orange })
-- vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSText', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.purple, bold = true })
-- vim.api.nvim_set_hl(0, 'TSTitle', {})
vim.api.nvim_set_hl(0, 'TSType', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.blue, underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.fg0 })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.bg0, bg = cp.yellow, bold = true })

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
-- vim.api.nvim_set_hl(0, 'luaTSField', {})
-- vim.api.nvim_set_hl(0, 'luaTSFunction', {})
-- vim.api.nvim_set_hl(0, 'luaTSFuncBuiltin', {})
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

vim.g.terminal_color_0 = cp.fg0
vim.g.terminal_color_1 = cp.red
vim.g.terminal_color_2 = cp.green
vim.g.terminal_color_3 = cp.yellow
vim.g.terminal_color_4 = cp.blue
vim.g.terminal_color_5 = cp.purple
vim.g.terminal_color_6 = cp.aqua
vim.g.terminal_color_7 = cp.bg5
vim.g.terminal_color_8 = cp.grey
vim.g.terminal_color_9 = cp.red
vim.g.terminal_color_10 = cp.green
vim.g.terminal_color_11 = cp.yellow
vim.g.terminal_color_12 = cp.blue
vim.g.terminal_color_13 = cp.purple
vim.g.terminal_color_14 = cp.aqua
vim.g.terminal_color_15 = cp.bg5
