local home = os.getenv('HOME')

local actions = require('telescope.actions')
local actions_layout = require('telescope.actions.layout')
local themes = require('telescope.themes')

require('telescope').setup({
	defaults = {
		sorting_strategy = 'ascending',
		layout_config = {
			horizontal = { prompt_position = 'top' }
		},
		prompt_prefix = '   ',
		selection_caret = ' ',
		mappings = {
			i = {
				['<M-a>'] = actions.toggle_all,
				['<M-o>'] = actions_layout.toggle_preview,
			},
			n = {
				['<M-a>'] = actions.toggle_all,
				['<M-o>'] = actions_layout.toggle_preview,
			},
		},
		set_env = { ['COLORTERM'] = 'truecolor' },
		file_ignore_patterns = { '%.jpeg$', '%.jpg$', '%.png$', '%.pdf$', '.DS_Store' },
	},
	pickers = {
		buffers = {
			theme = 'dropdown',
			sort_lastused = true,
			previewer = false
		},
		current_buffer_fuzzy_find = {
			previewer = false
		},
		find_files = {
			theme = 'ivy',
			follow = true,
		},
		grep_string = {
			path_display = { 'shorten' },
		},
		live_grep = {
			path_display = { 'shorten' },
		},
	},
	extensions = {
		frecency = {
			theme = themes.get_dropdown,
			show_scores = true,
			workspaces = {
				['conf'] = home .. '/.config',
				['dev']  = home .. '/Developer',
				['doc']  = home .. '/Documents',
				['tex']  = home .. '/Tex',
			},
		},
		bibtex = {
			format = 'plain',
			wrap = true,
		},
		file_browser = {
			theme = 'ivy',
			hijack_netrw = true,
		},
		['ui-select'] = themes.get_dropdown(),
	},
})

local extensions = {
	'fzf', 'file_browser', 'frecency',
	'bibtex', 'ui-select',
	'aerial', 'notify', 'noice'
}
for _, ext in ipairs(extensions) do
	require('telescope').load_extension(ext)
end

vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').buffers, { desc = 'Buffers' })
vim.keymap.set(
	'n',
	'<leader><space>',
	require('telescope').extensions.file_browser.file_browser,
	{ desc = 'File Browser' }
)
vim.keymap.set('n', '<F12>', require('telescope.builtin').commands, { desc = 'Command Pallete' })

vim.keymap.set('n', '<leader>fd', require('telescope.builtin').find_files, { desc = 'Find Files' })
vim.keymap.set(
	'n',
	'<leader>ff',
	require('telescope.builtin').current_buffer_fuzzy_find,
	{ desc = 'Current Buffer Fuzzy Find' }
)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fm', require('telescope.builtin').builtin, { desc = 'Telescope Meta' })

vim.keymap.set(
	'n',
	'<leader>fr',
	function()
		require('telescope').extensions.frecency.frecency(themes.get_ivy {})
	end,
	{ desc = 'Recent Files' }
)

vim.keymap.set(
	'n',
	'<leader>fz',
	function()
		require('telescope.builtin').find_files({ find_command = { 'rg', '--files', '--type', vim.fn.input({ 'Type: ' }) } })
	end,
	{ desc = 'Search Certain Type Files' }
)
vim.keymap.set(
	'n',
	'<leader>f/',
	function()
		require('telescope.builtin').grep_string { search = vim.fn.input({ 'Grep String > ' }) }
	end,
	{ desc = 'Grep Strings' }
)

vim.keymap.set(
	'n',
	'<leader>en',
	function()
		require('telescope.builtin').find_files({
			cwd = '~/.config/nvim',
			prompt_title = 'Nvim Configs'
		})
	end,
	{ desc = 'Neovim Config Files' }
)
