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
	},
	incremental_selection = { enable = true },
	indent = { enable = true },
	rainbow = {
		enable = true,
		-- colors = { '#F5C2E7', '#F28FAD', '#96CDFB', '#FAE3B0', '#ABE9B3', '#B5E8E0', '#F2CDCD' }, -- moon
		colors = { '#c14a4a', '#c35e0a', '#b47109', '#6c782e', '#4c7a5d', '#45707a', '#945e80' }, -- gruvbox
		colors = { '#fb617e', '#f89860', '#edc763', '#9ed06c', '#6dcae8', '#bb97ee', '#f89860' }, -- sonokai
	},
	playground = { enable = true },
}
