local colors = require('my_colors').get()
local italic_comments = true
local transparency = false

local black = colors.black
local black2 = colors.black2
local blue = colors.blue
local darker_black = colors.darker_black
local folder_bg = colors.folder_bg
local green = colors.green
local grey = colors.grey
local grey_fg = colors.grey_fg
local light_grey = colors.light_grey
local line = colors.line
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local orange = colors.orange
local one_bg3 = colors.one_bg3
local teal = colors.teal
local statusline_bg = colors.statusline_bg

-- Comments
if italic_comments then
	vim.api.nvim_set_hl(0, 'Comment', { fg = grey_fg, italic = true })
else
	vim.api.nvim_set_hl(0, 'Comment', { fg = grey_fg })
end

-- Disable cursor line
-- vim.cmd('hi clear CursorLine')
-- Line number
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = white })

-- For floating windows
vim.api.nvim_set_hl(0, 'FloatBorder', { fg = blue })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = darker_black })

-- Pmenu
vim.api.nvim_set_hl(0, 'Pmenu', { bg = one_bg })
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = one_bg2 })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = pmenu_bg })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = nord_blue })

-- inactive statuslines as thin lines
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = light_grey, bg = statusline_bg })

vim.api.nvim_set_hl(0, 'LineNr', { fg = grey })
vim.api.nvim_set_hl(0, 'NvimInternalError', { fg = red })
vim.api.nvim_set_hl(0, 'WinSeparator', { fg = one_bg2 })

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

vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = green })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = teal })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = red })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = purple })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = blue })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = blue })

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

-- Disable some highlight in nvim tree if transparency enabled
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
