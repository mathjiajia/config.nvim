vim.g.colors_name = 'moon'

local cp = {
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
	diag = {
		error = '#FB617E',
		warning = '#FAE3B0',
		info = '#B5E8E0',
		hint = '#9ED06C',
	},
	diff = {
		added = '#ABE9B3',
		changed = '#FAE3B0',
		deleted = '#F28FAD',
	},
}

---------- GROUPS ----------

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.black3 }) -- used for the columns set with 'colorcolumn'
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.gray1 }) -- placeholder characters substituted for concealed text (see 'conceallevel')
vim.api.nvim_set_hl(0, 'Cursor', { fg = cp.black2, bg = cp.white }) -- character under the cursor
vim.api.nvim_set_hl(0, 'lCursor', { link = 'Cursor' }) -- the character under the cursor when |language-mapping| is used (see 'guicursor')
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.black1 }) -- used for the vertical bar at the right of the cursor
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.black3 }) -- used for the horizontal bar at the bottom of the cursor

vim.api.nvim_set_hl(0, 'Directory', { fg = cp.sky }) -- used for the directory name in the quickfix window
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = cp.diff.added }) -- used for lines in a diff that have been added
vim.api.nvim_set_hl(0, 'DiffChange', { fg = cp.diff.changed }) -- used for lines in a diff that have been changed
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = cp.diff.deleted }) -- used for lines in a diff that have been deleted
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.blue, bg = cp.black2 }) -- used for lines in a diff that are not changed

-- vim.api.nvim_set_hl(0, 'EndOfBuffer', {}) -- filler lines (~) after the end of the buffer.
-- By default, this is highlighted like |hl-NonText|.
-- vim.api.nvim_set_hl(0, 'TermCursor', {}) -- cursor in a focused terminal
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {}) -- cursor in a unfocused terminal

vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.diag.error, bold = true, italic = true }) -- error messages on the command line
vim.api.nvim_set_hl(0, 'VertSplit', { fg = cp.black0 }) -- the column separating vertically split windows
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.sky, bg = cp.black4 }) -- line used for closed folds
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.gray0, bg = cp.black2 }) -- 'foldcolumn'
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.black4, bg = cp.black2 }) -- column where |signs| are displayed
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.black4, bg = cp.pink }) -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
vim.api.nvim_set_hl(0, 'Substitute', { fg = cp.white, bg = cp.diff.deleted }) -- |:substitute| replacement text highlighting

vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.gray1 }) -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
-- vim.api.nvim_set_hl(0, 'LineNrAbove', {}) -- Line number for when the 'relativenumber' option is set, above the cursor line.
-- vim.api.nvim_set_hl(0, 'LineNrBelow', {}) -- Line number for when the 'relativenumber' option is set, below the cursor line.
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.diag.warning, bold = true }) -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
-- highlights the number in numberline.
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {}) -- Like SignColumn when 'cursorline' is set for the cursor line.
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {}) -- Like FoldColumn when 'cursorline' is set for the cursor line.

vim.api.nvim_set_hl(0, 'MatchParen', { bg = cp.black3, bold = true }) -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
-- vim.api.nvim_set_hl(0, 'ModeMsg', {}) -- 'showmode' message (e.g., "-- INSERT -- ")
vim.api.nvim_set_hl(0, 'MsgArea', { fg = cp.white }) -- Area for messages and cmdline
-- vim.api.nvim_set_hl(0,'MsgSeparator', {}) -- Separator for scrolled messages, `msgsep` flag of 'display'
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.blue, bold = true }) -- |more-prompt|
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.sky })
-- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text
-- (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

vim.api.nvim_set_hl(0, 'Normal', { fg = cp.white, bg = cp.black2 }) -- normal text
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = cp.white, bg = cp.black1 }) -- Normal text in floating windows.
vim.api.nvim_set_hl(0, 'NormalNC', { fg = cp.white, bg = cp.black2 }) -- normal text in non-current windows

vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.gray2, bg = cp.black3 }) -- Popup menu: normal item.
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = cp.white, bg = cp.black4, bold = true }) -- Popup menu: selected item.
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = cp.black4 }) -- Popup menu: scrollbar.
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.gray0 }) -- Popup menu: Thumb of the scrollbar.

vim.api.nvim_set_hl(0, 'Question', { fg = cp.blue }) -- |hit-enter| prompt and yes/no questions
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.black4, bold = true }) -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

vim.api.nvim_set_hl(0, 'Search', { fg = cp.pink, bg = cp.black4, bold = true }) -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
vim.api.nvim_set_hl(0, 'SpecialKey', { link = 'NonText' }) -- Unprintable characters: text displayed differently from what it really is.
-- But not 'listchars' whitespace. |hl-Whitespace|

vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.diag.error }) -- Word that is not recognized by the spellchecker.
-- |spell| Combined with the highlighting used otherwise.
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.yellow }) -- Word that should start with a capital.
-- |spell| Combined with the highlighting used otherwise.
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.blue }) -- Word that is recognized by the spellchecker as one that is used in another region.
-- |spell| Combined with the highlighting used otherwise.
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.green }) -- Word that is recognized by the spellchecker as one that is hardly ever used.
-- |spell| Combined with the highlighting used otherwise.

vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.black2, bg = cp.black3 }) -- status line of current window
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.gray0, bg = cp.black1 }) -- status lines of not-current windows
-- Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.black0, bg = cp.lavender }) -- tab pages line, not active tab page label
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = cp.gray0, bg = cp.black2 }) -- tab pages line, where there are no labels
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.black0, bg = cp.green }) -- tab pages line, active tab page label

vim.api.nvim_set_hl(0, 'Title', { fg = cp.blue, bold = true }) -- titles for output from ":set all", ":autocmd" etcp.
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.black4 }) -- Visual mode selection
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.black4, underline = true }) -- Visual mode selection when vim is "Not Owning the Selection".

vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.black2, bg = cp.red }) -- warning messages
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.black4 }) -- "nbsp", "space", "tab" and "trail" in 'listchars'
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'Pmenu' }) -- current match in 'wildmenu' completion

-- syntax groups
-- These groups are not listed as default vim groups,
-- but they are defacto standard group names for syntax highlighting.
-- commented out groups should chain up to their "preferred" group by default,
-- Uncomment and edit if you want more specific syntax highlighting.

vim.api.nvim_set_hl(0, 'Comment', { fg = cp.gray0, italic = true }) -- any comment

vim.api.nvim_set_hl(0, 'Constant', { fg = cp.peach }) -- any constant
vim.api.nvim_set_hl(0, 'String', { fg = cp.green }) -- a string constant: "this is a string"
vim.api.nvim_set_hl(0, 'Character', { fg = cp.yellow }) -- a character constant: 'c',  '\n'
vim.api.nvim_set_hl(0, 'Number', { fg = cp.peach, bold = true, italic = true }) -- a number constant: 234,  0xff
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.lavender, bold = true, italic = true }) -- a boolean constant: TRUE, false
vim.api.nvim_set_hl(0, 'Float', { fg = cp.lavender, bold = true, italic = true }) -- a floating point constant: 2.3e10

vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.flamingo, italic = true }) -- any variable name
vim.api.nvim_set_hl(0, 'Function', { fg = cp.pink, italic = true }) -- function name (also: methods for classes)

vim.api.nvim_set_hl(0, 'Statement', { fg = cp.green }) -- any statement
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.mauve, bold = true }) -- if, then, else, endif, switch, etc.
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.mauve, bold = true }) -- for, do, while, etc.
vim.api.nvim_set_hl(0, 'Label', { fg = cp.blue }) -- case, default, etc.
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.sky, bold = true }) -- "sizeof", "+", "*", etc.
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.pink, italic = true }) -- any other keyword
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.peach, italic = true }) -- try, catch, throw

vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.red }) -- generic Preprocessor
vim.api.nvim_set_hl(0, 'Include', { fg = cp.teal, italic = true }) -- preprocessor #include
vim.api.nvim_set_hl(0, 'Define', { fg = cp.red }) -- preprocessor #define
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.red }) -- same as Define
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.blue }) -- preprocessor #if, #else, #endif, etc.

vim.api.nvim_set_hl(0, 'Type', { fg = cp.blue }) -- int, long, char, etc.
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.blue }) -- static, register, volatile, etc.
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.sky }) -- struct, union, enum, etc.
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.red }) -- A typedef

vim.api.nvim_set_hl(0, 'Special', { fg = cp.yellow }) -- any special symbol
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.green }) -- special character in a constant
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.yellow }) -- you can use CTRL-] on this
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.teal }) -- character that needs attention
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.gray, italic = true }) -- special things inside a comment
-- vim.api.nvim_set_hl(0, 'Debug', {}) -- debugging statements

-- vim.api.nvim_set_hl(0, 'Underlined', {}) -- text that stands out, HTML links
-- vim.api.nvim_set_hl(0, 'Ignore', {}) -- left blank, hidden |hl-Ignore|
vim.api.nvim_set_hl(0, 'Error', { fg = cp.diag.error }) -- any erroneous construct
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.black2, bg = cp.diag.warning, bold = true }) -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

---------- DIAGNOSTIC ----------
-- Used as the base highlight group. Other Diagnostic highlights link to this by default
vim.api.nvim_set_hl(0, 'DiagnosticError', { fg = cp.diag.error })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = cp.diag.warning })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { fg = cp.diag.info })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = cp.diag.hint })

---------- NVIM LSPCONFIG ----------

-- These groups are for the native LSP cliencp.
-- Some other LSP clients may use these groups, or use their own.
-- Consult your LSP client's documentation.

vim.api.nvim_set_hl(0, 'LspReferenceText', { bg = cp.black4 }) -- used for highlighting "text" references
vim.api.nvim_set_hl(0, 'LspReferenceRead', { link = 'LspReferenceText' }) -- used for highlighting "read" references
vim.api.nvim_set_hl(0, 'LspReferenceWrite', { link = 'LspReferenceText' }) -- used for highlighting "write" references
-- vim.api.nvim_set_hl(0, 'LspCodeLens', {}) -- virtual text of the codelens
-- vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', {})
-- vim.api.nvim_set_hl(0, 'LspSignatureActiveParameter', {}) -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

---------- CMP ----------
vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.gray2 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.gray0, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link = 'TSConstructor' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSParameterReference' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.lavender })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.gray0 })

---------- NVIM NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { link = 'DiagnosticError' })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { link = 'DiagnosticWarning' })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { link = 'DiagnosticInfo' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { link = 'DiagnosticHint' })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'NotifyERRORBorder' })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'NotifyWARNBorder' })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'NotifyINFOBorder' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.diag.error, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.diag.warning, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.diag.info, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.peach, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.diag.hint, italic = true })

---------- SYMBOLS OUTLINE ----------
vim.api.nvim_set_hl(0, 'FocusedSymbol', { link = 'Search' })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = cp.flamingo, bg = cp.black3 })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.black2, bg = cp.pink })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.black2, bg = cp.rosewater })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.black2, bg = cp.teal })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeFrecencyScores', { fg = cp.maroon })

---------- TREESITTER ----------
-- vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' }) -- Punctuation delimiters: Periods, commas, semicolons, etc.
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.maroon, bold = true }) -- Brackets, braces, parentheses, etc.
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.gray1 }) -- Special punctuation that doesn't fit into the previous categories.

-- vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' }) -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.lavender, italic = true }) -- Built-in constant values: `nil` in Lua.
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.yellow }) -- Constants defined by macros: `NULL` in C.

-- vim.api.nvim_set_hl(0, 'TSString', { link = 'String' }) -- String literals.
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.pink }) -- Escape characters within a string: `\n`, `\t`, etc.
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.peach }) -- Regular expression literals.
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' }) -- Strings with special meaning that don't fit into the previous categories.
-- vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' }) -- Character literals: `'a'` in C.
-- vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' }) -- Numeric literals that don't fit into other categories.
-- vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' }) -- Boolean literals: `True` and `False` in Python.
-- vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' }) -- Floating-point number literals.

-- vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' }) -- Function calls and definitions.
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.peach, italic = true }) -- Built-in functions: `print` in Lua.
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Macro' }) -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.rosewater }) -- Parameters of a function.
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = cp.white }) -- References to parameters of a function.
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.pink, italic = true }) -- Method calls and definitions.
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.rosewater }) -- Object and struct fields.
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.yellow, italic = true }) -- Same as `TSField`.
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.lavender }) -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.blue }) -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.rosewater, bold = true }) -- Identifiers referring to modules and namespaces.
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = cp.white }) -- Identifiers referring to symbols or atoms.

-- vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' }) -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
-- vim.api.nvim_set_hl(0, 'TSRepeat', { link = 'Repeat' }) -- Keywords related to loops: `for`, `while`, etc.
-- vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' }) -- GOTO labels: `label:` in C, and `::label::` in Lua.
-- vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' }) -- Binary or unary operators: `+`, and also `->` and `*` in C.
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.red, italic = true }) -- Keywords that don't fit into other categories.
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.maroon, italic = true }) -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
-- vim.api.nvim_set_hl(0, 'TSKeywordOperator', { link = 'TSOperator' }) -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.pink }) -- Keywords like `return` and `yield`.
-- vim.api.nvim_set_hl(0, 'TSException', { link = 'Exception' }) -- Exception related keywords: `try`, `except`, `finally` in Python.

-- vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' }) -- Type (and class) definitions and annotations.
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow, italic = true }) -- Built-in types: `i32` in Rust.
-- vim.api.nvim_set_hl(0, 'TSInclude', { link = 'Include' }) -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.

vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.teal, italic = true }) -- Variable names defined by the language: `this` or `self` in Javascript.

-- vim.api.nvim_set_hl(0, 'TSText', { link = 'TSNone' }) -- Non-structured text. Like text in a markup language.
vim.api.nvim_set_hl(0, 'TSStrong', { fg = cp.maroon, bold = true }) -- Text to be represented in bold.
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = cp.maroon, italic = true }) -- Text to be represented with emphasis.
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true }) -- Text to be represented with an underline.
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.gray, strikethrough = true }) -- Strikethrough text.

vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow }) -- Math environments like LaTeX's `$ ... $`
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.lavender, bold = true }) -- Footnotes, text references, citations, etc.
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green }) -- Text environments of markup languages.
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.flamingo, italic = true }) -- Text/string indicating the type of text environment. Like the name of a	`\begin` block in LaTeX.
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' }) -- Text that is part of a title.
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.teal, italic = true }) -- Literal or verbatim text.
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.rosewater, italic = true, underline = true }) -- URIs like hyperlinks or email addresses.

-- vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' }) -- Line comments and block comments.
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.black2, bg = cp.blue }) -- Text representation of an informational note.
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.black2, bg = cp.yellow }) -- Text representation of a warning note.
-- vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' }) -- Text representation of a danger note.

vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.peach }) -- Tags like HTML tag names.
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.maroon }) -- Tag delimiters like `<` `>` `/`.
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.mauve, italic = true }) -- HTML tag attributes.

-- vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' }) -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
-- vim.api.nvim_set_hl(0, 'TSNone', {}) -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.white, italic = true }) -- Variable names that don't fit into other categories.
