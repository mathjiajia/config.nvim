local highlight = function(colors)
	for name, opts in pairs(colors) do
		vim.api.nvim_set_hl(0, name, opts)
	end
end

vim.g.colors_name = 'moon'

---------- COLOR PALETTE ----------

local cp = {

	black0 = '#161320', -- Black0
	black1 = '#1A1826', -- Black1
	black2 = '#1E1E2E', -- Black2
	black3 = '#302D41', -- Black3
	black4 = '#575268', -- Black4
	blue = '#76cce0', -- Blue
	flamingo = '#F2CDCD', -- Flamingo
	green = '#9ed072', -- Green
	grey = '#7f8490', -- Grey
	grey0 = '#6E6C7E', -- Grey0
	grey1 = '#988BA2', -- Grey1
	grey2 = '#C3BAC6', -- Grey2
	lavender = '#C9CBFF', -- Lavender
	maroon = '#E8A2AF', -- Maroon
	mauve = '#DDB6F2', -- Mauve
	orange = '#fea24f',
	peach = '#F8BD96', -- Peach
	pink = '#F5C2E7', -- Pink
	purple = '#b39df3', -- Purple
	red = '#F28FAD', -- Red
	rosewater = '#F5E0DC', -- Rosewater
	sky = '#89DCEB', -- Sky
	teal = '#B5E8E0', -- Teal
	white = '#D9E0EE', -- White
	yellow = '#e7c664', -- Yellow

	bg = '#1E1E2E',
	bg2 = '#363944',
	bg3 = '#121212',
	fg = '#eeeeee',
	border = '#80A0C2',

	diag = {
		error = '#FB617E',
		warning = '#FAE3B0',
		info = '#B5E8E0',
		hint = '#9ed06c',
	},
	diff = {
		added = '#a9dc76',
		changed = '#77d5f0',
		removed = '#F28FAD',
	},
}

---------- GROUPS ----------

highlight {
	ColorColumn = { bg = cp.bg }, -- used for the columns set with 'colorcolumn'
	Conceal = { fg = cp.grey }, -- placeholder characters substituted for concealed text (see 'conceallevel')
	Cursor = { fg = cp.fg, bg = cp.bg, reverse = true }, -- character under the cursor
	lCursor = { link = 'Cursor' }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
	CursorIM = { link = 'Cursor' }, -- like Cursor, but used when in IME mode |CursorIM|
	CursorColumn = { fg = cp.grey }, -- used for the vertical bar at the right of the cursor
	CursorLine = { bg = cp.black3 }, -- used for the horizontal bar at the bottom of the cursor

	Directory = { fg = cp.green }, -- used for the directory name in the quickfix window
	DiffAdd = { fg = cp.diff.added }, -- used for lines in a diff that have been added
	DiffChange = { fg = cp.diff.changed }, -- used for lines in a diff that have been changed
	DiffDelete = { fg = cp.diff.removed }, -- used for lines in a diff that have been deleted
	DiffText = { fg = cp.bg, bg = cp.fg }, -- used for lines in a diff that are not changed

	EndOfBuffer = { fg = cp.bg2 }, -- filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
	TermCursor = { fg = cp.fg, bg = cp.bg }, -- cursor in a focused terminal
	TermCursorNC = { fg = cp.fg, bg = cp.bg }, -- cursor in a unfocused terminal

	ErrorMsg = { fg = cp.red, bold = true, italic = true }, -- error messages on the command line
	VertSplit = { fg = cp.grey }, -- the column separating vertically split windows
	Folded = { fg = cp.grey, bg = cp.bg }, -- line used for closed folds
	FoldColumn = { fg = cp.grey }, -- 'foldcolumn'
	SignColumn = { fg = cp.fg }, -- column where |signs| are displayed
	IncSearch = { fg = cp.bg, bg = cp.red }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
	Substitute = { fg = cp.red, bg = cp.bg }, -- |:substitute| replacement text highlighting

	LineNr = { fg = cp.grey }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is secp.
	-- LineNrAbove = {}, -- Line number for when the 'relativenumber' option is set, above the cursor line.
	-- LineNrBelow = {}, -- Line number for when the 'relativenumber' option is set, below the cursor line.
	CursorLineNr = { fg = cp.diag.warning, bg = 'NONE', bold = true }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line. highlights the number in numberline.
	-- CursorLineSign = {}, -- Like SignColumn when 'cursorline' is set for the cursor line.
	-- CursorLineFold = {}, -- Like FoldColumn when 'cursorline' is set for the cursor line.

	MatchParen = { bg = cp.bg2 }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
	ModeMsg = { fg = cp.fg, bold = true }, -- 'showmode' message (e.g., "-- INSERT -- ")
	MsgArea = { fg = cp.white }, -- Area for messages and cmdline
	MsgSeparator = {}, -- Separator for scrolled messages, `msgsep` flag of 'display'
	MoreMsg = { fg = cp.blue, bold = true }, -- |more-prompt|
	NonText = { fg = cp.bg2 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

	Normal = { fg = cp.fg, bg = cp.bg }, -- normal text
	NormalFloat = { fg = cp.white, bg = cp.black1 }, -- Normal text in floating windows.
	NormalNC = { fg = cp.white, bg = cp.bg }, -- normal text in non-current windows

	Pmenu = { bg = cp.black3, fg = cp.grey2 }, -- Popup menu: normal item.
	PmenuSel = { fg = cp.bg, bg = cp.green }, -- Popup menu: selected item.
	PmenuSbar = { bg = cp.bg2 }, -- Popup menu: scrollbar.
	PmenuThumb = { bg = cp.grey }, -- Popup menu: Thumb of the scrollbar.

	Question = { fg = cp.yellow }, -- |hit-enter| prompt and yes/no questions
	QuickFixLine = { fg = cp.blue, bold = true }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.

	Search = { fg = cp.bg, bg = cp.green }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand oucp.
	SpecialKey = { fg = cp.bg2 }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|

	SpellBad = { sp = cp.red, undercurl = true }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
	SpellCap = { sp = cp.yellow, undercurl = true }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
	SpellLocal = { sp = cp.blue, undercurl = true }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
	SpellRare = { sp = cp.purple, undercurl = true }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.

	StatusLine = { fg = cp.white, bg = cp.black1 }, -- status line of current window
	StatusLineNC = { fg = cp.grey, bg = cp.black3 }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
	TabLine = { fg = cp.black4, bg = cp.black1 }, -- tab pages line, not active tab page label
	TabLineFill = { bg = cp.black0 }, -- tab pages line, where there are no labels
	TabLineSel = { fg = cp.green, bg = cp.black4 }, -- tab pages line, active tab page label

	Title = { fg = cp.blue, bold = true }, -- titles for output from ":set all", ":autocmd" etcp.
	Visual = { bg = cp.bg2 }, -- Visual mode selection
	VisualNOS = { bg = cp.bg2, underline = true }, -- Visual mode selection when vim is "Not Owning the Selection".

	WarningMsg = { fg = cp.yellow, bold = true }, -- warning messages
	Whitespace = { fg = cp.bg2 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
	WildMenu = { link = 'PmenuSel' }, -- current match in 'wildmenu' completion

	-- syntax groups

	Comment = { fg = cp.grey0, italic = true }, -- any comment

	Constant = { fg = cp.orange }, -- any constant
	String = { fg = cp.yellow }, -- a string constant: "this is a string"
	Character = { fg = cp.yellow }, -- a character constant: 'c', '\n'
	Number = { fg = cp.peach }, -- a number constant: 234,    0xff
	Boolean = { fg = cp.purple }, -- a boolean constant: TRUE,  false
	Float = { fg = cp.purple }, -- a floating point constant: 2.3e10

	Identifier = { fg = cp.flamingo, italic = true }, -- any variable name
	Function = { fg = cp.blue, italic = true }, -- function name (also: methods for classes)

	Statement = { fg = cp.green }, -- any statement
	Conditional = { fg = cp.red }, -- if, then, else, endif, switch, etc.
	Repeat = { fg = cp.red }, -- for, do, while, etc.
	Label = { fg = cp.purple }, -- case, default, etc.
	Operator = { fg = cp.sky }, -- "sizeof", "+", "*", etc.
	Keyword = { fg = cp.pink, italic = true }, -- any other keyword
	Exception = { fg = cp.red }, -- try, catch, throw

	PreProc = { fg = cp.red }, -- generic Preprocessor
	Include = { fg = cp.red }, -- preprocessor #include
	Define = { fg = cp.red }, -- preprocessor #define
	Macro = { fg = cp.purple }, -- same as Define
	PreCondit = { fg = cp.blue }, -- preprocessor #if, #else, #endif, etc.

	Type = { fg = cp.blue }, -- int, long, char, etc.
	StorageClass = { fg = cp.blue }, -- static, register, volatile, etc.
	Structure = { fg = cp.blue }, -- struct, union, enum, etc.
	Typedef = { fg = cp.red }, -- A typedef

	Special = { fg = cp.yellow }, -- any special symbol
	SpecialChar = { fg = cp.purple }, -- special character in a constant
	Tag = { fg = cp.orange }, -- you can use CTRL-] on this
	Delimiter = { fg = cp.fg }, -- character that needs attention
	SpecialComment = { fg = cp.grey, italic = true }, -- special things inside a comment
	-- Debug = {}, -- debugging statements

	Underlined = { underline = true }, -- text that stands out, HTML links
	-- Ignore = { fg = cp.grey }, -- left blank, hidden |hl-Ignore|
	Error = { fg = cp.diag.error, bg = 'NONE' }, -- any erroneous construct
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

	DiagnosticSignError = { fg = cp.diag.error, bg = cp.bg },
	DiagnosticSignWarn = { fg = cp.diag.warning, bg = cp.bg },
	DiagnosticSignInfo = { fg = cp.diag.info, bg = cp.bg },
	DiagnosticSignHint = { fg = cp.diag.hint, bg = cp.bg },

	--------- DIFF ----------

	diffAdded = { fg = cp.diff.added },
	diffRemoved = { fg = cp.diff.removed },
	diffChanged = { fg = cp.diff.changed },
	diffOldFile = { fg = cp.yellow },
	diffNewFile = { fg = cp.orange },
	diffFile = { fg = cp.purple },
	diffLine = { fg = cp.grey },
	diffIndexLine = { fg = cp.purple },

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
	LspCodeLens = { fg = cp.grey0 }, -- virtual text of the codelens
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
	luaTable = { fg = cp.fg },
	luaIn = { fg = cp.red },

	---------- MARKDOWN ----------

	markdownH1 = { fg = cp.lavender },
	markdownH2 = { fg = cp.purple },
	markdownH3 = { fg = cp.green },
	markdownH4 = { fg = cp.yellow },
	markdownH5 = { fg = cp.blue },
	markdownH6 = { fg = cp.teal },

	markdownUrl = { underline = true },
	markdownItalic = { italic = true },
	markdownBold = { bold = true },
	markdownItalicDelimiter = { fg = cp.grey },

	markdownCode = { fg = cp.pink },
	markdownCodeBlock = { fg = cp.pink },
	markdownCodeDelimiter = { fg = cp.green },
	markdownBlockquote = { fg = cp.grey },
	markdownListMarker = { fg = cp.grey },
	markdownOrderedListMarker = { fg = cp.grey },
	markdownRule = { fg = cp.grey },
	markdownHeadingRule = { fg = cp.grey },
	markdownUrlDelimiter = { fg = cp.fg },
	markdownLinkText = { fg = cp.blue, underline = true },
	markdownLinkTextDelimiter = { fg = cp.fg },
	markdownHeadingDelimiter = { fg = cp.maroon, bold = true },
	markdownUrlTitleDelimiter = { fg = cp.fg },
	markdownLinkText = { fg = cp.grey, underline = true },
	markdownIdDeclaration = { link = 'markdownLinkText' },

	---------- TEX ----------

	-- A list of groups that are only primitive link targets.
	texCmdType = { link = 'Type' }, -- Type
	texError = { link = 'Error' }, -- Error
	texParm = { link = 'Special' }, -- Special
	texZone = { link = 'PreCondit' }, -- PreCondit
	texSymbol = { link = 'SpecialChar' }, -- SpecialChar

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

	CmpItemAbbr = { fg = cp.grey2 }, --  The abbr field's highlight group.
	CmpItemAbbrDeprecated = { fg = cp.grey0, bg = 'NONE', strikethrough = true }, --  The abbr field's highlight group that only used for deprecated item.
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

	HopNextKey = { fg = cp.red, bold = true, underline = true },
	HopNextKey1 = { fg = cp.blue, bold = true },
	HopNextKey2 = { fg = cp.green, bold = true, italic = true },
	HopUnmatched = { fg = cp.grey },

	---------- INDENT BLANK LINE ----------

	IndentBlanklineChar = { fg = cp.black3 },
	IndentBlanklineContextChar = { fg = cp.white },

	-- IndentBlanklineIndent6 = { fg = cp.purple }, -- gui = nocombine
	-- IndentBlanklineIndent5 = { fg = cp.blue },
	-- IndentBlanklineIndent4 = { fg = cp.green },
	-- IndentBlanklineIndent3 = { fg = cp.yellow },
	-- IndentBlanklineIndent2 = { fg = cp.orange },
	-- IndentBlanklineIndent1 = { fg = cp.red },

	---------- NEORG ----------

	-- NeorgTag = { fg = cp.purple },
	-- NeorgTagName = { fg = cp.red },
	-- NeorgTagNameWord = { fg = cp.purple, underline = true },

	---------- NOTIFY ----------

	NotifyERRORBorder = { link = 'DiagnosticError' },
	NotifyWARNBorder = { link = 'DiagnosticWarning' },
	NotifyINFOBorder = { link = 'DiagnosticInfo' },
	NotifyDEBUGBorder = { fg = cp.grey },
	NotifyTRACEBorder = { link = 'DiagnosticHint' },

	NotifyERRORIcon = { link = 'NotifyERRORBorder' },
	NotifyWARNIcon = { link = 'NotifyWARNBorder' },
	NotifyINFOIcon = { link = 'NotifyINFOBorder' },
	NotifyDEBUGIcon = { fg = cp.grey },
	NotifyTRACEIcon = { link = 'NotifyTRACEBorder' },

	NotifyERRORTitle = { fg = cp.diag.error, italic = true },
	NotifyWARNTitle = { fg = cp.diag.warning, italic = true },
	NotifyINFOTitle = { fg = cp.diag.info, italic = true },
	NotifyDEBUGTitle = { fg = cp.grey, italic = true },
	NotifyTRACETitle = { fg = cp.diag.hint, italic = true },

	---------- NVIM TREE ----------

	NvimTreeNormal = { fg = cp.white, bg = cp.black1 },
	NvimTreeVertSplit = { fg = cp.grey, bg = 'NONE' },
	NvimTreeStatuslineNc = { fg = cp.fg, bg = cp.bg3 },

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
	NvimTreeGitRenamed = { fg = cp.diff.renamed },
	NvimTreeGitNew = { fg = cp.diff.added },
	NvimTreeGitDeleted = { fg = cp.diff.removed },

	NvimTreeWindowPicker = { fg = cp.pink },

	---------- RAINBOW ----------

	rainbowcol1 = { fg = cp.blue },
	rainbowcol2 = { fg = cp.orange },
	rainbowcol3 = { fg = cp.red },
	rainbowcol4 = { fg = cp.green },
	rainbowcol5 = { fg = cp.yellow },
	rainbowcol6 = { fg = cp.purple },
	rainbowcol7 = { fg = cp.grey },

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

	TSPunctDelimiter = { fg = cp.grey }, -- Punctuation delimiters: Periods, commas, semicolons, etc.
	TSPunctBracket = { fg = cp.fg }, -- Brackets, braces, parentheses, etc.
	TSPunctSpecial = { fg = cp.maroon }, -- Special punctuation that doesn't fit into the previous categories.

	TSConstant = { fg = cp.orange }, -- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
	TSConstBuiltin = { fg = cp.orange }, -- Built-in constant values: `nil` in Lua.
	TSConstMacro = { fg = cp.orange }, -- Constants defined by macros: `NULL` in C.

	TSString = { fg = cp.red }, -- String literals.
	TSStringEscape = { fg = cp.yellow }, -- Escape characters within a string: `\n`, `\t`, etc.
	TSStringRegex = { fg = cp.green }, -- Regular expression literals.
	TSStringSpecial = { fg = cp.green }, -- Strings with special meaning that don't fit into the previous categories.
	TSCharacter = { fg = cp.yellow }, -- Character literals: `'a'` in C.
	TSNumber = { fg = cp.purple }, -- Numeric literals that don't fit into other categories.
	TSBoolean = { fg = cp.purple }, -- Boolean literals: `True` and `False` in Python.
	TSFloat = { fg = cp.purple }, -- Floating-point number literals.

	TSFunction = { fg = cp.green, italic = true }, -- Function calls and definitions.
	TSFuncBuiltin = { fg = cp.green }, -- Built-in functions: `print` in Lua.
	TSFuncMacro = { fg = cp.green }, -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
	TSParameter = { fg = cp.fg }, -- Parameters of a function.
	TSParameterReference = { fg = cp.fg }, -- References to parameters of a function.
	TSMethod = { fg = cp.green }, -- Method calls and definitions.
	TSField = { link = 'Identifier' }, -- Object and struct fields.
	TSProperty = { fg = cp.green }, -- Same as TSField.
	TSConstructor = { fg = cp.fg }, -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
	TSAnnotation = { link = 'Constant' },
	TSAttribute = { fg = cp.blue }, -- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
	TSNamespace = { fg = cp.green, bold = true }, -- Identifiers referring to modules and namespaces.
	TSSymbol = { fg = cp.fg }, -- Identifiers referring to symbols or atoms.

	TSConditional = { fg = cp.mauve, bold = true }, -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
	TSRepeat = { fg = cp.red }, -- Keywords related to loops: `for`, `while`, etc.
	TSLabel = { fg = cp.red }, -- GOTO labels: `label:` in C, and `::label::` in Lua.
	TSOperator = { fg = cp.sky }, -- Binary or unary operators: `+`, and also `->` and `*` in C.
	TSKeyword = { fg = cp.red }, -- Keywords that don't fit into other categories.
	TSKeywordFunction = { fg = cp.maroon, italic = true }, -- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
	TSKeywordOperator = { fg = cp.red }, -- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
	TSKeywordReturn = { fg = cp.red }, -- Keywords like `return` and `yield`.
	TSException = { fg = cp.red }, -- Exception related keywords: `try`, `except`, `finally` in Python.

	TSType = { fg = cp.blue }, -- Type (and class) definitions and annotations.
	TSTypeBuiltin = { fg = cp.blue }, -- Built-in types: `i32` in Rust.
	TSInclude = { fg = cp.green, italic = true }, -- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.

	TSVariableBuiltin = { fg = cp.orange }, -- Variable names defined by the language: `this` or `self` in Javascript.

	TSText = { fg = cp.green }, -- Non-structured text. Like text in a markup language.
	TSStrong = { fg = cp.maroon, bold = true }, -- Text to be represented in bold.
	TSEmphasis = { fg = cp.maroon, italic = true }, -- Text to be represented with emphasis.
	TSUnderline = { underline = true }, -- Text to be represented with an underline.
	TSStrike = { fg = cp.grey, strikethrough = true }, -- Strikethrough text.

	TSMath = { fg = cp.yellow }, -- Math environments like LaTeX's `$ ... $`
	TSTextReference = { fg = cp.yellow }, -- Footnotes, text references, citations, etc.
	TSEnvironment = { fg = cp.green }, -- Text environments of markup languages.
	TSEnvironmentName = { fg = cp.blue, italic = true }, -- Text/string indicating the type of text environment. Like the name of a	`\begin` block in LaTeX.
	TSTitle = { fg = cp.blue, bold = true }, -- Text that is part of a title.
	TSLiteral = { fg = cp.blue }, -- Literal or verbatim text.
	TSURI = { fg = cp.blue, underline = true }, -- URIs like hyperlinks or email addresses.

	TSComment = { link = 'Comment' }, -- Line comments and block comments.
	TSNote = { fg = cp.blue, bold = true }, -- Text representation of an informational note.
	TSWarning = { fg = cp.orange, bold = true }, -- Text representation of a warning note.
	TSDanger = { fg = cp.red, bold = true }, -- Text representation of a danger note.

	TSTag = { fg = cp.blue }, -- Tags like HTML tag names.
	TSTagDelimiter = { fg = cp.red }, -- HTML tag attributes.
	TSTagAttribute = { fg = cp.blue }, -- Tag delimiters like `<` `>` `/`.

	TSError = { fg = cp.diag.error }, -- Syntax/parser errors. This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
	-- TSNone = {}, -- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges, for example, string interpolations. Don't change the values of this highlight group.
	TSVariable = { fg = 'NONE' }, -- Variable names that don't fit into other categories.
}

---------- TERM COLORS ----------

-- vim.g.terminal_color_0  = '#6E6C7E'
-- vim.g.terminal_color_1  = '#F28FAD'
-- vim.g.terminal_color_2  = '#ABE9B3'
-- vim.g.terminal_color_3  = '#FAE3B0'
-- vim.g.terminal_color_4  = '#96CDFB'
-- vim.g.terminal_color_5  = '#F5C2E7'
-- vim.g.terminal_color_6  = '#89DCEB'
-- vim.g.terminal_color_7  = '#D9E0EE'
-- vim.g.terminal_color_8  = '#988BA2'
-- vim.g.terminal_color_9  = '#F28FAD'
-- vim.g.terminal_color_10 = '#ABE9B3'
-- vim.g.terminal_color_11 = '#FAE3B0'
-- vim.g.terminal_color_12 = '#96CDFB'
-- vim.g.terminal_color_13 = '#F5C2E7'
-- vim.g.terminal_color_14 = '#89DCEB'
-- vim.g.terminal_color_15 = '#D9E0EE'
