require('nvim-treesitter.configs').setup({
	ensure_installed = {
		'bash', 'bibtex', 'comment', 'fish', 'gitignore',
		'html', 'latex', 'markdown', 'markdown_inline',
		'python', 'query', 'regex', 'swift',
	},
	-- auto_install = true,
	ignore_install = { 'c', 'help', 'lua', 'vim' },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { 'latex' }
	},
	incremental_selection = { enable = true },
	-- textobjects = { enable = true },
	indent = { enable = true },
	-- pairs = { enable = true },
	rainbow = { enable = true, extended_mode = false },
	playground = { enable = true },
	query_linter = { enable = true },
})

-- Folding
-- vim.opt_local.foldmethod = 'expr'
-- vim.opt_local.foldexpr = 'nvim_treesitter#foldexpr()'
-- vim.opt_local.foldenable = false
