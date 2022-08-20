require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'comment', 'markdown_inline', 'query', 'regex',
		'bibtex', 'latex', 'lua', 'python', 'swift',
	},
	auto_install = true,
	highlight = { enable = true, additional_vim_regex_highlighting = { 'latex' } },
	-- custom_captures = {
	-- 	['text.math.marker'] = 'Identifier',
	-- },
	incremental_selection = { enable = true },
	-- textobjects = { enable = true },
	indent = { enable = true },
	-- pairs = { enable = true },
	rainbow = { enable = true, extended_mode = false },
	playground = { enable = true },
	query_linter = { enable = true },
}

-- Folding
-- vim.o.foldmethod = 'expr'
-- vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
