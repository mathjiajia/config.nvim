local builtin = { 'c', 'help', 'lua', 'vim' }
local langs = {
	'bash',
	'comment',
	'fish',
	'latex',
	'markdown',
	'markdown_inline',
	'python',
	'query',
	'regex',
	'swift',
}

require('nvim-treesitter.configs').setup({
	ensure_installed = langs,
	ignore_install = builtin,
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
