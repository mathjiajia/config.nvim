-- Modified from https://github.com/catppuccin/nvim

local cp = {}

if vim.g.theme_style == 'dark' then
	cp = {
		rosewater = '#F5E0DC', -- Rosewater
		flamingo = '#F2CDCD', -- Flamingo
		mauve = '#DDB6F2', -- Mauve
		pink = '#F5C2E7', -- Pink
		red = '#F28FAD', -- Red
		maroon = '#E8A2AF', -- Maroon
		peach = '#F8BD96', -- Peach
		yellow = '#FAE3B0', -- Yellow
		green = '#ABE9B3', -- Green
		blue = '#96CDFB', -- Blue
		sky = '#89DCEB', -- Sky
		teal = '#B5E8E0', -- Teal
		lavender = '#C9CBFF', -- Lavender
		white = '#D9E0EE', -- White
		gray2 = '#C3BAC6', -- Gray2
		gray1 = '#988BA2', -- Gray1
		gray0 = '#6E6C7E', -- Gray0
		black4 = '#575268', -- Black4
		black3 = '#302D41', -- Black3
		black2 = '#1E1E2E', -- Black2
		black1 = '#1A1826', -- Black1
		black0 = '#161320', -- Black0

		teledark = '#1A1826',
		teleblack = '#252434',
	}
elseif vim.g.theme_style == 'storm' then
	cp = {
		rosewater = '#F5DFDA', -- Rosewater
		flamingo = '#F2CBCB', -- Flamingo			-- done
		mauve = '#C6A4F8', -- Mauve					-- done
		pink = '#F5BFE7', -- Pink					-- done
		red = '#F586A2', -- Red						-- done
		maroon = '#EB9DA4', -- Maroon				-- done
		peach = '#FCB081', -- Peach					-- done
		yellow = '#F8DEA9', -- Yellow				-- done
		green = '#A9E4A3', -- Green					-- done
		blue = '#8CB3FA', -- Blue					-- done
		sky = '#89DCFD', -- Sky						-- done
		teal = '#88DFD2', -- Teal					-- done
		lavender = '#C7CBFD', -- Lavender			-- done
		white = '#D2DAF1', -- White					-- done
		gray2 = '#B9C0DB', -- Gray2
		gray1 = '#6F7599', -- Gray1
		gray0 = '#5E6487', -- Gray0
		black4 = '#3E435E', -- Black4
		black3 = '#2B3045', -- Black3
		black2 = '#24273A', -- Black2				-- done
		black1 = '#1F2233', -- Black1
		black0 = '#1A1B26', -- Black0

		teledark = '#1E2134',
		teleblack = '#2A2D40',
	}
else
	cp = {
		rosewater = '#E09D90', -- Rosewater
		flamingo = '#E79C9C', -- Flamingo
		mauve = '#AC61DF', -- Mauve				-- done
		pink = '#EF9AD9', -- Pink				-- done
		red = '#E84746', -- Red					-- done -
		maroon = '#C96765', -- Maroon			-- done
		peach = '#E99726', -- Peach				-- done -
		yellow = '#EABE24', -- Yellow			-- done -
		green = '#89B517', -- Green				-- done -
		blue = '#4877D7', -- Blue				-- done -
		sky = '#3FC4D9', -- Sky					-- done
		teal = '#149C9B', -- Teal				-- done -
		lavender = '#939AFB', -- Lavender		-- done
		white = '#343b58', -- White				-- works?
		gray2 = '#424968', -- Gray2
		gray1 = '#505677', -- Gray1
		gray0 = '#606689', -- Gray0				-- done -
		black4 = '#cfd8dc', -- Black4
		black3 = '#eff3f4', -- Black3
		black2 = '#FCFCFC', -- Black2			-- done
		black1 = '#F3F3F3', -- Black1
		black0 = '#D3D0D2', -- Black0

		teledark = '#FFFFFF',
		teleblack = '#F6F6F6',
	}
end

---------- BASICS ----------
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.black3 })
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.gray1 })
vim.api.nvim_set_hl(0, 'Cursor', { fg = cp.black2, bg = cp.white })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.black1 })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.teleblack }) -- FIXED
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {})
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {})
vim.api.nvim_set_hl(0, 'Directory', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = cp.black2 })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.gray0, bg = cp.black2 })
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.blue, bg = cp.black4 })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.black4, bg = cp.pink })
-- vim.api.nvim_set_hl(0, 'lCursor', {})
vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.black4 })
vim.api.nvim_set_hl(0, 'MatchParen', { bg = cp.black3, bold = true }) -- FIXED
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = cp.flamingo, bold = true })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'MsgArea', { fg = cp.white })
-- vim.api.nvim_set_hl(0, 'MsgSeparator', { link = 'ModeMsg' })
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.gray0 })
vim.api.nvim_set_hl(0, 'Normal', { fg = cp.white, bg = cp.black2 })
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = cp.white, bg = cp.black1 })
vim.api.nvim_set_hl(0, 'NormalNC', { fg = cp.white, bg = cp.black2 })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.gray2, bg = cp.black3 })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = cp.black4 })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = cp.white, bg = cp.black4, bold = true })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.gray0 })
vim.api.nvim_set_hl(0, 'Question', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.black4, bold = true })
vim.api.nvim_set_hl(0, 'Search', { fg = cp.pink, bg = cp.black4, bold = true })
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.black4, bg = cp.black2 })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.white })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.green, bg = cp.black3 }) -- FIXED
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.black4, bg = cp.black1 }) -- FIXED
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.pink, bg = cp.black4 })
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.black1, bg = cp.black4 })
vim.api.nvim_set_hl(0, 'TabLineFill', { bg = cp.black2 }) -- FIXED
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.green, bg = cp.black3 }) -- FIXED
-- vim.api.nvim_set_hl(0, 'TermCursor', {})
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {})
-- vim.api.nvim_set_hl(0, 'VertSplit', {})
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.black4, bold = true })
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.black4, bold = true })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.black4 })
vim.api.nvim_set_hl(0, 'WildMenu', { bg = cp.gray0 })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = cp.black0 })

------ DIFF ------
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = cp.green })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = cp.red })
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.blue, bg = cp.black2 })

------ SPELL ------
vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.green })

-- SYNTAX GROUPS
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.lavender, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'Character', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Comment', { fg = cp.gray0, italic = true })
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.mauve, bold = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = cp.peach })
-- vim.api.nvim_set_hl(0, 'Debug', {})
vim.api.nvim_set_hl(0, 'Define', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.peach, italic = true })
vim.api.nvim_set_hl(0, 'Float', { fg = cp.lavender, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'Function', { fg = cp.pink, italic = true })
vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.flamingo, italic = true })
-- vim.api.nvim_set_hl(0, 'Ignore', {})
vim.api.nvim_set_hl(0, 'Include', { fg = cp.teal, italic = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.pink, italic = true })
vim.api.nvim_set_hl(0, 'Label', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'Method', { link = 'Function' })
vim.api.nvim_set_hl(0, 'Number', { fg = cp.peach, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.sky, bold = true })
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.red })
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.mauve, bold = true })
vim.api.nvim_set_hl(0, 'Special', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.green })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.gray, italic = true })
vim.api.nvim_set_hl(0, 'Statement', { fg = cp.green })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'String', { fg = cp.green })
vim.api.nvim_set_hl(0, 'Struct', { link = 'Type' })
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'Title', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.black2, bg = cp.yellow, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'Underlined', {})

------ MISC ------
-- vim.api.nvim_set_hl(0, 'debugPC', { bg = cp.black0 })
-- vim.api.nvim_set_hl(0, 'debugBreakpoint', { fg = cp.gray0, bg = cp.black0 })

vim.api.nvim_set_hl(0, 'healthError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'healthWarning', { fg = cp.yellow })

vim.api.nvim_set_hl(0, 'qfLineNr', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'qfFileName', { fg = cp.blue })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = cp.red, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = cp.yellow, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = cp.sky, underline = true })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = cp.rosewater, underline = true })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underline = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underline = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underline = true, sp = cp.sky })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underline = true, sp = cp.rosewater })

------ GIT ------
-- vim.api.nvim_set_hl(0, 'diffAdded', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'diffRemoved', { fg = cp.red })
-- vim.api.nvim_set_hl(0, 'diffChanged', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'diffOldFile', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'diffNewFile', { fg = cp.peach })
-- vim.api.nvim_set_hl(0, 'diffFile', { fg = cp.blue })
-- vim.api.nvim_set_hl(0, 'diffLine', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'diffIndexLine', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'DiffAdd', { fg = cp.green, bg = cp.black2 })
-- vim.api.nvim_set_hl(0, 'DiffChange', { fg = cp.yellow, bg = cp.black2 })
-- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = cp.red, bg = cp.black2 })
-- vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.blue, bg = cp.black2 })

---------- NVIM LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.black4 })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { bg = cp.black4 })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { bg = cp.black4 })

vim.api.nvim_set_hl(0, 'LspCodeLens', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', {})
vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', { fg = cp.peach })

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
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.gray2 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.gray0, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.white, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.white, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.white })

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
-- vim.api.nvim_set_hl(0, 'GitSignsAdd', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'GitSignsChange', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'GitSignsDelete', { fg = cp.red })

------ HOP ------
vim.api.nvim_set_hl(0, 'HopNextKey', { bg = cp.black2, fg = cp.peach, bold = true, underline = true })
vim.api.nvim_set_hl(0, 'HopNextKey1', { bg = cp.black2, fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'HopNextKey2', { bg = cp.black2, fg = cp.teal, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'HopUnmatched', { bg = cp.black2, fg = cp.gray0 })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = cp.black3 })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', {})
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', {})
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = cp.white })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = cp.gray, underdash = true })

--------- NEOTREE ---------
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = cp.gray0 })
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = cp.white, bg = cp.black2 }) -- FIXED
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
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = cp.blue }) -- REORDERED
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = cp.green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = cp.red })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = cp.yellow })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = cp.white, bg = cp.teleblack })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = cp.white, bg = cp.black3, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = cp.red, bg = cp.teleblack })
vim.api.nvim_set_hl(0, 'TelescopePromptCounter', { fg = cp.fg, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.teledark, bg = cp.teledark })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = cp.teleblack, bg = cp.teleblack })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.black2, bg = cp.green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.black2, bg = cp.red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.teledark, bg = cp.blue })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = cp.peach, bold = true, italic = true })
-- vim.api.nvim_set_hl(0, 'TSCharacter', {})
-- vim.api.nvim_set_hl(0, 'TSComment', {})
vim.api.nvim_set_hl(0, 'TSConditional', { fg = cp.mauve, bold = true })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.teal, italic = true })
-- vim.api.nvim_set_hl(0, 'TSConstMacro', {})
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.lavender })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = cp.black2, bg = cp.red })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = cp.maroon, italic = true })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.flamingo, italic = true })
-- vim.api.nvim_set_hl(0, 'TSError', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSException', { fg = cp.mauve, italic = true })
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.rosewater })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = cp.peach, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.teal, italic = true })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = cp.red })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = cp.teal, italic = true })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.sky, bold = true })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.teal, italic = true })
vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.blue, italic = true })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.rosewater, italic = true })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.black2, bg = cp.blue })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = cp.peach, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = cp.sky, bold = true })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.yellow, italic = true })
-- vim.api.nvim_set_hl(0, 'TSParameterReference', {})
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.gray1 })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.maroon, bold = true })
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
vim.api.nvim_set_hl(0, 'TSText', { fg = cp.white })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.lavender, bold = true })
vim.api.nvim_set_hl(0, 'TSTitle', { fg = cp.blue, bold = true })
vim.api.nvim_set_hl(0, 'TSType', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.rosewater, italic = true, underline = true })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.white, italic = true })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.black2, bg = cp.yellow })

--- LANGUAGE ---
------ HTML ------
-- vim.api.nvim_set_hl(0, 'htmlH1', { fg = cp.pink, bold = true })
-- vim.api.nvim_set_hl(0, 'htmlH2', { fg = cp.blue, bold = true })

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
-- vim.api.nvim_set_hl(0, 'luaTSConstructor', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'luaTSField', { fg = cp.lavender })
-- vim.api.nvim_set_hl(0, 'luaTSFunction', {})
vim.api.nvim_set_hl(0, 'luaTSFuncBuiltin', { fg = cp.teal, italic = true })
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
-- vim.api.nvim_set_hl(0, 'mkdHeading', { fg = cp.peach, bold = true })
-- vim.api.nvim_set_hl(0, 'mkdCode', { fg = cp.white, bg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'mkdCodeDelimiter', { fg = cp.white, bg = cp.black2 })
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
vim.g.terminal_color_0 = cp.gray0
vim.g.terminal_color_8 = cp.gray1

vim.g.terminal_color_1 = cp.red
vim.g.terminal_color_9 = cp.red

vim.g.terminal_color_2 = cp.green
vim.g.terminal_color_10 = cp.green

vim.g.terminal_color_3 = cp.yellow
vim.g.terminal_color_11 = cp.yellow

vim.g.terminal_color_4 = cp.blue
vim.g.terminal_color_12 = cp.blue

vim.g.terminal_color_5 = cp.pink
vim.g.terminal_color_13 = cp.pink

vim.g.terminal_color_6 = cp.sky
vim.g.terminal_color_14 = cp.sky

vim.g.terminal_color_7 = cp.white
vim.g.terminal_color_15 = cp.white
