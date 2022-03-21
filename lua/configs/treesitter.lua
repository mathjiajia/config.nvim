local ts_install = {
	'bibtex',
	'comment',
	'fish',
	'html',
	'latex',
	'lua',
	'markdown',
	'norg',
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
	rainbow = { enable = true, extended_mode = false },
	playground = { enable = true },
}

-- stylua: ignore start
vim.keymap.set(
	'n', '<leader>th',
	function()
		require('nvim-treesitter-playground.hl-info').show_hl_captures()
	end,
	{ desc = 'Highlight captures under cursor' }
)
vim.keymap.set(
	'n', '<leader>tp',
	function()
		require('nvim-treesitter-playground.internal').toggle()
	end,
	{ desc = 'Tree-Sitter Playground' }
)
-- stylua: ignore end
