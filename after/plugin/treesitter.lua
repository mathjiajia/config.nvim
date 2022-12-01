local langs = {
	'bash',
	'comment',
	'diff',
	'fish',
	'latex',
	'markdown',
	'markdown_inline',
	'python',
	'query',
	'regex',
	'swift',
}

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()

parser_config.latex = {
	install_info = {
		url = 'https://github.com/ryleelyman/tree-sitter-latex',
		files = { 'src/parser.c', 'src/scanner.c' },
		generate_requires_npm = false,
		requires_generate_from_grammar = false,
		revision = '4e1c009f58f4e285ec4b8dfbaece3453bacc756a',
	},
	filetype = 'tex'
}

require('nvim-treesitter.configs').setup({
	ensure_installed = langs,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { 'latex' }
	},
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	indent = { enable = true },
	-- pairs = { enable = true },
	rainbow = { enable = true },
	-- playground = { enable = true },
	-- query_linter = { enable = true },
})
