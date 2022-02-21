local highlight = function(colors)
	for name, opts in pairs(colors) do
		vim.api.nvim_set_hl(0, name, opts)
	end
end

vim.g.colors_name = 'moon'

---------- COLOR PALETTE ----------

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

	-- Diagnostic Colors
	diag = {
		error = '#FB617E',
		warning = '#FAE3B0',
		info = '#B5E8E0',
		hint = '#9ed06c',
	},
	-- Git & Diff Colors
	diff = {
		added = '#ABE9B3',
		changed = '#FAE3B0',
		deleted = '#F28FAD',
	},
}

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

	EndOfBuffer = { link = 'NonText' }, -- filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
	-- TermCursor = {}, -- cursor in a focused terminal
	-- TermCursorNC = {}, -- cursor in a unfocused terminal

	ErrorMsg = { fg = cp.diag.error, bold = true, italic = true }, -- error messages on the command line
	VertSplit = { fg = cp.black0 }, -- the column separating vertically split windows
	Folded = { fg = cp.blue, bg = cp.black4 }, -- line used for closed folds
	FoldColumn = { fg = cp.gray0, bg = cp.black2 }, -- 'foldcolumn'
	SignColumn = { fg = cp.black4, bg = cp.black2 }, -- column where |signs| are displayed
	IncSearch = { fg = cp.black4, bg = cp.pink }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	Substitute = { fg = cp.white, bg = cp.diff.deleted }, -- |:substitute| replacement text highlighting

	LineNr = { fg = cp.black4 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
	-- LineNrAbove = {}, -- Line number for when the 'relativenumber' option is set, above the cursor line.
	-- LineNrBelow = {}, -- Line number for when the 'relativenumber' option is set, below the cursor line.
	CursorLineNr = { fg = cp.diag.warning, bg = NONE, bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
	-- CursorLineSign = {}, -- Like SignColumn when 'cursorline' is set for the cursor line.
	-- CursorLineFold = {}, -- Like FoldColumn when 'cursorline' is set for the cursor line.

	MatchParen = { bg = cp.black3, bold = true }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	ModeMsg = { fg = cp.white, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = { fg = cp.white }, -- Area for messages and cmdline
	-- MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = cp.blue, bold = true }, -- |more-prompt|
	NonText = { fg = cp.gray0 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

	Normal = { fg = cp.white, bg = cp.black2 }, -- normal text
	NormalFloat = { fg = cp.white, bg = cp.black1 }, -- Normal text in floating windows.
	NormalNC = { fg = cp.white, bg = cp.black2 }, -- normal text in non-current windows

	Pmenu = { fg = cp.gray2, bg = cp.black3 }, -- Popup menu: normal item.
	PmenuSel = { fg = cp.white, bg = cp.black4, bold = true }, -- Popup menu: selected item.
	PmenuSbar = { bg = cp.black4 }, -- Popup menu: scrollbar.
	PmenuThumb = { bg = cp.gray0 }, -- Popup menu: Thumb of the scrollbar.

	Question = { fg = cp.blue }, -- |hit-enter| prompt and yes/no questions
	QuickFixLine = { bg = cp.black4, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

	Search = { fg = cp.pink, bg = cp.black4, bold = true }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
	SpecialKey = { link = 'NonText' }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|

	SpellBad = { undercurl = true, sp = cp.diag.error }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
	SpellCap = { undercurl = true, sp = cp.yellow }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
	SpellLocal = { undercurl = true, sp = cp.blue }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	SpellRare = { undercurl = true, sp = cp.green }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

	StatusLine = { fg = cp.white, bg = cp.black1 }, -- status line of current window
	StatusLineNC = { fg = cp.black4, bg = cp.black1 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	TabLine = { fg = cp.black4, bg = cp.black1 }, -- tab pages line, not active tab page label
	TabLineFill = { fg = cp.white, bg = cp.black2 }, -- tab pages line, where there are no labels
	TabLineSel = { fg = cp.green, bg = cp.black4 }, -- tab pages line, active tab page label

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
	Error = { fg = cp.diag.error, bg = NONE }, -- any erroneous construct
	Todo = { fg = cp.black2, bg = cp.diag.warning, bold = true }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

	---------- DIAGNOSTIC ----------

	DiagnosticError = { fg = cp.diag.error, italic = true }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticWarn = { fg = cp.diag.warning, italic = true }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticInfo = { fg = cp.diag.info, italic = true }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default
	DiagnosticHint = { fg = cp.diag.hint, italic = true }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default

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

	--------- DIFF ----------

	diffAdded = { link = 'DiffAdd' },
	diffRemoved = { link = 'DiffDelete' },
	diffChanged = { link = 'DiffChange' },
	diffOldFile = { fg = cp.yellow },
	diffNewFile = { fg = cp.peach },
	diffFile = { fg = cp.blue },
	diffLine = { fg = cp.gray0 },
	diffIndexLine = { fg = cp.pink },

	---------- QF ----------
	qfLineNr = { link = 'lineNr' },
	qfFileName = { link = 'Directory' },

	---------- NVIM LSPCONFIG ----------

	-- These groups are for the native LSP cliencp.
	-- Some other LSP clients may use these groups, or use their own.
	-- Consult your LSP client's documentation.

	LspReferenceText = { bg = cp.black4 }, -- used for highlighting "text" references
	LspReferenceRead = { link = 'LspReferenceText' }, -- used for highlighting "read" references
	LspReferenceWrite = { link = 'LspReferenceText' }, -- used for highlighting "write" references
	LspCodeLens = { fg = cp.gray0 }, -- virtual text of the codelens
	-- LspCodeLensSeparator = {},
	LspSignatureActiveParameter = { fg = cp.red }, -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

	---------- CHECK HEALTH ----------

	healthError = { fg = cp.diag.error },
	healthSuccess = { fg = cp.teal },
	healthWarning = { fg = cp.diag.warning },

	---------- LANGUAGES ----------

	---------- LUA ----------
	luaFunc = { fg = cp.green },
	luaFunction = { fg = cp.red },
	luaTable = { fg = cp.white },
	luaIn = { fg = cp.red },

	---------- MARKDOWN ----------

	markdownH1 = { fg = cp.lavender },
	markdownH2 = { fg = cp.mauve },
	markdownH3 = { fg = cp.green },
	markdownH4 = { fg = cp.yellow },
	markdownH5 = { fg = cp.pink },
	markdownH6 = { fg = cp.teal },

	markdownUrl = { underline = true },
	markdownItalic = { italic = true },
	markdownBold = { bold = true },
	markdownItalicDelimiter = { fg = cp.gray0 },

	markdownCode = { fg = cp.flamingo },
	markdownCodeBlock = { fg = cp.pink },
	markdownCodeBlock = { fg = cp.flamingo },
	markdownBlockquote = { fg = cp.gray0 },
	markdownListMarker = { fg = cp.gray0 },
	markdownOrderedListMarker = { fg = cp.gray0 },
	markdownRule = { fg = cp.gray0 },
	markdownHeadingRule = { fg = cp.gray0 },
	markdownUrlDelimiter = { fg = cp.white },
	markdownLinkText = { fg = cp.blue, underline = true },
	markdownLinkTextDelimiter = { fg = cp.white },
	markdownHeadingDelimiter = { fg = cp.maroon, bold = true },
	markdownUrlTitleDelimiter = { fg = cp.white },
	markdownIdDeclaration = { link = 'markdownLinkText' },

	---------- TEX ----------

	-- A list of groups that are only primitive link targets.
	-- texCmdType = { link = 'Type' }, -- Type
	-- texError = { link = 'Error' }, -- Error
	-- texParm = { link = 'Special' }, -- Special
	-- texZone = { link = 'PreCondit' }, -- PreCondit
	-- texSymbol = { link = 'SpecialChar' }, -- SpecialChar

	-- A list of the most common normal LaTeX groups.
	texComment = { link = 'Comment' }, -- Comment -- % COMMENT
	texCommentTodo = { link = 'Todo' }, -- Todo -- % TODO
	texDelim = { link = 'Delimiter' }, -- Delimiter -- {, }, [, and ]
	texCmd = { link = 'Statement' }, --Statement -- \CMD
	texOpt = { link = 'Identifier' }, -- Identifier -- \cmd[OPT]
	texOptSep = { link = 'NormalNC' }, -- NormalNC -- [a, b] (commas)
	texOptEqual = { link = 'texSymbol' }, -- texSymbol -- [a=b]
	texArg = { link = 'Include' }, -- Include -- \cmd[...]{ARG}
	texSpecialChar = { link = 'SpecialChar' }, -- SpecialChar -- \S, \P, \$, \;, ...
	texCmdInput = { link = 'texCmd' }, -- texCmd -- \INPUT, \INCLUDE, \INCLUDEONLY, \INCLUDEGRAPHICS
	texCmdBib = { link = 'texCmd' }, -- texCmd -- \BIBLIOGRAPHY, \BIBLIOGRAPHYSTYLE
	texCmdClass = { link = 'texCmd' }, -- texCmd -- \DOCUMENTCLASS
	texCmdPackage = { link = 'texCmd' }, -- texCmd -- \USEPACKAGE, \REQUIREPACKAGE
	texFileOpt = { link = 'texOpt' }, -- texOpt -- \includegraphics[PACKAGE OPTIONS], \documentclass[CLASS OPTIONS]
	texFileArg = { link = 'texArg' }, -- texArg -- \input{FILE}, \include{FILE}, \includegraphics[...]{FILE}, \bibliographystyle{FILE}, \documentclass[...]{CLASS}
	texFilesOpt = { link = 'texFileOpt' }, -- texFileOpt -- \usepackage[PACKAGE OPTIONS], \RequirePackage[PACKAGE OPTIONS]
	texFilesArg = { link = 'texFileArg' }, -- texFileArg -- \includeonly{FILE1, FILE2}, \bibliography{FILE1, FILE2}, \usepackage[...]{PACKAGE1, PACKAGE2}, \RequirePackage[...]{PACKAGE1, PACKAGE2}
	texCmdTitle = { link = 'texCmd' }, -- texCmd -- \TITLE
	texTitleArg = { link = 'Underlined' }, -- Underlined -- \title{MAIN TITLE}
	texCmdAuthor = { link = 'texCmd' }, -- texCmd -- \AUTHOR
	texAuthorOpt = { link = 'texOpt' }, -- texOpt -- \author[OPT]
	texAuthorArg = { link = 'NONE' }, -- NONE -- \author[...]{AUTHOR LIST}
	texCmdPart = { link = 'texCmd' }, -- texCmd --  \(SUB*)SECTION
	texPartArgTitle = { link = 'String' }, -- String -- \(sub*)section{TITLE}
	texCmdEnv = { link = 'texCmd' }, -- texCmd -- \BEGIN; \END
	texEnvArgName = { link = 'TSEnvironmentName' }, -- PreCondit -- \begin{ENVNAME}
	texTheoremEnvBgn = { link = 'texCmd' }, -- texCmd -- \begin{theorem}
	texCmdRef = { link = 'texCmd' }, -- texCmd -- \CITE; \LABEL
	texRefArg = { link = 'Special' }, -- Special -- \cite{REFERENCE}; \label{REF}
	texE3Variable = { link = 'texCmd' }, -- texCmd -- \G_MYFILE_NAME_STR
	texE3Constant = { link = 'texE3Variabl' }, -- texE3Variabl -- \C_MYFILE_NAME_STR
	texE3Function = { link = 'texCmdType' }, -- texCmdType -- \STR_NEW:n
	texE3Type = { link = 'texParm' }, -- texParm -- \str_new:N
	texCmdParbox = { link = 'texCmd' }, -- texCmd -- \PARBOX[p][h][i]{w}{c}
	texBoxOptPosVal = { link = 'texSymbol' }, -- texSymbol -- parbox[P][h][i]{w}{c}, \begin{minipage}[P][h][i]{w}
	texBoxOptIPosVal = { link = 'texBoxOptPosVal' }, -- texBoxOptPosVal -- \parbox[p][h][I]{w}{c}, \begin{minipage}[p][h][I]{w}

	-- A list of math mode groups.
	texMathZone = { link = 'Special' }, -- Special -- \( HERE \); \[ HERE \]
	texMathZoneEnv = { link = 'texMathZone' }, -- texMathZone -- \begin{menv}  HERE \end{menv}
	texMathZoneEnvStarred = { link = 'texMathZone' }, -- texMathZone -- \begin{menv*} HERE \end{menv*}
	-- texMathZoneX = { link = 'texMathZone' }, -- texMathZone -- $ HERE $
	-- texMathZoneXX = { link = 'texMathZone' }, -- texMathZone -- $$ HERE $$
	texMathZoneEnsured = { link = 'texMathZone' }, -- texMathZone -- \ensuremath{HERE}
	texCmdMathEnv = { link = 'texCmdEnv' }, -- texCmdEnv -- \BEGIN; \END (for math environments)
	texMathEnvArgName = { link = 'Delimiter' }, -- Delimiter -- \begin{EQUATION}
	texCmdMath = { link = 'texCmd' }, -- texCmd -- \ENSUREMATH
	texMathDelim = { link = 'Type' }, -- Type -- LVERT
	texMathDelimMod = { link = 'texMathDelim' }, -- texMathDelim -- \LEFT\lvert \RIGHT\rvert
	texMathOper = { link = 'Operator' }, -- Operator -- Basic operators: + -= /
	texMathSuperSub = { link = 'texMathOper' }, -- texMathOper -- Sub and super operators (^, _)
	texMathError = { link = 'texError' }, -- texError -- Unmatched region endings

	-- A list of other important groups.
	texLength = { link = 'Number' }, -- Number -- Length units, e.g. "4 cm". Only when contained e.g. in option groups.
	texLigature = { link = 'texSymbol' }, -- texSymbol -- --; ---; ``; '';,,
	texCmdAccent = { link = 'texCmd' }, -- texCmd -- \"{a}
	texCmdLigature = { link = 'texSpecialChar' }, -- texSpecialChar -- \ss; \ae
	texCmdSpaceCodeChar = { link = 'Special' }, -- Special -- Catcodes. For more info, see: https://en.wikibooks.org/wiki/TeX/catcode
	texCmdTodo = { link = 'Todo' }, -- Todo -- \TODOSOMETHING
	texCmdVerb = { link = 'texCmd' }, -- texCmd -- \VERB
	texVerbZoneInline = { link = 'texZone' }, -- texZone -- \verb+VERB TEXT+
	texVerbZone = { link = 'texZone' }, -- texZone -- \begin{verbatim} VERB TEXT \end{verbatim}
	texCmdDef = { link = 'texCmdNew' }, -- texCmdNew -- \DEF
	texDefArgName = { link = 'texArgNew' }, -- texArgNew -- \def\NAME
	texDefParm = { link = 'texParm' }, -- texParm -- \def\name #1
	texCmdItem = { link = 'texCmd' }, -- texCmd -- \item

	---------- INTEGRATIONS ----------

	---------- BUFFER LINE ----------

	BufferLineFill = { bg = cp.black0 },
	-- BufferLineBackground = { fg = cp.white, bg = cp.black0 }, -- others
	-- BufferLineBufferVisible = { fg = cp.black4, bg = cp.black1 },
	-- BufferLineBufferSelected = { fg = cp.white, bg = cp.black2, bold = true, italic = true }, -- current
	-- BufferLineTab = { fg = cp.black4, bg = cp.black0 },
	-- BufferLineTabSelected = { fg = cp.red, bg = cp.blue },
	-- BufferLineTabClose = { fg = cp.red, bg = cp.black1 },
	-- BufferLineIndicatorSelected = { fg = cp.peach, bg = cp.black2 },

	-- separators
	-- BufferLineSeparator = { fg = cp.black1, bg = cp.black1 },
	-- BufferLineSeparatorVisible = { link = 'BufferLineSeparator' },
	-- BufferLineSeparatorSelected = { link = 'BufferLineSeparator' },

	-- close buttons
	-- BufferLineCloseButton = { fg = cp.black4, bg = cp.black1 },
	-- BufferLineCloseButtonVisible = { link = 'BufferLineCloseButton' },
	-- BufferLineCloseButtonSelected = { fg = cp.red, bg = cp.black2 },

	---------- CMP ----------

	CmpItemAbbr = { fg = cp.gray2 }, --  The abbr field's highlight group.
	CmpItemAbbrDeprecated = { fg = cp.gray0, bg = NONE, strikethrough = true }, --  The abbr field's highlight group that only used for deprecated item.
	CmpItemAbbrMatch = { fg = cp.blue }, --  The matched character's highlight group.
	CmpItemAbbrMatchFuzzy = { fg = cp.blue, bold = true }, --    The fuzzy matched character's highlight group.
	CmpItemKind = { fg = cp.blue }, --  The kind field's highlight group.

	-- The kind field's highlight group for specific `lsp.CompletionItemKind`.
	CmpItemKindSnippet = { fg = cp.mauve },
	CmpItemKindKeyword = { fg = cp.red },
	CmpItemKindText = { fg = cp.teal },
	CmpItemKindMethod = { fg = cp.blue },
	CmpItemKindConstructor = { fg = cp.blue },
	CmpItemKindFunction = { fg = cp.blue },
	CmpItemKindFolder = { fg = cp.blue },
	CmpItemKindModule = { fg = cp.blue },
	CmpItemKindConstant = { fg = cp.peach },
	CmpItemKindField = { fg = cp.green },
	CmpItemKindProperty = { fg = cp.green },
	CmpItemKindEnum = { fg = cp.green },
	CmpItemKindUnit = { fg = cp.green },
	CmpItemKindClass = { fg = cp.yellow },
	CmpItemKindVariable = { fg = cp.flamingo },
	CmpItemKindFile = { fg = cp.blue },
	CmpItemKindInterface = { fg = cp.yellow },
	CmpItemKindColor = { fg = cp.red },
	CmpItemKindReference = { fg = cp.red },
	CmpItemKindEnumMember = { fg = cp.red },
	CmpItemKindStruct = { fg = cp.blue },
	CmpItemKindValue = { fg = cp.peach },
	CmpItemKindEvent = { fg = cp.blue },
	CmpItemKindOperator = { fg = cp.blue },
	CmpItemKindTypeParameter = { fg = cp.blue },

	CmpItemMenu = { fg = cp.white }, --  The menu field's highlight group.

	---------- GIT SIGNS ----------

	GitSignsAdd = { link = 'diffAdded' },
	GitSignsChange = { link = 'diffChanged' },
	GitSignsDelete = { link = 'diffRemoved' },

	---------- HOP ----------

	HopNextKey = { fg = cp.peach, bold = true, underline = true },
	HopNextKey1 = { fg = cp.blue, bold = true },
	HopNextKey2 = { fg = cp.teal, bold = true, italic = true },
	HopUnmatched = { fg = cp.gray0 },

	---------- INDENT BLANK LINE ----------

	IndentBlanklineChar = { fg = cp.black3 },
	IndentBlanklineContextChar = { fg = cp.white },

	-- IndentBlanklineIndent6 = { fg = cp.yellow, nocombine = true },
	-- IndentBlanklineIndent5 = { fg = cp.red, nocombine = true },
	-- IndentBlanklineIndent4 = { fg = cp.teal, nocombine = true },
	-- IndentBlanklineIndent3 = { fg = cp.peach, nocombine = true },
	-- IndentBlanklineIndent2 = { fg = cp.blue, nocombine = true },
	-- IndentBlanklineIndent1 = { fg = cp.pink, nocombine = true },

	---------- NEORG ----------

	-- NeorgTag = { fg = cp.lavender },
	-- NeorgTagName = { fg = cp.red },
	-- NeorgTagNameWord = { fg = cp.lavender, underline = true },

	---------- NOTIFY ----------

	NotifyERRORBorder = { link = 'DiagnosticError' },
	NotifyWARNBorder = { link = 'DiagnosticWarning' },
	NotifyINFOBorder = { link = 'DiagnosticInfo' },
	NotifyDEBUGBorder = { fg = cp.gray0 },
	NotifyTRACEBorder = { link = 'DiagnosticHint' },

	NotifyERRORIcon = { link = 'NotifyERRORBorder' },
	NotifyWARNIcon = { link = 'NotifyWARNBorder' },
	NotifyINFOIcon = { link = 'NotifyINFOBorder' },
	NotifyDEBUGIcon = { fg = cp.gray0 },
	NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },

	NotifyERRORTitle = { fg = cp.diag.error, italic = true },
	NotifyWARNTitle = { fg = cp.diag.warning, italic = true },
	NotifyINFOTitle = { fg = cp.diag.info, italic = true },
	NotifyDEBUGTitle = { fg = cp.gray, italic = true },
	NotifyTRACETitle = { fg = cp.diag.hint, italic = true },

	-- NotifyERRORBody = { link = 'Normal' },
	-- NotifyWARNBody = { link = 'Normal' },
	-- NotifyINFOBody = { link = 'Normal' },
	-- NotifyDEBUGBody = { link = 'Normal' },
	-- NotifyTRACEBody = { link = 'Normal' },

	---------- NVIM TREE ----------

	NvimTreeNormal = { fg = cp.white, bg = cp.black2 },
	NvimTreeVertSplit = { fg = cp.gray, bg = NONE },
	NvimTreeStatuslineNc = { fg = cp.white, bg = cp.black0 },

	NvimTreeSymlink = { link = 'Type' },
	NvimTreeFolderName = { link = 'Directory' },
	NvimTreeRootFolder = { fg = cp.yellow, bold = true },
	NvimTreeFolderIcon = { link = 'Directory' },
	NvimTreeEmptyFolderName = { link = 'Directory' },
	NvimTreeOpenedFolderName = { link = 'Directory' },
	NvimTreeExecFile = { fg = cp.green, bold = true },

	NvimTreeOpenedFile = { fg = cp.blue, italic = true },
	NvimTreeImageFile = { fg = cp.red },
	NvimTreeSpecialFile = { fg = cp.blue },

	NvimTreeIndentMarker = {},

	NvimTreeGitDirty = { fg = cp.diff.changed },
	NvimTreeGitStaged = { fg = cp.diff.added },
	NvimTreeGitMerge = { fg = cp.diff.added },
	NvimTreeGitRenamed = { fg = cp.diff.changed },
	NvimTreeGitNew = { fg = cp.diff.added },
	NvimTreeGitDeleted = { fg = cp.diff.deleted },

	NvimTreeWindowPicker = { fg = cp.pink },

	---------- RAINBOW ----------

	rainbowcol1 = { fg = cp.red },
	rainbowcol2 = { fg = cp.teal },
	rainbowcol3 = { fg = cp.yellow },
	rainbowcol4 = { fg = cp.blue },
	rainbowcol5 = { fg = cp.pink },
	rainbowcol6 = { fg = cp.flamingo },
	rainbowcol7 = { fg = cp.green },

	---------- TELESCOPE ----------

	-- Sets the highlight for selected items within the picker.
	TelescopeSelection = { fg = cp.white, bg = cp.black3, bold = true },
	TelescopeSelectionCaret = { fg = cp.flamingo },
	-- TelescopeMultiSelection = { link = 'Type' },
	-- TelescopeMultiIcon = { link = 'Identifier' },

	-- "Normal" in the floating windows created by telescope.
	-- TelescopeNormal = { link = 'Normal' },
	-- TelescopePreviewNormal = { link = 'TelescopeNormal' },
	-- TelescopePromptNormal = { link = 'TelescopeNormal' },
	-- TelescopeResultsNormal = { link = 'TelescopeNormal' },

	-- Border highlight groups.
	-- Use TelescopeBorder to override the default.
	-- Otherwise set them specifically
	TelescopeBorder = { fg = cp.blue },
	-- TelescopePromptBorder = { link = 'TelescopeBorder' },
	-- TelescopeResultsBorder = { link = 'TelescopeBorder' },
	-- TelescopePreviewBorder = { link = 'TelescopeBorder' },

	-- Title highlight groups.
	-- Use TelescopeTitle to override the default.
	-- Otherwise set them specifically
	-- TelescopeTitle = { link = 'TelescopeBorder' },
	-- TelescopePromptTitle = { link = 'TelescopeTitle' },
	-- TelescopeResultsTitle = { link = 'TelescopeTitle' },
	-- TelescopePreviewTitle = { link = 'TelescopeTitle' },

	-- TelescopePromptCounter = { link = 'NonText' },

	-- Used for highlighting characters that you match.
	TelescopeMatching = { fg = cp.blue },

	-- Used for the prompt prefix
	-- TelescopePromptPrefix = { link = 'Identifier' },

	-- Used for highlighting the matched line inside Previewer. Works only for (vim_buffer_ previewer)
	-- TelescopePreviewLine = { link = 'Visual' },
	-- TelescopePreviewMatch = { link = 'Search' },

	-- TelescopePreviewPipe = { link = 'Constant' },
	-- TelescopePreviewCharDev = { link = 'Constant' },
	-- TelescopePreviewDirectory = { link = 'Directory' },
	-- TelescopePreviewBlock = { link = 'Constant' },
	-- TelescopePreviewLink = { link = 'Special' },
	-- TelescopePreviewSocket = { link = 'Constant' },
	-- TelescopePreviewNormal = { link = 'Normal' },
	-- TelescopePreviewRead = { link = 'Constant' },
	-- TelescopePreviewWrite = { link = 'Statement' },
	-- TelescopePreviewExecutable = { link = 'String' },
	-- TelescopePreviewHyphen = { link = 'NonText' },
	-- TelescopePreviewSticky = { link = 'Keyword' },
	-- TelescopePreviewSize = { link = 'String' },
	-- TelescopePreviewUser = { link = 'Constant' },
	-- TelescopePreviewGroup = { link = 'Constant' },
	-- TelescopePreviewDate = { link = 'Directory' },
	-- TelescopePreviewMessage = { link = 'TelescopePreviewNormal' },
	-- TelescopePreviewMessageFillchar = { link = 'TelescopePreviewMessage' },

	-- Used for Picker specific Results highlighting
	-- TelescopeResultsClass = { link = 'Function' },
	-- TelescopeResultsConstant = { link = 'Constant' },
	-- TelescopeResultsField = { link = 'Function' },
	-- TelescopeResultsFunction = { link = 'Function' },
	-- TelescopeResultsMethod = { link = 'Method' },
	-- TelescopeResultsOperator = { link = 'Operator' },
	-- TelescopeResultsStruct = { link = 'Struct' },
	-- TelescopeResultsVariable = { link = 'SpecialChar' },

	-- TelescopeResultsLineNr = { link = 'LineNr' },
	-- TelescopeResultsIdentifier = { link = 'Identifier' },
	-- TelescopeResultsNumber = { link = 'Number' },
	-- TelescopeResultsComment = { link = 'Comment' },
	-- TelescopeResultsSpecialComment = { link = 'SpecialComment' },

	-- Used for git status Results highlighting
	-- TelescopeResultsDiffChange = { link = 'DiffChange' },
	-- TelescopeResultsDiffAdd = { link = 'DiffAdd' },
	-- TelescopeResultsDiffDelete = { link = 'DiffDelete' },
	-- TelescopeResultsDiffUntracked = { link = 'NonText' },

	---------- TREESITTER ----------
	-- These groups are for the neovim tree-sitter highlights.
	-- As of writing, tree-sitter support is a WIP, group names may change.
	-- By default, most of these groups link to an appropriate Vim group,
	-- TSError -> Error for example, so you do not have to define these unless
	-- you explicitly want to support Treesitter's improved syntax awareness.

	TSPunctDelimiter = { fg = cp.teal }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
	TSPunctBracket = { fg = cp.gray1 }, -- Brackets, braces, parentheses, etc.
	TSPunctSpecial = { fg = cp.maroon, bold = true }, -- Special punctuation that doesn't fit into the previous categories.

	TSConstant = { fg = cp.peach }, -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
	TSConstBuiltin = { fg = cp.lavender, italic = true }, -- Built-in constant values: `nil` in Lua.
	TSConstMacro = { fg = cp.yellow }, -- Constants defined by macros: `NULL` in C.

	TSString = { fg = cp.green }, -- String literals.
	TSStringEscape = { fg = cp.pink }, -- Escape characters within a string: `\n`, `\t`, etc.
	TSStringRegex = { fg = cp.peach }, -- Regular expression literals.
	TSStringSpecial = { fg = cp.green }, -- Strings with special meaning that don't fit into the previous categories.
	TSCharacter = { fg = cp.yellow }, -- Character literals: `'a'` in C.
	TSNumber = { fg = cp.peach, bold = true, italic = true }, -- Numeric literals that don't fit into other categories.
	TSBoolean = { fg = cp.peach, bold = true, italic = true }, -- Boolean literals: `True` and `False` in Python.
	TSFloat = { fg = cp.peach, bold = true, italic = true }, -- Floating-point number literals.

	TSFunction = { fg = cp.green, italic = true }, -- Function calls and definitions.
	TSFuncBuiltin = { fg = cp.peach, italic = true }, -- Built-in functions: `print` in Lua.
	TSFuncMacro = { fg = cp.red }, -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
	TSParameter = { fg = cp.rosewater }, -- Parameters of a function.
	TSParameterReference = { fg = cp.white }, -- References to parameters of a function.
	TSMethod = { fg = cp.blue, italic = true }, -- Method calls and definitions.
	TSField = { fg = cp.rosewater }, -- Object and struct fields.
	TSProperty = { fg = cp.yellow, italic = true }, -- Same as `TSField`.
	TSConstructor = { fg = cp.lavender }, -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
	-- TSAnnotation = {},
	TSAttribute = { fg = cp.blue }, -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
	TSNamespace = { fg = cp.rosewater, bold = true }, -- Identifiers referring to modules and namespaces.
	TSSymbol = { fg = cp.white }, -- Identifiers referring to symbols or atoms.

	TSConditional = { fg = cp.mauve, bold = true }, -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
	TSRepeat = { fg = cp.mauve, bold = true }, -- Keywords related to loops: `for`, `while`, etc.
	TSLabel = { fg = cp.blue }, -- GOTO labels: `label:` in C, and `::label::` in Lua.
	TSOperator = { fg = cp.sky, bold = true }, -- Binary or unary operators: `+`, and also `->` and `*` in C.
	TSKeyword = { fg = cp.red, italic = true }, -- Keywords that don't fit into other categories.
	TSKeywordFunction = { fg = cp.maroon, italic = true }, -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
	TSKeywordOperator = { fg = cp.sky, bold = true }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
	TSKeywordReturn = { fg = cp.pink }, -- Keywords like `return` and `yield`.
	TSException = { fg = cp.peach, italic = true }, -- Exception related keywords: `try`, `except`, `finally` in Python.

	TSType = { fg = cp.blue }, -- Type (and class) definitions and annotations.
	TSTypeBuiltin = { fg = cp.yellow, italic = true }, -- Built-in types: `i32` in Rust.
	TSInclude = { fg = cp.teal, italic = true }, -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.

	TSVariableBuiltin = { fg = cp.teal, italic = true }, -- Variable names defined by the language: `this` or `self` in Javascript.

	TSText = { fg = cp.white }, -- Non-structured text. Like text in a markup language.
	TSStrong = { fg = cp.maroon, bold = true }, -- Text to be represented in bold.
	TSEmphasis = { fg = cp.maroon, italic = true }, -- Text to be represented with emphasis.
	TSUnderline = { underline = true }, -- Text to be represented with an underline.
	TSStrike = { fg = cp.gray, strikethrough = true }, -- Strikethrough text.

	TSMath = { fg = cp.yellow }, -- Math environments like LaTeX's `$ ... $`
	TSTextReference = { fg = cp.lavender, bold = true }, -- Footnotes, text references, citations, etc.
	TSEnvironment = { fg = cp.green }, -- Text environments of markup languages.
	TSEnvironmentName = { fg = cp.blue, italic = true }, -- Text/string indicating the type of text environment. Like the name of a	`\begin` block in LaTeX.
	TSTitle = { fg = cp.blue, bold = true }, -- Text that is part of a title.
	TSLiteral = { fg = cp.teal, italic = true }, -- Literal or verbatim text.
	TSURI = { fg = cp.rosewater, italic = true, underline = true }, -- URIs like hyperlinks or email addresses.

	-- TSComment = { link = 'Comment' }, -- Line comments and block comments.
	TSNote = { fg = cp.black2, bg = cp.blue }, -- Text representation of an informational note.
	TSWarning = { fg = cp.black2, bg = cp.yellow }, -- Text representation of a warning note.
	TSDanger = { fg = cp.black2, bg = cp.red }, -- Text representation of a danger note.

	TSTag = { fg = cp.peach }, -- Tags like HTML tag names.
	TSTagDelimiter = { fg = cp.maroon }, -- Tag delimiters like `<` `>` `/`.
	TSTagAttribute = { fg = cp.mauve, italic = true }, -- HTML tag attributes.

	TSError = { fg = cp.diag.error }, -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
	-- TSNone = {}, -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
	TSVariable = { fg = cp.white, italic = true }, -- Variable names that don't fit into other categories.
}
