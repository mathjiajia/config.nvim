local home = os.getenv 'HOME'
local themes = require 'telescope.themes'

require('telescope').setup {
	defaults = {
		sorting_strategy = 'ascending',
		layout_config = {
			horizontal = {
				height = 0.9,
				preview_cutoff = 120,
				prompt_position = 'top',
				width = 0.8,
			},
		},
		prompt_prefix = '   ',
		selection_caret = ' ',
		path_display = { 'absolute' },
		set_env = { ['COLORTERM'] = 'truecolor' },
		file_ignore_patterns = { '%.jpeg$', '%.jpg$', '%.png$', '%.pdf$' },
	},
	extensions = {
		frecency = {
			show_scores = true,
			workspaces = {
				['conf'] = home .. '/.config',
				['cv']   = home .. '/Documents/CV',
				['ex']   = home .. '/Documents/Exercises',
				['org']  = home .. '/Documents/neorg',
				['note'] = home .. '/Documents/Notes',
				['proj'] = home .. '/Documents/Projects',
				['site'] = home .. '/my_site',
				['talk'] = home .. '/Documents/Talks',
				['tex']  = home .. '/Tex',
			},
		},
		bibtex = {
			format = 'plain',
			global_files = { home .. '/Tex' },
			wrap = true,
		},
		['ui-select'] = {
			themes.get_dropdown {},
		},
	},
}

local extensions = { 'fzf', 'file_browser', 'frecency', 'bibtex', 'ui-select', 'aerial', 'notify' }
for _, ext in ipairs(extensions) do
	require('telescope').load_extension(ext)
end

local tb = require 'telescope.builtin'
local te = require('telescope').extensions

vim.keymap.set('n', '<leader><leader>', function()
	tb.buffers(themes.get_dropdown { sort_lastused = true, previewer = false })
end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader><space>', function()
	te.file_browser.file_browser(themes.get_ivy {})
end, { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fm', function()
	tb.builtin()
end, { desc = 'Telescope Meta' })
vim.keymap.set('n', '<leader>fd', function()
	tb.find_files(themes.get_ivy { hidden = false })
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>ff', function()
	tb.current_buffer_fuzzy_find { winblend = 10, previewer = false }
end, { desc = 'Current Buffer Fuzzy Find' })
vim.keymap.set('n', '<leader>fg', function()
	tb.live_grep { previewer = false }
end, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fh', function()
	tb.help_tags { show_version = true }
end, { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fr', function()
	te.frecency.frecency(themes.get_ivy {})
end, { desc = 'Recent Files' })

vim.keymap.set('n', '<leader>fz', function()
	tb.find_files(themes.get_ivy {
		find_command = { 'rg', '--files', '--type', vim.fn.input 'Type: ' },
	})
end, { desc = 'Search Certain Type Files' })
vim.keymap.set('n', '<leader>f/', function()
	tb.grep_string {
		path_display = { 'shorten' },
		search = vim.fn.input 'Grep String > ',
	}
end, { desc = 'Grep Strings' })
vim.keymap.set('n', '<F12>', function()
	tb.commands()
end, { desc = 'Command Pallete' })
vim.keymap.set('n', '<leader>en', function()
	tb.find_files(themes.get_ivy { cwd = '~/.config/nvim', prompt_title = 'Nvim Configs' })
end, { desc = 'Neovim Config Files' })
