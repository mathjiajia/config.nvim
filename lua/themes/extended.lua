local colors = require('themes').get()
local italic_comments = true
local transparency = false

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

-- cursor line
vim.api.nvim_set_hl(0, 'CursorLine', { bg = one_bg3 })

-- For floating windows
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = one_bg3 })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = darker_black })

-- Pmenu
vim.api.nvim_set_hl(0, 'Pmenu', { bg = one_bg })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = one_bg2 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = pmenu_bg })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = nord_blue })

-- inactive statuslines
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = light_grey, bg = statusline_bg })

vim.api.nvim_set_hl(0, 'LineNr', { fg = grey })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = line, bg = 'NONE' })

if transparency then
	vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'Folded', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'Folded', { fg = 'NONE' })
	vim.api.nvim_set_hl(0, 'Comment', { fg = grey })
end

---------- DIAGNOSTIC ----------
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = purple })
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = green })

---------- LSP ----------
vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = lightbg }) -- used for highlighting "text" references
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' }) -- used for highlighting "read" references
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' })

---------- AERIAL ----------
vim.api.nvim_set_hl(0, 'AerialArrayIcon', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'AerialBooleanIcon', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'AerialClassIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialConstantIcon', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'AerialConstructorIcon', { link = 'TSConstructor' })
vim.api.nvim_set_hl(0, 'AerialEnumIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialEnumMemberIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialEventIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialFieldIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialFileIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialFunctionIcon', { link = 'Function' })
vim.api.nvim_set_hl(0, 'AerialInterfaceIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialKeyIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialMethodIcon', { link = 'TSMethod' })
vim.api.nvim_set_hl(0, 'AerialModuleIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialNamespaceIcon', { link = 'TSNamespace' })
-- vim.api.nvim_set_hl(0, 'AerialNullIcon', { link = 'Type' })
vim.api.nvim_set_hl(0, 'AerialNumberIcon', { link = 'Number' })
vim.api.nvim_set_hl(0, 'AerialObjectIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialOperatorIcon', { link = '' })
vim.api.nvim_set_hl(0, 'AerialPackageIcon', { link = 'Include' })
vim.api.nvim_set_hl(0, 'AerialPropertyIcon', { link = 'TSProperty' })
vim.api.nvim_set_hl(0, 'AerialStringIcon', { link = 'String' })
vim.api.nvim_set_hl(0, 'AerialStructIcon', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'AerialTypeParameterIcon', { link = 'TSParameter' })
vim.api.nvim_set_hl(0, 'AerialVariableIcon', { link = 'TSVariableBuiltin' })

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = white })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = white, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = grey_fg, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = white, bold = true })
vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = white })

vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = orange })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cyan })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = purple })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = purple })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = teal })

-------- INDENT BLANKLINES --------
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = line })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { fg = line })

---------- NVIM NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { fg = red })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { fg = orange })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { fg = yellow })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = grey })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { fg = purple })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { fg = red })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { fg = orange })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { fg = yellow })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = grey })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { fg = purple })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = red, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = orange, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = yellow, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = grey, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = purple, italic = true })

---------- RAINBOW ----------
vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = red })
vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = orange })
vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = yellow })
vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = green })
vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = blue })
vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = purple })
vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = green })

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = darker_black, bg = darker_black })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = black2, bg = black2 })

vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = white, bg = black2 })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = red, bg = black2 })

vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = darker_black })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = black, bg = green })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = black, bg = red })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = darker_black, bg = blue })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = blue })
-- vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' })
-- vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' })
-- vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' })
-- vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = purple })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = yellow })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = purple })
-- vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = baby_pink, italic = true })
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = green })
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = orange, italic = true })
vim.api.nvim_set_hl(0, 'TSError', { fg = purple })
vim.api.nvim_set_hl(0, 'TSException', { fg = purple })
vim.api.nvim_set_hl(0, 'TSField', { fg = white })
-- vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = orange })
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Marco' })
-- vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' })
-- vim.api.nvim_set_hl(0, 'TSInclude', { link = 'Include' })
-- vim.api.nvim_set_hl(0, 'TSKeyword', { link = 'Keyword' })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = baby_pink, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cyan, italic = true })
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = pink, bold = true })
-- vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cyan })
vim.api.nvim_set_hl(0, 'TSMath', { fg = yellow })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = pink })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = dark_purple })
-- vim.api.nvim_set_hl(0, 'TSNone', {})
vim.api.nvim_set_hl(0, 'TSNote', { fg = black, bg = cyan, bold = true })
-- vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' })
-- vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = sun })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = white })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = sun })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = baby_pink })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = teal })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = grey_fg2 })
-- vim.api.nvim_set_hl(0, 'TSRepeat', { link = 'Repeat' })
vim.api.nvim_set_hl(0, 'TSStrike', { fg = black, strikethrough = true })
-- vim.api.nvim_set_hl(0, 'TSString', { link = 'String' })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = pink })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = orange })
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' })
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true })
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = white })
vim.api.nvim_set_hl(0, 'TSTag', { fg = cyan, italic = true })
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = red })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = teal })
-- vim.api.nvim_set_hl(0, 'TSText', { link = 'TSNone' })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = sun })
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' })
-- vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cyan, italic = true })
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = cyan, underline = true })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = orange })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = purple, italic = true })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cyan })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = black2, bg = yellow, bold = true })

-- Disable some highlight in Telescope if transparency enabled
if transparency then
	vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'NONE' })

	---------- TELESCOPE ----------
	vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = one_bg, bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopePrompt', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeResults', { bg = 'NONE' })
	vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = black, bg = blue })
end
