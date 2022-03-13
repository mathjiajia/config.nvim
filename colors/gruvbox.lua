vim.g.colors_name = 'gruvbox'

local cp = {
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
}

---------- GROUPS ----------

vim.api.nvim_set_hl(0, 'ColorColumn', { bg = cp.bg2 }) -- used for the columns set with 'colorcolumn'
vim.api.nvim_set_hl(0, 'Conceal', { fg = cp.grey0 }) -- placeholder characters substituted for concealed text (see 'conceallevel')
vim.api.nvim_set_hl(0, 'Cursor', { reverse = true }) -- character under the cursor
vim.api.nvim_set_hl(0, 'lCursor', { link = 'Cursor' }) -- the character under the cursor when |language-mapping| is used (see 'guicursor')
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = cp.bg1 }) -- used for the vertical bar at the right of the cursor
vim.api.nvim_set_hl(0, 'CursorLine', { bg = cp.bg1 }) -- used for the horizontal bar at the bottom of the cursor

vim.api.nvim_set_hl(0, 'Directory', { fg = cp.green }) -- used for the directory name in the quickfix window
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = cp.bg_diff_green }) -- used for lines in a diff that have been added
vim.api.nvim_set_hl(0, 'DiffChange', { bg = cp.bg_diff_blue }) -- used for lines in a diff that have been changed
vim.api.nvim_set_hl(0, 'DiffDelete', { bg = cp.bg_diff_red }) -- used for lines in a diff that have been deleted
vim.api.nvim_set_hl(0, 'DiffText', { fg = cp.bg0, bg = cp.blue }) -- used for lines in a diff that are not changed

-- vim.api.nvim_set_hl(0, 'EndOfBuffer', {}) -- filler lines (~) after the end of the buffer.
-- By default, this is highlighted like |hl-NonText|.
-- vim.api.nvim_set_hl(0, 'TermCursor', {}) -- cursor in a focused terminal
-- vim.api.nvim_set_hl(0, 'TermCursorNC', {}) -- cursor in a unfocused terminal

vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = cp.red, bold = true, underline = true }) -- error messages on the command line
vim.api.nvim_set_hl(0, 'VertSplit', { fg = cp.bg5 }) -- the column separating vertically split windows
vim.api.nvim_set_hl(0, 'Folded', { fg = cp.grey1, bg = cp.bg2 }) -- line used for closed folds
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = cp.grey1 }) -- 'foldcolumn'
vim.api.nvim_set_hl(0, 'SignColumn', { fg = cp.fg0 }) -- column where |signs| are displayed
vim.api.nvim_set_hl(0, 'IncSearch', { fg = cp.bg0, bg = cp.bg_red }) -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
vim.api.nvim_set_hl(0, 'Substitute', { bg = cp.yellow }) -- |:substitute| replacement text highlighting

vim.api.nvim_set_hl(0, 'LineNr', { fg = cp.grey0 }) -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
-- vim.api.nvim_set_hl(0, 'LineNrAbove', {}) -- Line number for when the 'relativenumber' option is set, above the cursor line.
-- vim.api.nvim_set_hl(0, 'LineNrBelow', {}) -- Line number for when the 'relativenumber' option is set, below the cursor line.
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = cp.grey2 }) -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
-- highlights the number in numberline.
-- vim.api.nvim_set_hl(0, 'CursorLineSign', {}) -- Like SignColumn when 'cursorline' is set for the cursor line.
-- vim.api.nvim_set_hl(0, 'CursorLineFold', {}) -- Like FoldColumn when 'cursorline' is set for the cursor line.

vim.api.nvim_set_hl(0, 'MatchParen', { bg = cp.bg4, bold = true }) -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = cp.fg0, bold = true }) -- 'showmode' message (e.g., "-- INSERT -- ")
vim.api.nvim_set_hl(0, 'MsgArea', { fg = cp.fg0 }) -- Area for messages and cmdline
-- vim.api.nvim_set_hl(0,'MsgSeparator', {}) -- Separator for scrolled messages, `msgsep` flag of 'display'
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = cp.yellow, bold = true }) -- |more-prompt|
vim.api.nvim_set_hl(0, 'NonText', { fg = cp.bg5 })
-- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text
-- (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

vim.api.nvim_set_hl(0, 'Normal', { fg = cp.fg0, bg = cp.bg0 }) -- normal text
vim.api.nvim_set_hl(0, 'NormalFloat', { fg = cp.fg0, bg = cp.bg2 }) -- Normal text in floating windows.
vim.api.nvim_set_hl(0, 'NormalNC', { fg = cp.fg0, bg = cp.bg0 }) -- normal text in non-current windows

vim.api.nvim_set_hl(0, 'Pmenu', { fg = cp.fg1, bg = cp.bg3 }) -- Popup menu: normal item.
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = cp.bg3, bg = cp.grey2 }) -- Popup menu: selected item.
vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = cp.black4 }) -- Popup menu: scrollbar.
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = cp.grey0 }) -- Popup menu: Thumb of the scrollbar.

vim.api.nvim_set_hl(0, 'Question', { fg = cp.yellow }) -- |hit-enter| prompt and yes/no questions
vim.api.nvim_set_hl(0, 'QuickFixLine', { bg = cp.purple, bold = true }) -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

vim.api.nvim_set_hl(0, 'Search', { fg = cp.bg0, bg = cp.bg_green }) -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = cp.bg5 }) -- Unprintable characters: text displayed differently from what it really is.
-- But not 'listchars' whitespace. |hl-Whitespace|

vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = cp.red }) -- Word that is not recognized by the spellchecker.
-- |spell| Combined with the highlighting used otherwise.
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = cp.blue }) -- Word that should start with a capital.
-- |spell| Combined with the highlighting used otherwise.
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = cp.aqua }) -- Word that is recognized by the spellchecker as one that is used in another region.
-- |spell| Combined with the highlighting used otherwise.
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = cp.purple }) -- Word that is recognized by the spellchecker as one that is hardly ever used.
-- |spell| Combined with the highlighting used otherwise.

vim.api.nvim_set_hl(0, 'StatusLine', { fg = cp.fg1, bg = cp.bg_statusline1 }) -- status line of current window
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = cp.grey1, bg = cp.bg_statusline1 }) -- status lines of not-current windows
-- Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
vim.api.nvim_set_hl(0, 'TabLine', { fg = cp.fg1, bg = cp.bg_statusline3 }) -- tab pages line, not active tab page label
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = cp.fg1, bg = cp.bg0 }) -- tab pages line, where there are no labels
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = cp.bg0, bg = cp.grey2 }) -- tab pages line, active tab page label

vim.api.nvim_set_hl(0, 'Title', { fg = cp.orange, bold = true }) -- titles for output from ":set all", ":autocmd" etcp.
vim.api.nvim_set_hl(0, 'Visual', { bg = cp.bg3 }) -- Visual mode selection
vim.api.nvim_set_hl(0, 'VisualNOS', { bg = cp.bg3 }) -- Visual mode selection when vim is "Not Owning the Selection".

vim.api.nvim_set_hl(0, 'WarningMsg', { fg = cp.yellow, bold = true }) -- warning messages
vim.api.nvim_set_hl(0, 'Whitespace', { fg = cp.bg5 }) -- "nbsp", "space", "tab" and "trail" in 'listchars'
vim.api.nvim_set_hl(0, 'WildMenu', { link = 'PmenuSel' }) -- current match in 'wildmenu' completion

-- syntax groups
-- These groups are not listed as default vim groups,
-- but they are defacto standard group names for syntax highlighting.
-- commented out groups should chain up to their "preferred" group by default,
-- Uncomment and edit if you want more specific syntax highlighting.

vim.api.nvim_set_hl(0, 'Comment', { fg = cp.grey1, italic = true }) -- any comment

vim.api.nvim_set_hl(0, 'Constant', { fg = cp.aqua, italic = true }) -- any constant
vim.api.nvim_set_hl(0, 'String', { fg = cp.green }) -- a string constant: "this is a string"
vim.api.nvim_set_hl(0, 'Character', { fg = cp.green }) -- a character constant: 'c',  '\n'
vim.api.nvim_set_hl(0, 'Number', { fg = cp.purple }) -- a number constant: 234,  0xff
vim.api.nvim_set_hl(0, 'Boolean', { fg = cp.purple }) -- a boolean constant: TRUE, false
vim.api.nvim_set_hl(0, 'Float', { fg = cp.purple }) -- a floating point constant: 2.3e10

vim.api.nvim_set_hl(0, 'Identifier', { fg = cp.blue }) -- any variable name
vim.api.nvim_set_hl(0, 'Function', { fg = cp.green, bold = true }) -- function name (also: methods for classes)

vim.api.nvim_set_hl(0, 'Statement', { fg = cp.red, italic = true }) -- any statement
vim.api.nvim_set_hl(0, 'Conditional', { fg = cp.red, italic = true }) -- if, then, else, endif, switch, etc.
vim.api.nvim_set_hl(0, 'Repeat', { fg = cp.red, italic = true }) -- for, do, while, etc.
vim.api.nvim_set_hl(0, 'Label', { fg = cp.purple }) -- case, default, etc.
vim.api.nvim_set_hl(0, 'Operator', { fg = cp.red }) -- "sizeof", "+", "*", etc.
vim.api.nvim_set_hl(0, 'Keyword', { fg = cp.red, italic = true }) -- any other keyword
vim.api.nvim_set_hl(0, 'Exception', { fg = cp.red, italic = true }) -- try, catch, throw

vim.api.nvim_set_hl(0, 'PreProc', { fg = cp.purple, italic = true }) -- generic Preprocessor
vim.api.nvim_set_hl(0, 'Include', { fg = cp.purple, italic = true }) -- preprocessor #include
vim.api.nvim_set_hl(0, 'Define', { fg = cp.purple, italic = true }) -- preprocessor #define
vim.api.nvim_set_hl(0, 'Macro', { fg = cp.aqua }) -- same as Define
vim.api.nvim_set_hl(0, 'PreCondit', { fg = cp.purple, italic = true }) -- preprocessor #if, #else, #endif, etc.

vim.api.nvim_set_hl(0, 'Type', { fg = cp.yellow }) -- int, long, char, etc.
vim.api.nvim_set_hl(0, 'StorageClass', { fg = cp.orange }) -- static, register, volatile, etc.
vim.api.nvim_set_hl(0, 'Structure', { fg = cp.orange }) -- struct, union, enum, etc.
vim.api.nvim_set_hl(0, 'Typedef', { fg = cp.red }) -- A typedef

vim.api.nvim_set_hl(0, 'Special', { fg = cp.yellow }) -- any special symbol
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = cp.yellow }) -- special character in a constant
vim.api.nvim_set_hl(0, 'Tag', { fg = cp.orange }) -- you can use CTRL-] on this
vim.api.nvim_set_hl(0, 'Delimiter', { fg = cp.fg0 }) -- character that needs attention
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = cp.grey1, italic = true }) -- special things inside a comment
-- vim.api.nvim_set_hl(0, 'Debug', {}) -- debugging statements

-- vim.api.nvim_set_hl(0, 'Underlined', {}) -- text that stands out, HTML links
-- vim.api.nvim_set_hl(0, 'Ignore', {}) -- left blank, hidden |hl-Ignore|
vim.api.nvim_set_hl(0, 'Error', { fg = cp.red }) -- any erroneous construct
vim.api.nvim_set_hl(0, 'Todo', { fg = cp.blue, italic = true }) -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

---------- DIAGNOSTIC ----------
-- Used as the base highlight group. Other Diagnostic highlights link to this by default
vim.api.nvim_set_hl(0, 'DiagnosticError', { bg = cp.bg_visual_red, undercurl = true, sp = cp.red })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { bg = cp.bg_visual_yellow, undercurl = true, sp = cp.yellow })
vim.api.nvim_set_hl(0, 'DiagnosticInfo', { bg = cp.bg_visual_blue, undercurl = true, sp = cp.blue })
vim.api.nvim_set_hl(0, 'DiagnosticHint', { bg = cp.bg_visual_green, undercurl = true, sp = cp.green })

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

---------- NVIM NOTIFY ----------
vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { link = 'DiagnosticError' })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { link = 'DiagnosticWarning' })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { link = 'DiagnosticInfo' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.grey1 })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { link = 'DiagnosticHint' })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'NotifyERRORBorder' })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'NotifyWARNBorder' })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'NotifyINFOBorder' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.red, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.yellow, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.green, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.grey, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.purple, italic = true })

---------- TELESCOPE ----------
vim.api.nvim_set_hl(0, 'TelescopeSelection', { link = 'DiffAdd' })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = cp.bg2, bg = cp.red })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = cp.bg2, bg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = cp.bg2, bg = cp.green })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeFrecencyScores', { fg = cp.red })

---------- TREESITTER ----------
-- These groups are for the neovim tree-sitter highlights.
-- As of writing, tree-sitter support is a WIP, group names may change.
-- By default, most of these groups link to an appropriate Vim group,
-- TSError -> Error for example, so you do not have to define these unless
-- you explicitly want to support Treesitter's improved syntax awareness.

-- vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { link = 'Delimiter' }) -- Punctuation delimiters: Periods, commas, semicolons, etc.
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.fg }) -- Brackets, braces, parentheses, etc.
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.blue }) -- Special punctuation that doesn't fit into the previous categories.

-- vim.api.nvim_set_hl(0, 'TSConstant', { link = 'Constant' }) -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.blue, italic = true }) -- Built-in constant values: `nil` in Lua.
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.blue, italic = true }) -- Constants defined by macros: `NULL` in C.

-- vim.api.nvim_set_hl(0, 'TSString', { link = 'String' }) -- String literals.
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.green }) -- Escape characters within a string: `\n`, `\t`, etc.
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.green }) -- Regular expression literals.
-- vim.api.nvim_set_hl(0, 'TSStringSpecial', { link = 'SpecialChar' }) -- Strings with special meaning that don't fit into the previous categories.
-- vim.api.nvim_set_hl(0, 'TSCharacter', { link = 'Character' }) -- Character literals: `'a'` in C.
-- vim.api.nvim_set_hl(0, 'TSNumber', { link = 'Number' }) -- Numeric literals that don't fit into other categories.
-- vim.api.nvim_set_hl(0, 'TSBoolean', { link = 'Boolean' }) -- Boolean literals: `True` and `False` in Python.
-- vim.api.nvim_set_hl(0, 'TSFloat', { link = 'Float' }) -- Floating-point number literals.

-- vim.api.nvim_set_hl(0, 'TSFunction', { link = 'Function' }) -- Function calls and definitions.
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.green, bold = true }) -- Built-in functions: `print` in Lua.
-- vim.api.nvim_set_hl(0, 'TSFuncMacro', { link = 'Macro' }) -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.fg }) -- Parameters of a function.
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = cp.fg }) -- References to parameters of a function.
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.green, bold = true }) -- Method calls and definitions.
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.green }) -- Object and struct fields.
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.fg }) -- Same as `TSField`.
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.green, bold = true }) -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
-- vim.api.nvim_set_hl(0, 'TSAnnotation', {})
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.purple }) -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.yellow, italic = true }) -- Identifiers referring to modules and namespaces.
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = cp.fg }) -- Identifiers referring to symbols or atoms.

-- vim.api.nvim_set_hl(0, 'TSConditional', { link = 'Conditional' }) -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
-- vim.api.nvim_set_hl(0, 'TSRepeat', { link = 'Repeat' }) -- Keywords related to loops: `for`, `while`, etc.
-- vim.api.nvim_set_hl(0, 'TSLabel', { link = 'Label' }) -- GOTO labels: `label:` in C, and `::label::` in Lua.
-- vim.api.nvim_set_hl(0, 'TSOperator', { link = 'Operator' }) -- Binary or unary operators: `+`, and also `->` and `*` in C.
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.red }) -- Keywords that don't fit into other categories.
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.red }) -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
-- vim.api.nvim_set_hl(0, 'TSKeywordOperator', { link = 'TSOperator' }) -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.orange }) -- Keywords like `return` and `yield`.
-- vim.api.nvim_set_hl(0, 'TSException', { link = 'Exception' }) -- Exception related keywords: `try`, `except`, `finally` in Python.

-- vim.api.nvim_set_hl(0, 'TSType', { link = 'Type' }) -- Type (and class) definitions and annotations.
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow, italic = true }) -- Built-in types: `i32` in Rust.
-- vim.api.nvim_set_hl(0, 'TSInclude', { link = 'Include' }) -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.

vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.blue, italic = true }) -- Variable names defined by the language: `this` or `self` in Javascript.

-- vim.api.nvim_set_hl(0, 'TSText', { link = 'TSNone' }) -- Non-structured text. Like text in a markup language.
vim.api.nvim_set_hl(0, 'TSStrong', { bold = true }) -- Text to be represented in bold.
vim.api.nvim_set_hl(0, 'TSEmphasis', { italic = true }) -- Text to be represented with emphasis.
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true }) -- Text to be represented with an underline.
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.grey1, strikethrough = true }) -- Strikethrough text.

vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow }) -- Math environments like LaTeX's `$ ... $`
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.purple, bold = true }) -- Footnotes, text references, citations, etc.
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green }) -- Text environments of markup languages.
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.blue, italic = true }) -- Text/string indicating the type of text environment. Like the name of a	`\begin` block in LaTeX.
-- vim.api.nvim_set_hl(0, 'TSTitle', { link = 'Title' }) -- Text that is part of a title.
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.green }) -- Literal or verbatim text.
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.blue, underline = true }) -- URIs like hyperlinks or email addresses.

-- vim.api.nvim_set_hl(0, 'TSComment', { link = 'Comment' }) -- Line comments and block comments.
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.bg0, bg = cp.blue, bold = true }) -- Text representation of an informational note.
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.bg0, bg = cp.yellow, bold = true }) -- Text representation of a warning note.
-- vim.api.nvim_set_hl(0, 'TSDanger', { link = 'WarningMsg' }) -- Text representation of a danger note.

vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.orange }) -- Tags like HTML tag names.
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.green }) -- Tag delimiters like `<` `>` `/`.
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.red }) -- HTML tag attributes.

-- vim.api.nvim_set_hl(0, 'TSError', { link = 'Error' }) -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
-- vim.api.nvim_set_hl(0, 'TSNone', {}) -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.fg }) -- Variable names that don't fit into other categories.
