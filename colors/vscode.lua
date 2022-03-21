local c = {
	black0 = '#1A1B26', -- Black0

	vscNone = 'NONE',
	vscFront = '#D4D4D4',
	vscBack = '#1E1E1E',

	vscTabCurrent = '#1E1E1E',
	vscTabOther = '#2D2D2D',
	vscTabOutside = '#252526',

	vscLeftDark = '#252526',
	vscLeftMid = '#373737',
	vscLeftLight = '#636369',

	vscPopupFront = '#BBBBBB',
	vscPopupBack = '#272727',
	vscPopupHighlightBlue = '#004b72',
	vscPopupHighlightGray = '#343B41',

	vscSplitLight = '#898989',
	vscSplitDark = '#444444',
	vscSplitThumb = '#424242',

	vscCursorDarkDark = '#222222',
	vscCursorDark = '#51504F',
	vscCursorLight = '#AEAFAD',
	vscSelection = '#264F78',
	vscLineNumber = '#5A5A5A',

	vscDiffRedDark = '#4B1818',
	vscDiffRedLight = '#6F1313',
	vscDiffRedLightLight = '#FB0101',
	vscDiffGreenDark = '#373D29',
	vscDiffGreenLight = '#4B5632',
	vscSearchCurrent = '#4B5632',
	vscSearch = '#264F78',

	-- Syntax colors
	vscGray = '#808080',
	vscViolet = '#646695',
	vscBlue = '#569CD6',
	vscDarkBlue = '#223E55',
	vscMediumBlue = '#18a2fe',
	vscLightBlue = '#9CDCFE',
	vscGreen = '#6A9955',
	vscBlueGreen = '#4EC9B0',
	vscLightGreen = '#B5CEA8',
	vscRed = '#F44747',
	vscOrange = '#CE9178',
	vscLightRed = '#D16969',
	vscYellowOrange = '#D7BA7D',
	vscYellow = '#DCDCAA',
	vscPink = '#C586C0',

	-- Other ui specific colors
	vscUiBlue = '#084671',
	vscUiOrange = '#f28b25',
}

-- local colors = require('vscode.colors')
local theme = {}

theme.load_syntax = function()
	local isDark = vim.g.vscode_style == 'dark'
	local isItalic = vim.g.vscode_italic_comment == 1
	local no_nvimtree_bg = vim.g.vscode_disable_nvimtree_bg == true
	local syntax = {
		-- GROUP, FOREGROUND, BACKGROUND, ATTRIBUTE, SPECIAL
		-- Normal = { c.vscFront, c.vscBack, 'none', nil },
		-- ColorColumn = { nil, c.vscCursorDarkDark, 'none', nil },
		-- Cursor = { c.vscCursorDark, c.vscCursorLight, 'none', nil },
		-- CursorLine = { nil, c.vscCursorDarkDark, 'none', nil },
		-- CursorColumn = { nil, c.vscCursorDarkDark, 'none', nil },
		-- Directory = { c.vscBlue, c.vscBack, 'none', nil },
		-- DiffAdd = { nil, c.vscDiffGreenLight, 'none', nil },
		-- DiffChange = { nil, c.vscDiffRedDark, 'none', nil },
		-- DiffDelete = { nil, c.vscDiffRedLight, 'none', nil },
		-- DiffText = { nil, c.vscDiffRedLight, 'none', nil },
		-- EndOfBuffer = { c.vscBack, nil, 'none', nil },
		-- ErrorMsg = { c.vscRed, c.vscBack, 'none', nil },
		-- VertSplit = { c.vscSplitDark, c.vscBack, 'none', nil },
		-- Folded = { c.vscLeftLight, c.vscLeftDark, 'underline', nil },
		-- FoldColumn = { c.vscLineNumber, c.vscBack, 'none', nil },
		-- SignColumn = { nil, c.vscBack, 'none', nil },
		-- IncSearch = { c.vscNone, c.vscSearchCurrent, 'none', nil },
		-- LineNr = { c.vscLineNumber, c.vscBack, 'none', nil },
		-- CursorLineNr = { c.vscPopupFront, c.vscBack, 'none', nil },
		-- MatchParen = { c.vscNone, c.vscCursorDark, 'none', nil },
		-- ModeMsg = { c.vscFront, c.vscLeftDark, 'none', nil },
		-- MoreMsg = { c.vscFront, c.vscLeftDark, 'none', nil },
		-- NonText = { isDark and c.vscLineNumber or c.vscTabOther, c.vscBack, 'none', nil },
		-- Pmenu = { c.vscPopupFront, c.vscPopupBack, 'none', nil },
		-- PmenuSel = {
		-- 	isDark and c.vscPopupFront or c.vscBack,
		-- 	c.vscPopupHighlightBlue,
		-- 	'none',
		-- 	nil,
		-- },
		-- PmenuSbar = { nil, c.vscPopupHighlightGray, 'none', nil },
		-- PmenuThumb = { nil, c.vscPopupFront, 'none', nil },
		-- Question = { c.vscBlue, c.vscBack, 'none', nil },
		-- Search = { c.vscNone, c.vscSearch, 'none', nil },
		-- SpecialKey = { c.vscBlue, c.vscNone, 'none', nil },
		-- StatusLine = { c.vscFront, c.vscLeftMid, 'none', nil },
		-- StatusLineNC = { c.vscFront, c.vscLeftDark, 'none', nil },
		-- TabLine = { c.vscFront, c.vscTabOther, 'none', nil },
		-- TabLineFill = { c.vscFront, c.vscTabOutside, 'none', nil },
		-- TabLineSel = { c.vscFront, c.vscTabCurrent, 'none', nil },
		-- Title = { c.vscNone, c.vscNone, 'bold', nil },
		-- Visual = { c.vscNone, c.vscSelection, 'none', nil },
		-- VisualNOS = { c.vscNone, c.vscSelection, 'none', nil },
		-- WarningMsg = { c.vscRed, c.vscBack, 'bold', nil },
		-- WildMenu = { c.vscNone, c.vscSelection, 'none', nil },
		-- Comment = { c.vscGreen, nil, isItalic and 'italic' or 'none', nil },
		-- Constant = { c.vscBlue, nil, 'none', nil },
		-- String = { c.vscOrange, nil, 'none', nil },
		-- Character = { c.vscOrange, nil, 'none', nil },
		-- Number = { c.vscLightGreen, nil, 'none', nil },
		-- Boolean = { c.vscBlue, nil, 'none', nil },
		-- Float = { c.vscLightGreen, nil, 'none', nil },
		-- Identifier = { c.vscLightBlue, nil, 'none', nil },
		-- Function = { c.vscYellow, nil, 'none', nil },
		-- Statement = { c.vscPink, nil, 'none', nil },
		-- Conditional = { c.vscPink, nil, 'none', nil },
		-- Repeat = { c.vscPink, nil, 'none', nil },
		-- Label = { c.vscPink, nil, 'none', nil },
		-- Operator = { c.vscFront, nil, 'none', nil },
		-- Keyword = { c.vscPink, nil, 'none', nil },
		-- Exception = { c.vscPink, nil, 'none', nil },
		-- PreProc = { c.vscPink, nil, 'none', nil },
		-- Include = { c.vscPink, nil, 'none', nil },
		-- Define = { c.vscPink, nil, 'none', nil },
		-- Macro = { c.vscPink, nil, 'none', nil },
		-- Type = { c.vscBlue, nil, 'none', nil },
		-- StorageClass = { c.vscBlue, nil, 'none', nil },
		-- Structure = { c.vscBlue, nil, 'none', nil },
		-- Typedef = { c.vscBlue, nil, 'none', nil },
		-- Special = { c.vscYellowOrange, nil, 'none', nil },
		-- SpecialChar = { c.vscFront, nil, 'none', nil },
		-- Tag = { c.vscFront, nil, 'none', nil },
		-- Delimiter = { c.vscFront, nil, 'none', nil },
		-- SpecialComment = { c.vscGreen, nil, 'none', nil },
		-- Debug = { c.vscFront, nil, 'none', nil },
		-- Underlined = { c.vscNone, nil, 'underline', nil },
		-- Conceal = { c.vscFront, c.vscBack, 'none', nil },
		-- Ignore = { c.vscFront, nil, 'none', nil },
		-- Error = { c.vscRed, c.vscBack, 'undercurl', c.vscRed },
		-- Todo = { c.vscYellowOrange, c.vscBack, 'bold', nil },
		-- SpellBad = { c.vscRed, c.vscBack, 'undercurl', c.vscRed },
		-- SpellCap = { c.vscRed, c.vscBack, 'undercurl', c.vscRed },
		-- SpellRare = { c.vscRed, c.vscBack, 'undercurl', c.vscRed },
		-- SpellLocal = { c.vscRed, c.vscBack, 'undercurl', c.vscRed },
		-- Whitespace = { isDark and c.vscLineNumber or c.vscTabOther, nil, 'none', nil },

		-- Treesitter
		-- TSError = { c.vscRed, nil, 'none', nil },
		-- TSPunctBracket = { c.vscFront, nil, 'none', nil },
		-- TSPunctSpecial = { c.vscFront, nil, 'none', nil },
		-- TSConstant = { c.vscYellow, nil, 'none', nil },
		-- TSConstBuiltin = { c.vscBlue, nil, 'none', nil },
		-- TSConstMacro = { c.vscBlueGreen, nil, 'none', nil },
		-- TSStringRegex = { c.vscOrange, nil, 'none', nil },
		-- TSString = { c.vscOrange, nil, 'none', nil },
		-- TSCharacter = { c.vscOrange, nil, 'none', nil },
		-- TSNumber = { c.vscLightGreen, nil, 'none', nil },
		-- TSBoolean = { c.vscBlue, nil, 'none', nil },
		-- TSFloat = { c.vscLightGreen, nil, 'none', nil },
		-- TSAnnotation = { c.vscYellow, nil, 'none', nil },
		-- TSAttribute = { c.vscBlueGreen, nil, 'none', nil },
		-- TSNamespace = { c.vscBlueGreen, nil, 'none', nil },
		-- TSFuncBuiltin = { c.vscYellow, nil, 'none', nil },
		-- TSFunction = { c.vscYellow, nil, 'none', nil },
		-- TSFuncMacro = { c.vscYellow, nil, 'none', nil },
		-- TSParameter = { c.vscLightBlue, nil, 'none', nil },
		-- TSParameterReference = { c.vscLightBlue, nil, 'none', nil },
		-- TSMethod = { c.vscYellow, nil, 'none', nil },
		-- TSField = { c.vscLightBlue, nil, 'none', nil },
		-- TSProperty = { c.vscLightBlue, nil, 'none', nil },
		-- TSConstructor = { c.vscBlueGreen, nil, 'none', nil },
		-- TSConditional = { c.vscPink, nil, 'none', nil },
		-- TSRepeat = { c.vscPink, nil, 'none', nil },
		-- TSLabel = { c.vscLightBlue, nil, 'none', nil },
		-- TSKeyword = { c.vscBlue, nil, 'none', nil },
		-- TSKeywordFunction = { c.vscBlue, nil, 'none', nil },
		-- TSKeywordOperator = { c.vscBlue, nil, 'none', nil },
		-- TSOperator = { c.vscFront, nil, 'none', nil },
		-- TSException = { c.vscPink, nil, 'none', nil },
		-- TSType = { c.vscBlueGreen, nil, 'none', nil },
		-- TSTypeBuiltin = { c.vscBlue, nil, 'none', nil },
		-- TSStructure = { c.vscLightBlue, nil, 'none', nil },
		-- TSInclude = { c.vscPink, nil, 'none', nil },
		-- TSVariable = { c.vscLightBlue, nil, 'none', nil },
		-- TSVariableBuiltin = { c.vscLightBlue, nil, 'none', nil },
		-- TSText = { c.vscYellowOrange, nil, 'none', nil },
		-- TSUnderline = { c.vscYellowOrange, nil, 'none', nil },
		-- TSTag = { c.vscBlue, nil, 'none', nil },
		-- TSTagDelimiter = { c.vscGray, nil, 'none', nil },

		-- TSTitle = { isDark and c.vscBlue or c.vscYellowOrange, nil, 'bold', nil },
		-- TSLiteral = { c.vscFront, 'none', nil },
		-- TSEmphasis = { c.vscFront, nil, 'italic', nil },
		-- TSStrong = { isDark and c.vscBlue or c.vscViolet, nil, 'bold', nil },
		-- TSURI = { c.vscFront, nil, 'none', nil },
		-- TSTextReference = { isDark and c.vscOrange or c.vscYellowOrange, nil, 'none', nil },
		-- TSPunctDelimiter = { c.vscFront, nil, 'none', nil },
		-- TSStringEscape = { isDark and c.vscOrange or c.vscYellowOrange, nil, 'bold', nil },

		-- TSNote = { c.vscBlueGreen, nil, 'bold', nil },
		-- TSWarning = { c.vscYellowOrange, nil, 'bold', nil },
		-- TSDanger = { c.vscRed, nil, 'bold', nil },

		-- Markdown
		markdownBold = { isDark and c.vscBlue or c.vscYellowOrange, nil, 'bold', nil },
		markdownCode = { c.vscOrange, nil, 'none', nil },
		markdownRule = { isDark and c.vscBlue or c.vscYellowOrange, nil, 'bold', nil },
		markdownCodeDelimiter = { c.vscFront, nil, 'none', nil },
		markdownHeadingDelimiter = {
			isDark and c.vscBlue or c.vscYellowOrange,
			nil,
			'none',
			nil,
		},
		markdownFootnote = { isDark and c.vscOrange or c.vscYellowOrange, nil, 'none', nil },
		markdownFootnoteDefinition = {
			isDark and c.vscOrange or c.vscYellowOrange,
			nil,
			'none',
			nil,
		},
		markdownUrl = { c.vscFront, nil, 'underline', nil },
		markdownLinkText = { isDark and c.vscOrange or c.vscYellowOrange, nil, 'none', nil },
		markdownEscape = { isDark and c.vscOrange or c.vscYellowOrange, nil, 'none', nil },
		markdownTSPunctSpecial = { isDark and c.vscBlue or c.vscYellowOrange, nil, 'bold', nil },

		-- JSON
		jsonKeyword = { c.vscLightBlue, nil, 'none', nil },
		jsonEscape = { c.vscYellowOrange, nil, 'none', nil },
		jsonNull = { c.vscBlue, nil, 'none', nil },
		jsonBoolean = { c.vscBlue, nil, 'none', nil },

		-- HTML
		htmlTag = { c.vscGray, nil, 'none', nil },
		htmlEndTag = { c.vscGray, nil, 'none', nil },
		htmlTagName = { c.vscBlue, nil, 'none', nil },
		htmlSpecialTagName = { c.vscBlue, nil, 'none', nil },
		htmlArg = { c.vscLightBlue, nil, 'none', nil },

		-- PHP
		phpStaticClasses = { c.vscBlueGreen, nil, 'none', nil },
		phpMethod = { c.vscYellow, nil, 'none', nil },
		phpClass = { c.vscBlueGreen, nil, 'none', nil },
		phpFunction = { c.vscYellow, nil, 'none', nil },
		phpInclude = { c.vscBlue, nil, 'none', nil },
		phpUseClass = { c.vscBlueGreen, nil, 'none', nil },
		phpRegion = { c.vscBlueGreen, nil, 'none', nil },
		phpMethodsVar = { c.vscLightBlue, nil, 'none', nil },

		-- CSS
		cssBraces = { c.vscFront, nil, 'none', nil },
		cssInclude = { c.vscPink, nil, 'none', nil },
		cssTagName = { c.vscYellowOrange, nil, 'none', nil },
		cssClassName = { c.vscYellowOrange, nil, 'none', nil },
		cssPseudoClass = { c.vscYellowOrange, nil, 'none', nil },
		cssPseudoClassId = { c.vscYellowOrange, nil, 'none', nil },
		cssPseudoClassLang = { c.vscYellowOrange, nil, 'none', nil },
		cssIdentifier = { c.vscYellowOrange, nil, 'none', nil },
		cssProp = { c.vscLightBlue, nil, 'none', nil },
		cssDefinition = { c.vscLightBlue, nil, 'none', nil },
		cssAttr = { c.vscOrange, nil, 'none', nil },
		cssAttrRegion = { c.vscOrange, nil, 'none', nil },
		cssColor = { c.vscOrange, nil, 'none', nil },
		cssFunction = { c.vscOrange, nil, 'none', nil },
		cssFunctionName = { c.vscOrange, nil, 'none', nil },
		cssVendor = { c.vscOrange, nil, 'none', nil },
		cssValueNumber = { c.vscOrange, nil, 'none', nil },
		cssValueLength = { c.vscOrange, nil, 'none', nil },
		cssUnitDecorators = { c.vscOrange, nil, 'none', nil },
		cssStyle = { c.vscLightBlue, nil, 'none', nil },
		cssImportant = { c.vscBlue, nil, 'none', nil },

		-- JavaScript
		jsVariableDef = { c.vscLightBlue, nil, 'none', nil },
		jsFuncArgs = { c.vscLightBlue, nil, 'none', nil },
		jsFuncBlock = { c.vscLightBlue, nil, 'none', nil },
		jsRegexpString = { c.vscLightRed, nil, 'none', nil },
		jsThis = { c.vscBlue, nil, 'none', nil },
		jsOperatorKeyword = { c.vscBlue, nil, 'none', nil },
		jsDestructuringBlock = { c.vscLightBlue, nil, 'none', nil },
		jsObjectKey = { c.vscLightBlue, nil, 'none', nil },
		jsGlobalObjects = { c.vscBlueGreen, nil, 'none', nil },
		jsModuleKeyword = { c.vscLightBlue, nil, 'none', nil },
		jsClassDefinition = { c.vscBlueGreen, nil, 'none', nil },
		jsClassKeyword = { c.vscBlue, nil, 'none', nil },
		jsExtendsKeyword = { c.vscBlue, nil, 'none', nil },
		jsExportDefault = { c.vscPink, nil, 'none', nil },
		jsFuncCall = { c.vscYellow, nil, 'none', nil },
		jsObjectValue = { c.vscLightBlue, nil, 'none', nil },
		jsParen = { c.vscLightBlue, nil, 'none', nil },
		jsObjectProp = { c.vscLightBlue, nil, 'none', nil },
		jsIfElseBlock = { c.vscLightBlue, nil, 'none', nil },
		jsParenIfElse = { c.vscLightBlue, nil, 'none', nil },
		jsSpreadOperator = { c.vscLightBlue, nil, 'none', nil },
		jsSpreadExpression = { c.vscLightBlue, nil, 'none', nil },

		-- Typescript
		typescriptLabel = { c.vscLightBlue, nil, 'none', nil },
		typescriptExceptions = { c.vscLightBlue, nil, 'none', nil },
		typescriptBraces = { c.vscFront, nil, 'none', nil },
		typescriptEndColons = { c.vscLightBlue, nil, 'none', nil },
		typescriptParens = { c.vscFront, nil, 'none', nil },
		typescriptDocTags = { c.vscBlue, nil, 'none', nil },
		typescriptDocComment = { c.vscBlueGreen, nil, 'none', nil },
		typescriptLogicSymbols = { c.vscLightBlue, nil, 'none', nil },
		typescriptImport = { c.vscPink, nil, 'none', nil },
		typescriptBOM = { c.vscLightBlue, nil, 'none', nil },
		typescriptVariableDeclaration = { c.vscLightBlue, nil, 'none', nil },
		typescriptVariable = { c.vscBlue, nil, 'none', nil },
		typescriptExport = { c.vscPink, nil, 'none', nil },
		typescriptAliasDeclaration = { c.vscBlueGreen, nil, 'none', nil },
		typescriptAliasKeyword = { c.vscBlue, nil, 'none', nil },
		typescriptClassName = { c.vscBlueGreen, nil, 'none', nil },
		typescriptAccessibilityModifier = { c.vscBlue, nil, 'none', nil },
		typescriptOperator = { c.vscBlue, nil, 'none', nil },
		typescriptArrowFunc = { c.vscBlue, nil, 'none', nil },
		typescriptMethodAccessor = { c.vscBlue, nil, 'none', nil },
		typescriptMember = { c.vscYellow, nil, 'none', nil },
		typescriptTypeReference = { c.vscBlueGreen, nil, 'none', nil },
		typescriptTemplateSB = { c.vscYellowOrange, nil, 'none', nil },
		typescriptArrowFuncArg = { c.vscLightBlue, nil, 'none', nil },
		typescriptParamImpl = { c.vscLightBlue, nil, 'none', nil },
		typescriptFuncComma = { c.vscLightBlue, nil, 'none', nil },
		typescriptCastKeyword = { c.vscLightBlue, nil, 'none', nil },
		typescriptCall = { c.vscBlue, nil, 'none', nil },
		typescriptCase = { c.vscLightBlue, nil, 'none', nil },
		typescriptReserved = { c.vscPink, nil, 'none', nil },
		typescriptDefault = { c.vscLightBlue, nil, 'none', nil },
		typescriptDecorator = { c.vscYellow, nil, 'none', nil },
		typescriptPredefinedType = { c.vscBlueGreen, nil, 'none', nil },
		typescriptClassHeritage = { c.vscBlueGreen, nil, 'none', nil },
		typescriptClassExtends = { c.vscBlue, nil, 'none', nil },
		typescriptClassKeyword = { c.vscBlue, nil, 'none', nil },
		typescriptBlock = { c.vscLightBlue, nil, 'none', nil },
		typescriptDOMDocProp = { c.vscLightBlue, nil, 'none', nil },
		typescriptTemplateSubstitution = { c.vscLightBlue, nil, 'none', nil },
		typescriptClassBlock = { c.vscLightBlue, nil, 'none', nil },
		typescriptFuncCallArg = { c.vscLightBlue, nil, 'none', nil },
		typescriptIndexExpr = { c.vscLightBlue, nil, 'none', nil },
		typescriptConditionalParen = { c.vscLightBlue, nil, 'none', nil },
		typescriptArray = { c.vscYellow, nil, 'none', nil },
		typescriptES6SetProp = { c.vscLightBlue, nil, 'none', nil },
		typescriptObjectLiteral = { c.vscLightBlue, nil, 'none', nil },
		typescriptTypeParameter = { c.vscBlueGreen, nil, 'none', nil },
		typescriptEnumKeyword = { c.vscBlue, nil, 'none', nil },
		typescriptEnum = { c.vscBlueGreen, nil, 'none', nil },
		typescriptLoopParen = { c.vscLightBlue, nil, 'none', nil },
		typescriptParenExp = { c.vscLightBlue, nil, 'none', nil },
		typescriptModule = { c.vscLightBlue, nil, 'none', nil },
		typescriptAmbientDeclaration = { c.vscBlue, nil, 'none', nil },
		typescriptFuncTypeArrow = { c.vscBlue, nil, 'none', nil },
		typescriptInterfaceHeritage = { c.vscBlueGreen, nil, 'none', nil },
		typescriptInterfaceName = { c.vscBlueGreen, nil, 'none', nil },
		typescriptInterfaceKeyword = { c.vscBlue, nil, 'none', nil },
		typescriptInterfaceExtends = { c.vscBlue, nil, 'none', nil },
		typescriptGlobal = { c.vscBlueGreen, nil, 'none', nil },
		typescriptAsyncFuncKeyword = { c.vscBlue, nil, 'none', nil },
		typescriptFuncKeyword = { c.vscBlue, nil, 'none', nil },
		typescriptGlobalMethod = { c.vscYellow, nil, 'none', nil },
		typescriptPromiseMethod = { c.vscYellow, nil, 'none', nil },

		-- XML
		xmlTag = { c.vscBlue, nil, 'none', nil },
		xmlTagName = { c.vscBlue, nil, 'none', nil },
		xmlEndTag = { c.vscBlue, nil, 'none', nil },

		-- Ruby
		rubyClassNameTag = { c.vscBlueGreen, nil, 'none', nil },
		rubyClassName = { c.vscBlueGreen, nil, 'none', nil },
		rubyModuleName = { c.vscBlueGreen, nil, 'none', nil },
		rubyConstant = { c.vscBlueGreen, nil, 'none', nil },

		-- Golang
		goPackage = { c.vscBlue, nil, 'none', nil },
		goImport = { c.vscBlue, nil, 'none', nil },
		goVar = { c.vscBlue, nil, 'none', nil },
		goConst = { c.vscBlue, nil, 'none', nil },
		goStatement = { c.vscPink, nil, 'none', nil },
		goType = { c.vscBlueGreen, nil, 'none', nil },
		goSignedInts = { c.vscBlueGreen, nil, 'none', nil },
		goUnsignedInts = { c.vscBlueGreen, nil, 'none', nil },
		goFloats = { c.vscBlueGreen, nil, 'none', nil },
		goComplexes = { c.vscBlueGreen, nil, 'none', nil },
		goBuiltins = { c.vscYellow, nil, 'none', nil },
		goBoolean = { c.vscBlue, nil, 'none', nil },
		goPredefinedIdentifiers = { c.vscBlue, nil, 'none', nil },
		goTodo = { c.vscGreen, nil, 'none', nil },
		goDeclaration = { c.vscBlue, nil, 'none', nil },
		goDeclType = { c.vscBlue, nil, 'none', nil },
		goTypeDecl = { c.vscBlue, nil, 'none', nil },
		goTypeName = { c.vscBlueGreen, nil, 'none', nil },
		goVarAssign = { c.vscLightBlue, nil, 'none', nil },
		goVarDefs = { c.vscLightBlue, nil, 'none', nil },
		goReceiver = { c.vscFront, nil, 'none', nil },
		goReceiverType = { c.vscFront, nil, 'none', nil },
		goFunctionCall = { c.vscYellow, nil, 'none', nil },
		goMethodCall = { c.vscYellow, nil, 'none', nil },
		goSingleDecl = { c.vscLightBlue, nil, 'none', nil },
		-- Python
		pythonStatement = { c.vscBlue, nil, 'none', nil },
		pythonOperator = { c.vscBlue, nil, 'none', nil },
		pythonException = { c.vscPink, nil, 'none', nil },
		pythonExClass = { c.vscBlueGreen, nil, 'none', nil },
		pythonBuiltinObj = { c.vscLightBlue, nil, 'none', nil },
		pythonBuiltinType = { c.vscBlueGreen, nil, 'none', nil },
		pythonBoolean = { c.vscBlue, nil, 'none', nil },
		pythonNone = { c.vscBlue, nil, 'none', nil },
		pythonTodo = { c.vscBlue, nil, 'none', nil },
		pythonClassVar = { c.vscBlue, nil, 'none', nil },
		pythonClassDef = { c.vscBlueGreen, nil, 'none', nil },
		-- TeX
		texStatement = { c.vscBlue, nil, 'none', nil },
		texBeginEnd = { c.vscYellow, nil, 'none', nil },
		texBeginEndName = { c.vscLightBlue, nil, 'none', nil },
		texOption = { c.vscLightBlue, nil, 'none', nil },
		texBeginEndModifier = { c.vscLightBlue, nil, 'none', nil },
		texDocType = { c.vscPink, nil, 'none', nil },
		texDocTypeArgs = { c.vscLightBlue, nil, 'none', nil },

		-- Git
		gitcommitHeader = { c.vscGray, nil, 'none', nil },
		gitcommitOnBranch = { c.vscGray, nil, 'none', nil },
		gitcommitBranch = { c.vscPink, nil, 'none', nil },
		gitcommitComment = { c.vscGray, nil, 'none', nil },
		gitcommitSelectedType = { c.vscGreen, nil, 'none', nil },
		gitcommitSelectedFile = { c.vscGreen, nil, 'none', nil },
		gitcommitDiscardedType = { c.vscRed, nil, 'none', nil },
		gitcommitDiscardedFile = { c.vscRed, nil, 'none', nil },
		gitcommitOverflow = { c.vscRed, nil, 'none', nil },
		gitcommitSummary = { c.vscPink, nil, 'none', nil },
		gitcommitBlank = { c.vscPink, nil, 'none', nil },

		-- Lua
		luaFuncCall = { c.vscYellow, nil, 'none', nil },
		luaFuncArgName = { c.vscLightBlue, nil, 'none', nil },
		luaFuncKeyword = { c.vscPink, nil, 'none', nil },
		luaLocal = { c.vscPink, nil, 'none', nil },
		luaBuiltIn = { c.vscBlue, nil, 'none', nil },

		-- SH
		shDeref = { c.vscLightBlue, nil, 'none', nil },
		shVariable = { c.vscLightBlue, nil, 'none', nil },

		-- SQL
		sqlKeyword = { c.vscPink, nil, 'none', nil },
		sqlFunction = { c.vscYellowOrange, nil, 'none', nil },
		sqlOperator = { c.vscPink, nil, 'none', nil },

		-- YAML
		yamlKey = { c.vscBlue, nil, 'none', nil },
		yamlConstant = { c.vscBlue, nil, 'none', nil },

		-- Gitgutter
		GitGutterAdd = { c.vscGreen, nil, 'none', nil },
		GitGutterChange = { c.vscYellow, nil, 'none', nil },
		GitGutterDelete = { c.vscRed, nil, 'none', nil },

		-- Git Signs
		GitSignsAdd = { c.vscGreen, nil, 'none', nil },
		GitSignsChange = { c.vscYellow, nil, 'none', nil },
		GitSignsDelete = { c.vscRed, nil, 'none', nil },
		GitSignsAddLn = { c.vscBack, c.vscGreen, 'none', nil },
		GitSignsChangeLn = { c.vscBack, c.vscYellow, 'none', nil },
		GitSignsDeleteLn = { c.vscBack, c.vscRed, 'none', nil },

		-- NvimTree
		NvimTreeRootFolder = { c.vscFront, nil, 'bold', nil },
		NvimTreeGitDirty = { c.vscYellow, nil, 'none', nil },
		NvimTreeGitNew = { c.vscGreen, nil, 'none', nil },
		NvimTreeImageFile = { c.vscViolet, nil, 'none', nil },
		NvimTreeEmptyFolderName = { c.vscGray, nil, 'none', nil },
		NvimTreeFolderName = { c.vscFront, nil, 'none', nil },
		NvimTreeSpecialFile = { c.vscPink, nil, 'underline', nil },
		NvimTreeNormal = { c.vscFront, no_nvimtree_bg and c.vscBack or c.vscLeftDark, 'none', nil },
		NvimTreeCursorLine = { nil, no_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftMid, 'none', nil },
		NvimTreeVertSplit = { no_nvimtree_bg and c.vscSplitDark or c.vscBack, c.vscBack, 'none', nil },
		NvimTreeEndOfBuffer = { no_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftDark, nil, 'none', nil },
		NvimTreeOpenedFolderName = { nil, no_nvimtree_bg and c.vscCursorDarkDark or c.vscLeftDark, 'none', nil },

		-- Bufferline
		-- BufferLineIndicatorSelected = { c.vscLeftDark, nil, 'none', nil },
		-- BufferLineFill = { nil, c.vscLeftDark, 'none', nil },

		-- BarBar
		-- BufferCurrent = { c.vscFront, c.vscTabCurrent, 'none', nil },
		-- BufferCurrentIndex = { c.vscFront, c.vscTabCurrent, 'none', nil },
		-- BufferCurrentMod = { c.vscYellowOrange, c.vscTabCurrent, 'none', nil },
		-- BufferCurrentSign = { c.vscFront, c.vscTabCurrent, 'none', nil },
		-- BufferCurrentTarget = { c.vscRed, c.vscTabCurrent, 'none', nil },
		-- BufferVisible = { c.vscGray, c.vscTabCurrent, 'none', nil },
		-- BufferVisibleIndex = { c.vscGray, c.vscTabCurrent, 'none', nil },
		-- BufferVisibleMod = { c.vscYellowOrange, c.vscTabCurrent, 'none', nil },
		-- BufferVisibleSign = { c.vscGray, c.vscTabCurrent, 'none', nil },
		-- BufferVisibleTarget = { c.vscRed, c.vscTabCurrent, 'none', nil },
		-- BufferInactive = { c.vscGray, c.vscTabOther, 'none', nil },
		-- BufferInactiveIndex = { c.vscGray, c.vscTabOther, 'none', nil },
		-- BufferInactiveMod = { c.vscYellowOrange, c.vscTabOther, 'none', nil },
		-- BufferInactiveSign = { c.vscGray, c.vscTabOther, 'none', nil },
		-- BufferInactiveTarget = { c.vscRed, c.vscTabOther, 'none', nil },
		-- BufferTabpages = { c.vscFront, c.vscTabOther, 'none', nil },
		-- BufferTabpagesFill = { c.vscFront, c.vscTabOther, 'none', nil },

		-- IndentBlankLine
		IndentBlanklineContextChar = { c.vscRed, nil, 'nocombine', nil },
		IndentBlanklineContextStart = { c.vscRed, nil, 'nocombine', nil },
		IndentBlanklineChar = {
			isDark and c.vscLineNumber or c.vscTabOther,
			nil,
			'nocombine',
			nil,
		},
		IndentBlanklineSpaceChar = {
			isDark and c.vscLineNumber or c.vscTabOther,
			nil,
			'nocombine',
			nil,
		},
		IndentBlanklineSpaceCharBlankline = {
			isDark and c.vscLineNumber or c.vscTabOther,
			nil,
			'nocombine',
			nil,
		},

		-- LSP
		DiagnosticError = { c.vscRed, nil, 'none', nil },
		DiagnosticWarn = { c.vscYellow, nil, 'none', nil },
		DiagnosticInfo = { c.vscBlue, nil, 'none', nil },
		DiagnosticHint = { c.vscBlue, nil, 'none', nil },
		DiagnosticUnderlineError = { nil, nil, 'undercurl', c.vscRed },
		DiagnosticUnderlineWarn = { nil, nil, 'undercurl', c.vscYellow },
		DiagnosticUnderlineInfo = { nil, nil, 'undercurl', c.vscBlue },
		DiagnosticUnderlineHint = { nil, nil, 'undercurl', c.vscBlue },
		LspReferenceText = { nil, c.vscPopupHighlightGray, 'none', nil },
		LspReferenceRead = { nil, c.vscPopupHighlightGray, 'none', nil },
		LspReferenceWrite = { nil, c.vscPopupHighlightGray, 'none', nil },

		-- Nvim compe
		CmpItemKindVariable = { c.vscLightBlue, nil, 'none', nil },
		CmpItemKindInterface = { c.vscLightBlue, nil, 'none', nil },
		CmpItemKindText = { c.vscLightBlue, nil, 'none', nil },
		CmpItemKindFunction = { c.vscPink, nil, 'none', nil },
		CmpItemKindMethod = { c.vscPink, nil, 'none', nil },
		CmpItemKindKeyword = { c.vscFront, nil, 'none', nil },
		CmpItemKindProperty = { c.vscFront, nil, 'none', nil },
		CmpItemKindUnit = { c.vscFront, nil, 'none', nil },
		CmpItemKindConstructor = { c.vscUiOrange, nil, 'none', nil },
		CmpItemAbbrDeprecated = { c.vscCursorDark, c.vscPopupBack, 'strikethrough', nil },
		CmpItemAbbrMatch = {
			isDark and c.vscBlue or c.vscDarkBlue,
			c.vscPopupBack,
			'bold',
			nil,
		},
	}

	-- if isDark then
	-- syntax.NvimTreeFolderIcon = { c.vscBlue, nil, 'none', nil }
	-- syntax.NvimTreeIndentMarker = { c.vscLineNumber, nil, 'none', nil }

	-- syntax.LspFloatWinNormal = { c.vscFront, nil, 'none', nil }
	-- syntax.LspFloatWinBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaHoverBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaSignatureHelpBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaCodeActionBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaDefPreviewBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspLinesDiagBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaRenameBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaBorderTitle = { c.vscCursorDark, nil, 'none', nil }
	-- syntax.LSPSagaDiagnosticTruncateLine = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaDiagnosticBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaDiagnosticBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaShTruncateLine = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaShTruncateLine = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaDocTruncateLine = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaRenameBorder = { c.vscLineNumber, nil, 'none', nil }
	-- syntax.LspSagaLspFinderBorder = { c.vscLineNumber, nil, 'none', nil }

	-- symbols-outline
	-- white fg and lualine blue bg
	-- syntax.FocusedSymbol = { '#ffffff', c.vscUiBlue, 'none', nil }
	-- syntax.SymbolsOutlineConnector = { c.vscLineNumber, nil, 'none', nil }
	-- else
	-- 	syntax.NvimTreeFolderIcon = { c.vscDarkBlue, nil, 'none', nil }
	-- 	syntax.NvimTreeIndentMarker = { c.vscTabOther, nil, 'none', nil }

	-- 	syntax.LspFloatWinNormal = { c.vscFront, nil, 'none', nil }
	-- 	syntax.LspFloatWinBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaHoverBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaSignatureHelpBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaCodeActionBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaDefPreviewBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspLinesDiagBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaRenameBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaBorderTitle = { c.vscCursorDark, nil, 'none', nil }
	-- 	syntax.LSPSagaDiagnosticTruncateLine = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaDiagnosticBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaDiagnosticBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaShTruncateLine = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaShTruncateLine = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaDocTruncateLine = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaRenameBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.LspSagaLspFinderBorder = { c.vscTabOther, nil, 'none', nil }

	-- 	syntax.TelescopePromptBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.TelescopeResultsBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.TelescopePreviewBorder = { c.vscTabOther, nil, 'none', nil }
	-- 	syntax.TelescopeNormal = { c.vscFront, nil, 'none', nil }
	-- 	syntax.TelescopeSelection = { c.vscBack, c.vscPopupHighlightBlue, 'none', nil }
	-- 	syntax.TelescopeMultiSelection = { c.vscBack, c.vscPopupHighlightBlue, 'none', nil }
	-- 	syntax.TelescopeMatching = { c.vscDarkBlue, nil, 'bold', nil }
	-- 	syntax.TelescopePromptPrefix = { c.vscFront, nil, 'none', nil }

	-- 	-- symbols-outline
	-- 	-- white fg and lualine blue bg
	-- 	syntax.FocusedSymbol = { c.vscBack, '#AF00DB', 'none', nil }
	-- 	syntax.SymbolsOutlineConnector = { c.vscTabOther, nil, 'none', nil }
	-- end

	-- Support for legacy config keys (Neovim<=0.5.1)
	syntax.LspDiagnosticsDefaultError = syntax.DiagnosticError
	syntax.LspDiagnosticsDefaultHint = syntax.DiagnosticHint
	syntax.LspDiagnosticsDefaultInformation = syntax.DiagnosticInfo
	syntax.LspDiagnosticsDefaultWarning = syntax.DiagnosticWarn
	syntax.LspDiagnosticsUnderlineError = syntax.DiagnosticUnderlineError
	syntax.LspDiagnosticsUnderlineHint = syntax.DiagnosticUnderlineHint
	syntax.LspDiagnosticsUnderlineInformation = syntax.DiagnosticUnderlineInfo
	syntax.LspDiagnosticsUnderlineWarning = syntax.DiagnosticUnderlineWarn

	return syntax
end

vim.g.colors_name = 'vscode'

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
	vim.cmd('syntax reset')
end

vim.api.nvim_set_hl(0, 'Normal', { fg = c.vscFront, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'Cursor', { fg = c.vscCursorDark, bg = c.vscCursorLight })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'CursorColumn', { bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'Directory', { fg = c.vscBlue, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = c.vscDiffGreenLight, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'DiffChange', { fg = c.vscDiffRedDark, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'DiffDelete', { fg = c.vscDiffRedLight, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'DiffText', { fg = c.vscDiffRedLight, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = c.vscBack, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'ErrorMsg', { fg = c.vscRed, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'VertSplit', { fg = c.vscSplitDark, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Folded', { fg = c.vscLeftLight, bg = c.vscLeftDark, underline = true })
vim.api.nvim_set_hl(0, 'FoldColumn', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = c.vscBack })
vim.api.nvim_set_hl(0, 'IncSearch', { fg = c.vscNone, bg = c.vscSearchCurrent })
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.vscPopupFront, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'MatchParen', { fg = c.vscNone, bg = c.vscCursorDark })
vim.api.nvim_set_hl(0, 'ModeMsg', { fg = c.vscFront, bg = c.vscLeftDark })
vim.api.nvim_set_hl(0, 'MoreMsg', { fg = c.vscFront, bg = c.vscLeftDark })
vim.api.nvim_set_hl(0, 'NonText', { fg = c.vscLineNumber, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Pmenu', { fg = c.vscPopupFront, bg = c.vscPopupBack })
vim.api.nvim_set_hl(0, 'PmenuSel', { fg = c.vscPopupFront, bg = c.vscPopupHighlightBlue })

vim.api.nvim_set_hl(0, 'PmenuSbar', { bg = c.vscPopupHighlightGray })
vim.api.nvim_set_hl(0, 'PmenuThumb', { bg = c.vscPopupFront })
vim.api.nvim_set_hl(0, 'Question', { fg = c.vscBlue, bg = c.vscBack })
vim.api.nvim_set_hl(0, 'Search', { fg = c.vscNone, bg = c.vscSearch })
vim.api.nvim_set_hl(0, 'SpecialKey', { fg = c.vscBlue, bg = c.vscNone })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.vscFront, bg = c.vscLeftMid })
vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = c.vscFront, bg = c.vscLeftDark })
vim.api.nvim_set_hl(0, 'TabLine', { fg = c.vscFront, bg = c.vscTabOther })
vim.api.nvim_set_hl(0, 'TabLineFill', { fg = c.vscFront, bg = c.vscTabOutside })
vim.api.nvim_set_hl(0, 'TabLineSel', { fg = c.vscFront, bg = c.vscTabCurrent })
vim.api.nvim_set_hl(0, 'Title', { fg = c.vscNone, bg = c.vscNone, bold = true })
vim.api.nvim_set_hl(0, 'Visual', { fg = c.vscNone, bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'VisualNOS', { fg = c.vscNone, bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'WarningMsg', { fg = c.vscRed, bg = c.vscBack, bold = true })
vim.api.nvim_set_hl(0, 'WildMenu', { fg = c.vscNone, bg = c.vscSelection })
vim.api.nvim_set_hl(0, 'Comment', { fg = c.vscGreen, bg = c.vscBack, italic = true })
vim.api.nvim_set_hl(0, 'Constant', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'String', { fg = c.vscOrange })

vim.api.nvim_set_hl(0, 'Character', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'Number', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'Boolean', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Float', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'Function', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'Statement', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Conditional', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Repeat', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Label', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Operator', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Exception', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Include', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Define', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Macro', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'Type', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'StorageClass', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Structure', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Typedef', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'Special', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'SpecialChar', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'Tag', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'Delimiter', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'SpecialComment', { fg = c.vscGreen })
vim.api.nvim_set_hl(0, 'Debug', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'Underlined', { fg = c.vscNone, bg = c.vscNone, underline = true })
vim.api.nvim_set_hl(0, 'Conceal', { fg = c.vscFront, bg = c.vscBack, undercurl = true })
vim.api.nvim_set_hl(0, 'Ignore', { fg = c.vscFront, bg = c.vscBack, undercurl = true })
vim.api.nvim_set_hl(0, 'Error', { fg = c.vscRed, bg = c.vscBack, undercurl = true })
vim.api.nvim_set_hl(0, 'Todo', { fg = c.vscYellowOrange, bg = c.vscBack, bold = true })

vim.api.nvim_set_hl(0, 'SpellBad', { fg = c.vscRed, bg = c.vscBack, italic = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellCap', { fg = c.vscRed, bg = c.vscBack, italic = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellRare', { fg = c.vscRed, bg = c.vscBack, italic = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'SpellLocal', { fg = c.vscRed, bg = c.vscBack, italic = true, sp = c.vscRed })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = c.vscLineNumber, bg = c.vscNone, undercurl = true })

-- Treesitter
-- TSError = { c.vscRed, nil, 'none', nil },
-- TSPunctBracket = { c.vscFront, nil, 'none', nil },
-- TSPunctSpecial = { c.vscFront, nil, 'none', nil },
-- markdownTSPunctSpecial = { isDark and c.vscBlue or c.vscYellowOrange, nil, 'bold', nil },
-- TSConstant = { c.vscYellow, nil, 'none', nil },
-- TSConstBuiltin = { c.vscBlue, nil, 'none', nil },
-- TSConstMacro = { c.vscBlueGreen, nil, 'none', nil },
-- TSStringRegex = { c.vscOrange, nil, 'none', nil },
-- TSString = { c.vscOrange, nil, 'none', nil },
-- TSCharacter = { c.vscOrange, nil, 'none', nil },
-- TSNumber = { c.vscLightGreen, nil, 'none', nil },
-- TSBoolean = { c.vscBlue, nil, 'none', nil },
-- TSFloat = { c.vscLightGreen, nil, 'none', nil },
-- TSAnnotation = { c.vscYellow, nil, 'none', nil },
-- TSAttribute = { c.vscBlueGreen, nil, 'none', nil },
-- TSNamespace = { c.vscBlueGreen, nil, 'none', nil },
-- TSFuncBuiltin = { c.vscYellow, nil, 'none', nil },
-- TSFunction = { c.vscYellow, nil, 'none', nil },
-- TSFuncMacro = { c.vscYellow, nil, 'none', nil },
-- TSParameter = { c.vscLightBlue, nil, 'none', nil },
-- TSParameterReference = { c.vscLightBlue, nil, 'none', nil },
-- TSMethod = { c.vscYellow, nil, 'none', nil },
-- TSField = { c.vscLightBlue, nil, 'none', nil },
-- TSProperty = { c.vscLightBlue, nil, 'none', nil },
-- TSConstructor = { c.vscBlueGreen, nil, 'none', nil },
-- TSConditional = { c.vscPink, nil, 'none', nil },
-- TSRepeat = { c.vscPink, nil, 'none', nil },
-- TSLabel = { c.vscLightBlue, nil, 'none', nil },
-- TSKeyword = { c.vscBlue, nil, 'none', nil },
-- TSKeywordFunction = { c.vscBlue, nil, 'none', nil },
-- TSKeywordOperator = { c.vscBlue, nil, 'none', nil },
-- TSOperator = { c.vscFront, nil, 'none', nil },
-- TSException = { c.vscPink, nil, 'none', nil },
-- TSType = { c.vscBlueGreen, nil, 'none', nil },
-- TSTypeBuiltin = { c.vscBlue, nil, 'none', nil },
-- TSStructure = { c.vscLightBlue, nil, 'none', nil },
-- TSInclude = { c.vscPink, nil, 'none', nil },
-- TSVariable = { c.vscLightBlue, nil, 'none', nil },
-- TSVariableBuiltin = { c.vscLightBlue, nil, 'none', nil },
-- TSText = { c.vscYellowOrange, nil, 'none', nil },
-- TSUnderline = { c.vscYellowOrange, nil, 'none', nil },
-- TSTag = { c.vscBlue, nil, 'none', nil },
-- TSTagDelimiter = { c.vscGray, nil, 'none', nil },

-- TSTitle = { isDark and c.vscBlue or c.vscYellowOrange, nil, 'bold', nil },
-- TSLiteral = { c.vscFront, 'none', nil },
-- TSEmphasis = { c.vscFront, nil, 'italic', nil },
-- TSStrong = { isDark and c.vscBlue or c.vscViolet, nil, 'bold', nil },
-- TSURI = { c.vscFront, nil, 'none', nil },
-- TSTextReference = { isDark and c.vscOrange or c.vscYellowOrange, nil, 'none', nil },
-- TSPunctDelimiter = { c.vscFront, nil, 'none', nil },
-- TSStringEscape = { isDark and c.vscOrange or c.vscYellowOrange, nil, 'bold', nil },

-- TSNote = { c.vscBlueGreen, nil, 'bold', nil },
-- TSWarning = { c.vscYellowOrange, nil, 'bold', nil },
-- TSDanger = { c.vscRed, nil, 'bold', nil },
vim.api.nvim_set_hl(0, 'TSError', { fg = c.vscRed })
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSConstant', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSString', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSNumber', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSFloat', { fg = c.vscLightGreen })
vim.api.nvim_set_hl(0, 'TSAnnotation', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSFunction', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSParameter', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSMethod', { fg = c.vscYellow })
vim.api.nvim_set_hl(0, 'TSField', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSProperty', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSConditional', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSLabel', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSOperator', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSException', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSType', { fg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSStructure', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSInclude', { fg = c.vscPink })
vim.api.nvim_set_hl(0, 'TSVariable', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = c.vscLightBlue })
vim.api.nvim_set_hl(0, 'TSText', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'TSUnderline', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'TSTag', { fg = c.vscBlue })
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = c.vscGray })

vim.api.nvim_set_hl(0, 'TSTitle', { fg = c.vscBlue, bold = true })
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSStrong', { fg = c.vscFront, bold = true })
vim.api.nvim_set_hl(0, 'TSURI', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = c.vscOrange })
vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = c.vscFront })
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = c.vscOrange, bold = true })

vim.api.nvim_set_hl(0, 'TSNote', { fg = c.vscBlueGreen, bold = true })
vim.api.nvim_set_hl(0, 'TSWarning', { fg = c.vscYellowOrange })
vim.api.nvim_set_hl(0, 'TSDanger', { fg = c.vscRed, bold = true })

------------ TELESCOPE ----------

-- syntax.TelescopePromptBorder = { c.vscLineNumber, nil, 'none', nil }
-- 	syntax.TelescopeResultsBorder = { c.vscLineNumber, nil, 'none', nil }
-- 	syntax.TelescopePreviewBorder = { c.vscLineNumber, nil, 'none', nil }
-- 	syntax.TelescopeNormal = { c.vscFront, nil, 'none', nil }
-- 	syntax.TelescopeSelection = { c.vscFront, c.vscPopupHighlightBlue, 'none', nil }
-- 	syntax.TelescopeMultiSelection = { c.vscFront, c.vscPopupHighlightBlue, 'none', nil }
-- 	syntax.TelescopeMatching = { c.vscMediumBlue, nil, 'bold', nil }
-- 	syntax.TelescopePromptPrefix = { c.vscFront, nil, 'none', nil }

vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = c.black0 })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { fg = c.white, bg = c.vscCursorDarkDark })

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = c.black0, bg = c.black0 })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { fg = c.vscCursorDarkDark, bg = c.vscCursorDarkDark })
vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', { fg = c.red, bg = c.vscCursorDarkDark })

vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { fg = c.black, bg = c.vscBlueGreen })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { fg = c.black, bg = c.vscLightRed })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { fg = c.black0, bg = c.vscBlue })

theme.link_highlight = function()
	-- Legacy groups for official git.vim and diff.vim syntax
	vim.api.nvim_command('highlight link diffAdded DiffAdd')
	vim.api.nvim_command('highlight link diffChanged DiffChange')
	vim.api.nvim_command('highlight link diffRemoved DiffDelete')
	-- Nvim compe
	vim.api.nvim_command('highlight link CompeDocumentation Pmenu')
	vim.api.nvim_command('highlight link CompeDocumentationBorder Pmenu')
	vim.api.nvim_command('highlight link CmpItemKind Pmenu')
	vim.api.nvim_command('highlight link CmpItemAbbr Pmenu')
	vim.api.nvim_command('highlight link CmpItemKindClass CmpItemKindConstructor')
	vim.api.nvim_command('highlight link CmpItemKindModule CmpItemKindKeyword')
	vim.api.nvim_command('highlight link CmpItemKindOperator TSOperator')
	vim.api.nvim_command('highlight link CmpItemKindReference TSParameterReference')
	vim.api.nvim_command('highlight link CmpItemKindValue TSField')
	vim.api.nvim_command('highlight link CmpItemKindField TSField')
	vim.api.nvim_command('highlight link CmpItemKindEnum TSField')
	vim.api.nvim_command('highlight link CmpItemKindSnippet TSText')
	vim.api.nvim_command('highlight link CmpItemKindColor cssColor')
	vim.api.nvim_command('highlight link CmpItemKindFile TSURI')
	vim.api.nvim_command('highlight link CmpItemKindFolder TSURI')
	vim.api.nvim_command('highlight link CmpItemKindEvent TSConstant')
	vim.api.nvim_command('highlight link CmpItemKindEnumMember TSField')
	vim.api.nvim_command('highlight link CmpItemKindConstant TSConstant')
	vim.api.nvim_command('highlight link CmpItemKindStruct TSStructure')
	vim.api.nvim_command('highlight link CmpItemKindTypeParameter TSParameter')
end

local utils = {}

utils.highlight = function(group, highlights)
	local fg = highlights[1] and ' guifg=' .. highlights[1] or ' guifg=NONE'
	local bg = highlights[2] and ' guibg=' .. highlights[2] or ' guibg=NONE'
	local attr = highlights[3] and ' gui=' .. highlights[3] or ' gui=NONE'
	local sp = highlights[4] and ' guisp=' .. highlights[4] or ''
	vim.api.nvim_command('highlight ' .. group .. fg .. bg .. attr .. sp)
end

-- local syntax = theme.load_syntax()

-- for group, color in pairs(syntax) do
-- 	utils.highlight(group, color)
-- end

-- theme.link_highlight()
