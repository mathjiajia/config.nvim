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
		revision = 'baf4bddd3c4e00e5a196a41a31f03d8cc7d08bba'
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
	indent = { enable = true },
	-- pairs = { enable = true },
	rainbow = { enable = true },
	-- playground = { enable = true },
	-- query_linter = { enable = true },
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				['ab'] = '@block.outer',
				['ib'] = '@block.inner',
				['ac'] = '@class.outer',
				['ic'] = '@class.inner',
				['af'] = '@function.outer',
				['if'] = '@function.inner',
				['as'] = '@statement.outer',
			}
		},
		swap = {
			enable = true,
			swap_next = {
				['<leader>a'] = '@parameter.inner',
			},
			swap_previous = {
				['<leader>A'] = '@parameter.inner',
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				[']m'] = '@function.outer',
				[']]'] = '@class.outer',
				[']}'] = '@block.outer',
			},
			goto_next_end = {
				[']M'] = '@function.outer',
				[']['] = '@class.outer',
				[']{'] = '@block.outer',
			},
			goto_previous_start = {
				['[m'] = '@function.outer',
				['[['] = '@class.outer',
				['[{'] = '@block.outer',
			},
			goto_previous_end = {
				['[M'] = '@function.outer',
				['[]'] = '@class.outer',
				['[}'] = '@block.outer',
			},
		},
		lsp_interop = {
			enable = true,
			border = 'none',
			peek_definition_code = {
				['<leader>df'] = '@function.outer',
				['<leader>dc'] = '@class.outer',
				['<leader>db'] = '@block.outer',
			}
		}
	},
})
