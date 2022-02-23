local highlight = function(colors)
	for name, opts in pairs(colors) do
		vim.api.nvim_set_hl(0, name, opts)
	end
end

vim.g.colors_name = 'moon'

local cp = require('colors')

---------- GROUPS ----------

highlight {
	ColorColumn = { bg = cp.black3 }, -- used for the columns set with 'colorcolumn'
	Conceal = { fg = cp.gray1 }, -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor = { fg = cp.black2, bg = cp.white }, -- character under the cursor
	lCursor = { link = 'Cursor' }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	CursorIM = { link = 'Cursor' }, -- like Cursor, but used when in IME mode |CursorIM|
	CursorColumn = { bg = cp.black1 }, -- used for the vertical bar at the right of the cursor
	CursorLine = { bg = cp.black3 }, -- used for the horizontal bar at the bottom of the cursor

	Directory = { fg = cp.blue }, -- used for the directory name in the quickfix window
	DiffAdd = { fg = cp.diff.added }, -- used for lines in a diff that have been added
	DiffChange = { fg = cp.diff.changed }, -- used for lines in a diff that have been changed
	DiffDelete = { fg = cp.diff.deleted }, -- used for lines in a diff that have been deleted
	DiffText = { fg = cp.blue, bg = cp.black2 }, -- used for lines in a diff that are not changed

	-- EndOfBuffer = { link = 'NonText' }, -- filler lines (~) after the end of the buffer.
	-- By default, this is highlighted like |hl-NonText|.
	-- TermCursor = {}, -- cursor in a focused terminal
	-- TermCursorNC = {}, -- cursor in a unfocused terminal

	ErrorMsg = { fg = cp.diag.error, bold = true, italic = true }, -- error messages on the command line
	VertSplit = { fg = cp.black0 }, -- the column separating vertically split windows
	Folded = { fg = cp.blue, bg = cp.black4 }, -- line used for closed folds
	FoldColumn = { fg = cp.gray0, bg = cp.black2 }, -- 'foldcolumn'
	SignColumn = { fg = cp.black4, bg = cp.black2 }, -- column where |signs| are displayed
	IncSearch = { fg = cp.black4, bg = cp.pink },
	-- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	Substitute = { fg = cp.white, bg = cp.diff.deleted }, -- |:substitute| replacement text highlighting

	LineNr = { fg = cp.black4 },
	-- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
	-- LineNrAbove = {}, -- Line number for when the 'relativenumber' option is set, above the cursor line.
	-- LineNrBelow = {}, -- Line number for when the 'relativenumber' option is set, below the cursor line.
	CursorLineNr = { fg = cp.diag.warning, bg = 'NONE', bold = true },
	-- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
	-- CursorLineSign = {}, -- Like SignColumn when 'cursorline' is set for the cursor line.
	-- CursorLineFold = {}, -- Like FoldColumn when 'cursorline' is set for the cursor line.

	MatchParen = { bg = cp.black3, bold = true },
	-- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	ModeMsg = { fg = cp.white, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = { fg = cp.white }, -- Area for messages and cmdline
	-- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = cp.blue, bold = true }, -- |more-prompt|
	NonText = { fg = cp.gray0 },
	-- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text
	-- (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

	Normal = { fg = cp.white, bg = cp.black2 }, -- normal text
	NormalFloat = { fg = cp.white, bg = cp.black1 }, -- Normal text in floating windows.
	NormalNC = { fg = cp.white, bg = cp.black2 }, -- normal text in non-current windows

	Pmenu = { fg = cp.gray2, bg = cp.black3 }, -- Popup menu: normal item.
	PmenuSel = { fg = cp.white, bg = cp.black4, bold = true }, -- Popup menu: selected item.
	PmenuSbar = { bg = cp.black4 }, -- Popup menu: scrollbar.
	PmenuThumb = { bg = cp.gray0 }, -- Popup menu: Thumb of the scrollbar.

	Question = { fg = cp.blue }, -- |hit-enter| prompt and yes/no questions
	QuickFixLine = { bg = cp.black4, bold = true },
	-- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

	Search = { fg = cp.pink, bg = cp.black4, bold = true },
	-- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
	SpecialKey = { link = 'NonText' },
	-- Unprintable characters: text displayed differently from what it really is.
	-- But not 'listchars' whitespace. |hl-Whitespace|

	SpellBad = { undercurl = true, sp = cp.diag.error },
	-- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
	SpellCap = { undercurl = true, sp = cp.yellow },
	-- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
	SpellLocal = { undercurl = true, sp = cp.blue },
	-- Word that is recognized by the spellchecker as one that is used in another region.
	-- |spell| Combined with the highlighting used otherwise.
	SpellRare = { undercurl = true, sp = cp.green },
	-- Word that is recognized by the spellchecker as one that is hardly ever used.
	-- |spell| Combined with the highlighting used otherwise.

	StatusLine = { fg = cp.white, bg = cp.black1 }, -- status line of current window
	StatusLineNC = { fg = cp.black4, bg = cp.black1 },
	-- status lines of not-current windows
	-- Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	TabLine = { fg = cp.black4, bg = cp.black1 }, -- tab pages line, not active tab page label
	TabLineFill = { fg = cp.gray0, bg = cp.black0 }, -- tab pages line, where there are no labels
	TabLineSel = { fg = cp.black0, bg = cp.red }, -- tab pages line, active tab page label

	Title = { fg = cp.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etcp.
	Visual = { bg = cp.black4 }, -- Visual mode selection
	VisualNOS = { bg = cp.black4, underline = true }, -- Visual mode selection when vim is "Not Owning the Selection".

	WarningMsg = { fg = cp.yellow }, -- warning messages
	Whitespace = { fg = cp.black4 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
	WildMenu = { link = 'Pmenu' }, -- current match in 'wildmenu' completion

	-- syntax groups
	-- These groups are not listed as default vim groups,
	-- but they are defacto standard group names for syntax highlighting.
	-- commented out groups should chain up to their "preferred" group by default,
	-- Uncomment and edit if you want more specific syntax highlighting.

	Comment = { fg = cp.gray0, italic = true }, -- any comment

	Constant = { fg = cp.yellow }, -- any constant
	String = { fg = cp.yellow }, -- a string constant: "this is a string"
	Character = { fg = cp.yellow }, -- a character constant: 'c', '\n'
	Number = { fg = cp.peach }, -- a number constant: 234,    0xff
	Boolean = { fg = cp.lavender }, -- a boolean constant: TRUE,  false
	Float = { fg = cp.lavender }, -- a floating point constant: 2.3e10

	Identifier = { fg = cp.flamingo, italic = true }, -- any variable name
	Function = { fg = cp.blue, italic = true }, -- function name (also: methods for classes)

	Statement = { fg = cp.green }, -- any statement
	Conditional = { fg = cp.red }, -- if, then, else, endif, switch, etc.
	Repeat = { fg = cp.red }, -- for, do, while, etc.
	Label = { fg = cp.lavender }, -- case, default, etc.
	Operator = { fg = cp.sky }, -- "sizeof", "+", "*", etc.
	Keyword = { fg = cp.pink, italic = true }, -- any other keyword
	Exception = { fg = cp.red }, -- try, catch, throw

	PreProc = { fg = cp.red }, -- generic Preprocessor
	Include = { fg = cp.red }, -- preprocessor #include
	Define = { fg = cp.red }, -- preprocessor #define
	Macro = { fg = cp.lavender }, -- same as Define
	PreCondit = { fg = cp.blue }, -- preprocessor #if, #else, #endif, etc.

	Type = { fg = cp.blue }, -- int, long, char, etc.
	StorageClass = { fg = cp.blue }, -- static, register, volatile, etc.
	Structure = { fg = cp.blue }, -- struct, union, enum, etc.
	Typedef = { fg = cp.red }, -- A typedef

	Special = { fg = cp.yellow }, -- any special symbol
	SpecialChar = { fg = cp.lavender }, -- special character in a constant
	Tag = { fg = cp.yellow }, -- you can use CTRL-] on this
	Delimiter = { fg = cp.white }, -- character that needs attention
	SpecialComment = { fg = cp.gray, italic = true }, -- special things inside a comment
	-- Debug = {}, -- debugging statements

	Underlined = { underline = true }, -- text that stands out, HTML links
	-- Ignore = { fg = cp.gray0 }, -- left blank, hidden |hl-Ignore|
	Error = { fg = cp.diag.error, bg = 'NONE' }, -- any erroneous construct
	Todo = { fg = cp.black2, bg = cp.diag.warning, bold = true },
	-- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

	---------- DIAGNOSTIC ----------

	DiagnosticError = { fg = cp.diag.error, italic = true },
	-- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticWarn = { fg = cp.diag.warning, italic = true },
	-- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticInfo = { fg = cp.diag.info, italic = true },
	-- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticHint = { fg = cp.diag.hint, italic = true },
	-- Used as the base highlight group. Other Diagnostic highlights link to this by default

	DiagnosticVirtualTextError = { fg = cp.diag.error },
	DiagnosticVirtualTextWarn = { fg = cp.diag.warning },
	DiagnosticVirtualTextInfo = { fg = cp.diag.info },
	DiagnosticVirtualTextHint = { fg = cp.diag.hint },

	DiagnosticUnderlineError = { undercurl = true, sp = cp.diag.error },
	DiagnosticUnderlineWarn = { undercurl = true, sp = cp.diag.warning },
	DiagnosticUnderlineInfo = { undercurl = true, sp = cp.diag.info },
	DiagnosticUnderlineHint = { undercurl = true, sp = cp.diag.hint },

	DiagnosticFloatingError = { fg = cp.diag.error },
	DiagnosticFloatingWarn = { fg = cp.diag.warning },
	DiagnosticFloatingInfo = { fg = cp.diag.info },
	DiagnosticFloatingHint = { fg = cp.diag.hint },

	DiagnosticSignError = { fg = cp.diag.error, bg = cp.black2 },
	DiagnosticSignWarn = { fg = cp.diag.warning, bg = cp.black2 },
	DiagnosticSignInfo = { fg = cp.diag.info, bg = cp.black2 },
	DiagnosticSignHint = { fg = cp.diag.hint, bg = cp.black2 },

	---------- NVIM LSPCONFIG ----------

	-- These groups are for the native LSP cliencp.
	-- Some other LSP clients may use these groups, or use their own.
	-- Consult your LSP client's documentation.

	LspReferenceText = { bg = cp.black4 }, -- used for highlighting "text" references
	LspReferenceRead = { link = 'LspReferenceText' }, -- used for highlighting "read" references
	LspReferenceWrite = { link = 'LspReferenceText' }, -- used for highlighting "write" references
	LspCodeLens = { fg = cp.gray0 }, -- virtual text of the codelens
	-- LspCodeLensSeparator = {},
	LspSignatureActiveParameter = { fg = cp.red },
	-- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
}
