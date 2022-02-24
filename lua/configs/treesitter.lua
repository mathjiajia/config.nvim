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
		additional_vim_regex_highlighting = { 'latex' },
		use_languagetree = true,
	},
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
	rainbow = {
		enable = true,
		colors = { '#96CDFB', '#ABE9B3', '#B5E8E0', '#F2CDCD', '#F5C2E7', '#F28FAD', '#FAE3B0' }, -- table of hex strings
	},
	playground = {
		enable = true,
	},
}

vim.keymap.set(
	'n',
	'<leader>th',
	'<Cmd>TSHighlightCapturesUnderCursor<CR>',
	{ desc = 'Highlight captures under cursor' }
)
