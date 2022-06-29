local ts_install = {
	'bibtex', 'comment', 'fish', 'help', 'html',
	'json', 'latex', 'lua', 'markdown', 'markdown_inline',
	'norg', 'python', 'query', 'ruby',
	'swift', 'toml', 'vim', 'yaml',
}

require('nvim-treesitter.configs').setup {
	ensure_installed = ts_install,
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
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
