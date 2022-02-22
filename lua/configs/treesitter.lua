local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg_meta = {
	install_info = {
		url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
		files = { 'src/parser.c' },
		branch = 'main',
	},
}

parser_configs.norg_table = {
	install_info = {
		url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
		files = { 'src/parser.c' },
		branch = 'main',
	},
}

local ts_install = {
	'bibtex',
	'c',
	'comment',
	'fish',
	'html',
	'latex',
	'lua',
	'markdown',
	'norg',
	'norg_meta',
	'norg_table',
	'python',
	'query',
	'ruby',
	'toml',
	'vim',
	'yaml',
}

require('nvim-treesitter.configs').setup {
	ensure_installed = ts_install,
	highlight = {
		enable = true,
		-- disable = {},
		additional_vim_regex_highlighting = { 'latex' },
		use_languagetree = true,
	},
	-- textobjects = {
	-- 	select = {
	-- 		enable = true,
	--
	-- 		-- Automatically jump forward to textobj, similar to targets.vim
	-- 		lookahead = true,
	--
	-- 		keymaps = {
	-- 			-- You can use the capture groups defined in textobjects.scm
	-- 			['af'] = '@function.outer',
	-- 			['if'] = '@function.inner',
	-- 			['ac'] = '@class.outer',
	-- 			['ic'] = '@class.inner',
	-- 		},
	-- 	},
	-- 	swap = {
	-- 		enable = true,
	-- 		swap_next = {
	-- 			['<leader>a'] = '@parameter.inner',
	-- 		},
	-- 		swap_previous = {
	-- 			['<leader>A'] = '@parameter.inner',
	-- 		},
	-- 	},
	-- 	move = {
	-- 		enable = true,
	-- 		set_jumps = true, -- whether to set jumps in the jumplist
	-- 		goto_next_start = {
	-- 			[']m'] = '@function.outer',
	-- 			[']]'] = '@class.outer',
	-- 		},
	-- 		goto_next_end = {
	-- 			[']M'] = '@function.outer',
	-- 			[']['] = '@class.outer',
	-- 		},
	-- 		goto_previous_start = {
	-- 			['[m'] = '@function.outer',
	-- 			['[['] = '@class.outer',
	-- 		},
	-- 		goto_previous_end = {
	-- 			['[M'] = '@function.outer',
	-- 			['[]'] = '@class.outer',
	-- 		},
	-- 	},
	-- },
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = 'gnn',
			node_incremental = 'grn',
			scope_incremental = 'grc',
			node_decremental = 'grm',
		},
	},
	indent = {
		enable = true,
	},
	-- context_commentstring = { enable = true },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		colors = { '#F28FAD', '#B5E8E0', '#FAE3B0', '#96CDFB', '#F5C2E7', '#F2CDCD', '#ABE9B3' }, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	},
}

vim.keymap.set(
	'n',
	'<leader>ch',
	'<Cmd>TSHighlightCapturesUnderCursor<CR>',
	{ desc = 'Highlight captures under cursor' }
)

local cp = require('colors')

-- These groups are for the neovim tree-sitter highlights.
-- As of writing, tree-sitter support is a WIP, group names may change.
-- By default, most of these groups link to an appropriate Vim group,
-- TSError -> Error for example, so you do not have to define these unless
-- you explicitly want to support Treesitter's improved syntax awareness.

vim.api.nvim_set_hl(0, 'TSPunctDelimiter', { fg = cp.teal }) -- Punctuation delimiters: Periods, commas, semicolons, etc.
vim.api.nvim_set_hl(0, 'TSPunctBracket', { fg = cp.gray1 }) -- Brackets, braces, parentheses, etc.
vim.api.nvim_set_hl(0, 'TSPunctSpecial', { fg = cp.maroon, bold = true })
-- Special punctuation that doesn't fit into the previous categories.

vim.api.nvim_set_hl(0, 'TSConstant', { fg = cp.peach })
-- Constants identifiers. These might not be semantically constant. E.g. uppercase variables in Python.
vim.api.nvim_set_hl(0, 'TSConstBuiltin', { fg = cp.lavender, italic = true }) -- Built-in constant values: `nil` in Lua.
vim.api.nvim_set_hl(0, 'TSConstMacro', { fg = cp.yellow }) -- Constants defined by macros: `NULL` in C.

vim.api.nvim_set_hl(0, 'TSString', { fg = cp.green }) -- String literals.
vim.api.nvim_set_hl(0, 'TSStringEscape', { fg = cp.pink }) -- Escape characters within a string: `\n`, `\t`, etc.
vim.api.nvim_set_hl(0, 'TSStringRegex', { fg = cp.peach }) -- Regular expression literals.
vim.api.nvim_set_hl(0, 'TSStringSpecial', { fg = cp.green }) -- Strings with special meaning that don't fit into the previous categories.
vim.api.nvim_set_hl(0, 'TSCharacter', { fg = cp.yellow }) -- Character literals: `'a'` in C.
vim.api.nvim_set_hl(0, 'TSNumber', { fg = cp.peach, bold = true, italic = true }) -- Numeric literals that don't fit into other categories.
vim.api.nvim_set_hl(0, 'TSBoolean', { fg = cp.peach, bold = true, italic = true }) -- Boolean literals: `True` and `False` in Python.
vim.api.nvim_set_hl(0, 'TSFloat', { fg = cp.peach, bold = true, italic = true }) -- Floating-point number literals.

vim.api.nvim_set_hl(0, 'TSFunction', { fg = cp.green, italic = true }) -- Function calls and definitions.
vim.api.nvim_set_hl(0, 'TSFuncBuiltin', { fg = cp.peach, italic = true }) -- Built-in functions: `print` in Lua.
vim.api.nvim_set_hl(0, 'TSFuncMacro', { fg = cp.red }) -- Macro defined functions (calls and definitions): each `macro_rules` in Rust.
vim.api.nvim_set_hl(0, 'TSParameter', { fg = cp.rosewater }) -- Parameters of a function.
vim.api.nvim_set_hl(0, 'TSParameterReference', { fg = cp.white }) -- References to parameters of a function.
vim.api.nvim_set_hl(0, 'TSMethod', { fg = cp.blue, italic = true }) -- Method calls and definitions.
vim.api.nvim_set_hl(0, 'TSField', { fg = cp.rosewater }) -- Object and struct fields.
vim.api.nvim_set_hl(0, 'TSProperty', { fg = cp.yellow, italic = true }) -- Same as `TSField`.
vim.api.nvim_set_hl(0, 'TSConstructor', { fg = cp.lavender }) -- Constructor calls and definitions: `{}` in Lua, and Java constructors.
-- vim.api.nvim_set_hl(0,'TSAnnotation',{})
vim.api.nvim_set_hl(0, 'TSAttribute', { fg = cp.blue })
-- Annotations that can be attached to the code to denote some kind of meta information. e.g. C++/Dart attributes.
vim.api.nvim_set_hl(0, 'TSNamespace', { fg = cp.rosewater, bold = true }) -- Identifiers referring to modules and namespaces.
vim.api.nvim_set_hl(0, 'TSSymbol', { fg = cp.white }) -- Identifiers referring to symbols or atoms.

vim.api.nvim_set_hl(0, 'TSConditional', { fg = cp.mauve, bold = true }) -- Keywords related to conditionals: `if`, `when`, `cond`, etc.
vim.api.nvim_set_hl(0, 'TSRepeat', { fg = cp.mauve, bold = true }) -- Keywords related to loops: `for`, `while`, etc.
vim.api.nvim_set_hl(0, 'TSLabel', { fg = cp.blue }) -- GOTO labels: `label:` in C, and `::label::` in Lua.
vim.api.nvim_set_hl(0, 'TSOperator', { fg = cp.sky, bold = true }) -- Binary or unary operators: `+`, and also `->` and `*` in C.
vim.api.nvim_set_hl(0, 'TSKeyword', { fg = cp.red, italic = true }) -- Keywords that don't fit into other categories.
vim.api.nvim_set_hl(0, 'TSKeywordFunction', { fg = cp.maroon, italic = true })
-- Keywords used to define a function: `function` in Lua, `def` and `lambda` in Python.
vim.api.nvim_set_hl(0, 'TSKeywordOperator', { fg = cp.sky, bold = true })
-- Unary and binary operators that are English words: `and`, `or` in Python; `sizeof` in C.
vim.api.nvim_set_hl(0, 'TSKeywordReturn', { fg = cp.pink }) -- Keywords like `return` and `yield`.
vim.api.nvim_set_hl(0, 'TSException', { fg = cp.peach, italic = true }) -- Exception related keywords: `try`, `except`, `finally` in Python.

vim.api.nvim_set_hl(0, 'TSType', { fg = cp.blue }) -- Type (and class) definitions and annotations.
vim.api.nvim_set_hl(0, 'TSTypeBuiltin', { fg = cp.yellow, italic = true }) -- Built-in types: `i32` in Rust.
vim.api.nvim_set_hl(0, 'TSInclude', { fg = cp.teal, italic = true })
-- File or module inclusion keywords: `#include` in C, `use` or `extern crate` in Rust.

vim.api.nvim_set_hl(0, 'TSVariableBuiltin', { fg = cp.teal, italic = true })
-- Variable names defined by the language: `this` or `self` in Javascript.

vim.api.nvim_set_hl(0, 'TSText', { fg = cp.white }) -- Non-structured text. Like text in a markup language.
vim.api.nvim_set_hl(0, 'TSStrong', { fg = cp.maroon, bold = true }) -- Text to be represented in bold.
vim.api.nvim_set_hl(0, 'TSEmphasis', { fg = cp.maroon, italic = true }) -- Text to be represented with emphasis.
vim.api.nvim_set_hl(0, 'TSUnderline', { underline = true }) -- Text to be represented with an underline.
vim.api.nvim_set_hl(0, 'TSStrike', { fg = cp.gray, strikethrough = true }) -- Strikethrough text.

vim.api.nvim_set_hl(0, 'TSMath', { fg = cp.yellow }) -- Math environments like LaTeX's `$ ... $`
vim.api.nvim_set_hl(0, 'TSTextReference', { fg = cp.lavender, bold = true }) -- Footnotes, text references, citations, etc.
vim.api.nvim_set_hl(0, 'TSEnvironment', { fg = cp.green }) -- Text environments of markup languages.
vim.api.nvim_set_hl(0, 'TSEnvironmentName', { fg = cp.blue, italic = true })
-- Text/string indicating the type of text environment. Like the name of a	`\begin` block in LaTeX.
vim.api.nvim_set_hl(0, 'TSTitle', { fg = cp.blue, bold = true }) -- Text that is part of a title.
vim.api.nvim_set_hl(0, 'TSLiteral', { fg = cp.teal, italic = true }) -- Literal or verbatim text.
vim.api.nvim_set_hl(0, 'TSURI', { fg = cp.rosewater, italic = true, underline = true }) -- URIs like hyperlinks or email addresses.

-- vim.api.nvim_set_hl(0,'TSComment',{ link = 'Comment' }) -- Line comments and block comments.
vim.api.nvim_set_hl(0, 'TSNote', { fg = cp.black2, bg = cp.blue }) -- Text representation of an informational note.
vim.api.nvim_set_hl(0, 'TSWarning', { fg = cp.black2, bg = cp.yellow }) -- Text representation of a warning note.
vim.api.nvim_set_hl(0, 'TSDanger', { fg = cp.black2, bg = cp.red }) -- Text representation of a danger note.

vim.api.nvim_set_hl(0, 'TSTag', { fg = cp.peach }) -- Tags like HTML tag names.
vim.api.nvim_set_hl(0, 'TSTagDelimiter', { fg = cp.maroon }) -- Tag delimiters like `<` `>` `/`.
vim.api.nvim_set_hl(0, 'TSTagAttribute', { fg = cp.mauve, italic = true }) -- HTML tag attributes.

vim.api.nvim_set_hl(0, 'TSError', { fg = cp.diag.error })
-- Syntax/parser errors.
-- This might highlight large sections of code while the user is typing still incomplete code, use a sensible highlight.
-- vim.api.nvim_set_hl(0,'TSNone',{})
-- No highlighting (sets all highlight arguments to `NONE`). this group is used to clear certain ranges,
-- for example, string interpolations. Don't change the values of this highlight group.
vim.api.nvim_set_hl(0, 'TSVariable', { fg = cp.white, italic = true }) -- Variable names that don't fit into other categories.
