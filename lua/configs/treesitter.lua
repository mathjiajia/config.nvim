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
		-- colors = {}, -- table of hex strings
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
	{ silent = true, desc = 'Highlight captures under cursor' }
)
