local colors = require('themes').get()
-- local italic_comments = true
-- local transparency = false

local white = colors.white
local darker_black = colors.darker_black
local black = colors.black
local black2 = colors.black2
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local one_bg3 = colors.one_bg3
local grey = colors.grey
local grey_fg = colors.grey_fg
local grey_fg2 = colors.grey_fg2
local light_grey = colors.light_grey
local red = colors.red
local baby_pink = colors.baby_pink
local pink = colors.pink
local line = colors.line
local green = colors.green
local vibrant_green = colors.vibrant_green
local nord_blue = colors.nord_blue
local blue = colors.blue
local yellow = colors.yellow
local sun = colors.sun
local purple = colors.purple
local dark_purple = colors.dark_purple
local teal = colors.teal
local orange = colors.orange
local cyan = colors.cyan
local statusline_bg = colors.statusline_bg
local lightbg = colors.lightbg
local lightbg2 = colors.lightbg2
local pmenu_bg = colors.pmenu_bg
local folder_bg = colors.folder_bg

-- Comments
-- if italic_comments then
vim.api.nvim_set_hl(0, 'Comment', { fg = grey_fg, italic = true })
-- else
-- 	vim.api.nvim_set_hl(0, 'Comment', { fg = grey_fg })
-- end

-- cursorline
vim.api.nvim_set_hl(0, 'CursorLine', { bg = one_bg2 })
vim.api.nvim_set_hl(0, 'LineNr', { fg = light_grey })

-- same it bg, so it doesn't appear
-- vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = black })

-- active/inactive statuslines
vim.api.nvim_set_hl(0, 'StatusLine', { fg = black2, bg = blue })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = light_grey, bg = statusline_bg })

-- For floating windows
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = darker_black })
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = one_bg3 })

-- if transparency then
-- 	vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'Folded', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'Comment', { fg = grey })
-- end

-- Pmenu
vim.api.nvim_set_hl(0, 'Pmenu', { bg = one_bg })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = one_bg2 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = pmenu_bg })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = light_grey })

vim.api.nvim_set_hl(0, 'WinSeparator', { fg = line, bg = 'NONE' })
vim.api.nvim_set_hl(0, 'healthSuccess', { fg = teal })

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = green })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = vibrant_green })

vim.api.nvim_set_hl(0, 'DiagnosticUnderlineError', { underdash = true, sp = red })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineWarn', { underdash = true, sp = yellow })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineInfo', { underdash = true, sp = green })
vim.api.nvim_set_hl(0, 'DiagnosticUnderlineHint', { underdash = true, sp = vibrant_green })

---------- LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = lightbg })
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' })
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

---------- TREESITTER ----------
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = baby_pink })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = orange })
-- vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
-- vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
-- vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
-- vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' })
-- vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = purple })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = yellow })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = purple })
-- vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' })
-- vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = green })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = orange, italic = true })
-- vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' })
-- vim.api.nvim_set_hl(0, 'TSException', { link = 'Exception' })
vim.api.nvim_set_hl(0, 'TSField', { fg = sun })
-- vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = orange })
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Marco' })
-- vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
-- vim.api.nvim_set_hl(0, 'TSInclude', { link = 'Include' })
-- vim.api.nvim_set_hl(0, 'TSKeyword', { link = 'Keyword' })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = baby_pink, italic = true })
-- vim.api.nvim_set_hl(0, 'TSKeywordOperator', { link = 'TSOperator' })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = pink, bold = true })
-- vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cyan })
vim.api.nvim_set_hl(0, 'TSMath', { fg = yellow })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = pink })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = dark_purple })
-- vim.api.nvim_set_hl(0, 'TSNone', {}) -- DO NOT CHANGE THE VALUES OF THIS HIGHLIGHT GROUP.
vim.api.nvim_set_hl(0, 'TSNote', { fg = black, bg = cyan, bold = true })
-- vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
-- vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = sun })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = white })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = yellow, italic = true })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = grey })
-- vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = grey_fg2 })
-- vim.api.nvim_set_hl(0, 'TSRepeat', { link = 'Repeat' })
-- vim.api.nvim_set_hl(0, 'TSStrike', { strikethrough = true })
-- vim.api.nvim_set_hl(0, 'TSString', { link = 'String' })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = pink })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = orange })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
-- vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = white })
vim.api.nvim_set_hl(0, 'TSTag', { fg = cyan })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = red, italic = true })
-- vim.api.nvim_set_hl(0, 'TSTagDelimiter', { link = 'Delimiter' })
-- vim.api.nvim_set_hl(0, 'TSText', { link = 'TSNone' })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = sun })
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })
-- vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cyan, italic = true })
-- vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = sun, italic = true, underline = true })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = orange })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = white, italic = true })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cyan })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = black2, bg = yellow, bold = true })

--- LANGUAGE ---
------ LATEX ------
-- vim.api.nvim_set_hl(0, 'latexTSMath', { fg = yellow })
-- vim.api.nvim_set_hl(0, 'latexTSTitle', { fg = blue })
-- vim.api.nvim_set_hl(0, 'latexTSString', { fg = pink })
-- vim.api.nvim_set_hl(0, 'latexTSComment', { fg = black2 })
-- vim.api.nvim_set_hl(0, 'latexTSInclude', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSEmphasis', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSFunction', { fg = pink })
-- vim.api.nvim_set_hl(0, 'latexTSOperator', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSFuncMacro', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSNamespace', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSParameter', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSEnvironment', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSStringRegex', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSPunctBracket', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSPunctSpecial', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSTextReference', { fg = orange })
-- vim.api.nvim_set_hl(0, 'latexTSEnvironmentName', { fg = orange })

------ LUA ------
-- vim.api.nvim_set_hl(0, 'luaTSField', { fg = green })
-- vim.api.nvim_set_hl(0, 'luaTSMethod', { fg = green })
-- vim.api.nvim_set_hl(0, 'luaTSNumber', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSString', { fg = pink })
-- vim.api.nvim_set_hl(0, 'LuaTSBoolean', { fg = orange })
-- vim.api.nvim_set_hl(0, 'LuaTSComment', { fg = black2 })
-- vim.api.nvim_set_hl(0, 'LuaTSKeyword', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSFunction', { fg = pink })
-- vim.api.nvim_set_hl(0, 'luaTSOperator', { fg = orange })
-- vim.api.nvim_set_hl(0, 'LuaTSVariable', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSParameter', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSConditional', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSConstructor', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSPunctBracket', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSPunctDelimiter', { fg = orange })
-- vim.api.nvim_set_hl(0, 'luaTSKeywordFunction', { fg = orange })

------ PYTHON ------
-- vim.api.nvim_set_hl(0, 'pythonTSType', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSField', { fg = green })
-- vim.api.nvim_set_hl(0, 'pythonTSMethod', { fg = green })
-- vim.api.nvim_set_hl(0, 'pythonTSNumber', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSRepeat', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSString', { fg = pink })
-- vim.api.nvim_set_hl(0, 'pythonTSBoolean', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSComment', { fg = black2 })
-- vim.api.nvim_set_hl(0, 'pythonTSInclude', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSKeyword', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSConstant', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSFunction', { fg = pink })
-- vim.api.nvim_set_hl(0, 'pythonTSOperator', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSVariable', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSParameter', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSConditional', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSConstructor', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSFuncBuiltin', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSTypeBuiltin', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSConstBuiltin', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSPunctBracket', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSStringEscape', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordReturn', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSPunctDelimiter', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordFunction', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSKeywordOperator', { fg = orange })
-- vim.api.nvim_set_hl(0, 'pythonTSVariableBuiltin', { fg = orange })

-- plugins --
---------- AERIAL ----------
vim.api.nvim_set_hl(0, 'AerialArrayIcon', { fg = cyan })
vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { fg = yellow })
-- vim.api.nvim_set_hl(0, 'AerialClassIcon', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'AerialConstantIcon', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { fg = purple })
-- vim.api.nvim_set_hl(0, 'AerialEnumIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { fg = orange })
vim.api.nvim_set_hl(0, 'AerialEventIcon', { fg = orange })
vim.api.nvim_set_hl(0, 'AerialFieldIcon', { fg = sun })
vim.api.nvim_set_hl(0, 'AerialFileIcon', { fg = folder_bg })
-- vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { link = 'Function' })
-- vim.api.nvim_set_hl(0, 'AerialInterfaceIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialKeyIcon', { fg = orange })
vim.api.nvim_set_hl(0, 'AerialMethodIcon', { fg = pink })
-- vim.api.nvim_set_hl(0, 'AerialModuleIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialNamespaceIcon', { fg = dark_purple })
-- vim.api.nvim_set_hl(0, 'AerialNullIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialNumberIcon', { fg = yellow })
vim.api.nvim_set_hl(0, 'AerialObjectIcon', { fg = orange })
vim.api.nvim_set_hl(0, 'AerialOperatorIcon', { fg = purple })
-- vim.api.nvim_set_hl(0, 'AerialPackageIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialPropertyIcon', { fg = yellow })
vim.api.nvim_set_hl(0, 'AerialStringIcon', { fg = green })
vim.api.nvim_set_hl(0, 'AerialStructIcon', { fg = orange })
vim.api.nvim_set_hl(0, 'AerialTypeParameterIcon', { fg = sun })
vim.api.nvim_set_hl(0, 'AerialVariableIcon', { fg = cyan })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = white })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = nord_blue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = lightbg2, strikethrough = true })
-- vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = nord_blue })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = white })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = sun })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cyan })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = purple })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = sun })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = folder_bg })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = folder_bg })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = dark_purple })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = purple })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = sun })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = purple })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = sun })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = purple })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = teal })

-------- INDENT BLANKLINES --------
-- vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = line })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = line })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', { fg = line })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = light_grey })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { sp = light_grey, underdash = true })

--------- NEOTREE ---------

-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { fg = folder_bg })
-- vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { fg = folder_bg })
-- vim.api.nvim_set_hl(0, 'NeoTreeNormal', { fg = white, bg = black })
-- vim.api.nvim_set_hl(0, 'NeoTreeIndentMarker', { fg = grey })
-- vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = pink, bold = true })
-- vim.api.nvim_set_hl(0, 'NeoTreeSymbolicLinkTarget', { fg = pink })
-- vim.api.nvim_set_hl(0, 'NeoTreeGitModified', { fg = yellow })
-- vim.api.nvim_set_hl(0, 'NeoTreeUntracked', { fg = folder_bg })
-- vim.api.nvim_set_hl(0, 'NeoTreeFileNameOpened', { fg = pink })

---------- NVIM NOTIFY ----------
-- vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = red })
-- vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = orange })
-- vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = yellow })
-- vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = grey })
-- vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = purple })

-- vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = red })
-- vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = orange })
-- vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = yellow })
-- vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = grey })
-- vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = purple })

-- vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = red, italic = true })
-- vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = orange, italic = true })
-- vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = yellow, italic = true })
-- vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = grey, italic = true })
-- vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = purple, italic = true })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = vibrant_green })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = red })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = orange })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = yellow })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = green })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = blue })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = purple })

------------ TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = darker_black })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = white, bg = black2 })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = darker_black, bg = darker_black })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = black2, bg = black2 })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = red, bg = black2 })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = black, bg = green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = black, bg = red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = darker_black, bg = blue })

-- if transparency then
-- 	vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = one_bg, bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'TelescopePrompt', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'TelescopeResults', { bg = 'NONE' })
-- 	vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = black, bg = blue })
-- end
