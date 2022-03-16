local home = os.getenv('HOME')

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
		prompt_prefix = ' ',
		selection_caret = ' ',
		path_display = { 'absolute' },
		set_env = { ['COLORTERM'] = 'truecolor' },
		file_ignore_patterns = { '%.jpeg$', '%.jpg$', '%.png$', '%.pdf$' },
	},
	pickers = {
		-- builtin
		buffers = {
			prompt_title = 'Active Buffers',
			theme = 'dropdown',
			sort_lastused = true,
			previewer = false,
		},
		current_buffer_fuzzy_find = {
			prompt_title = 'Fuzzy Finder',
			theme = 'ivy',
		},
		find_files = {
			results_title = 'Files List',
			theme = 'ivy',
		},
		grep_string = { theme = 'ivy' },
		live_grep = {
			prompt_title = 'Live Grep',
			theme = 'ivy',
		},
		oldfiles = {
			prompt_title = 'Recent Files',
			results_title = 'Files List',
			theme = 'ivy',
		},
		-- LSP
		lsp_code_actions = {
			prompt_title = 'Code Actions',
			theme = 'cursor',
		},
		lsp_definitions = {
			preview_title = 'Results Preview',
			theme = 'dropdown',
		},
		lsp_implementations = {
			preview_title = 'Results Preview',
			theme = 'dropdown',
		},
		lsp_references = {
			preview_title = 'Results Preview',
			theme = 'dropdown',
		},
	},
	extensions = {
		file_browser = {
			prompt_title = 'File Browser',
			theme = 'ivy',
		},
		frecency = {
			show_scores = true,
			workspaces = {
				['conf'] = home .. '/.config',
				['cv'] = home .. '/Documents/CV',
				['ex'] = home .. '/Documents/Exercises',
				['org'] = home .. '/Documents/neorg',
				['note'] = home .. '/Documents/Notes',
				['proj'] = home .. '/Documents/Projects',
				['site'] = home .. '/my_site',
				['talk'] = home .. '/Documents/Talks',
				['tex'] = home .. '/Tex',
			},
		},
		['ui-select'] = {
			require('telescope.themes').get_dropdown {},
		},
	},
}

local extensions = { 'fzf', 'file_browser', 'frecency', 'ui-select', 'aerial', 'notify' }
for _, ext in ipairs(extensions) do
	require('telescope').load_extension(ext)
end

local tb = require('telescope.builtin')
local te = require('telescope').extensions

vim.keymap.set('n', '<leader><leader>', function()
	tb.buffers()
end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fc', function()
	tb.commands()
end, { desc = 'Command Pallete' })
vim.keymap.set('n', '<leader>fd', function()
	tb.diagnostics()
end, { desc = 'Workspace Diagnostics' })
vim.keymap.set('n', '<leader>ff', function()
	tb.find_files { hidden = true }
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function()
	tb.grep_string()
end, { desc = 'Grep Strings' })
vim.keymap.set('n', '<leader>fl', function()
	tb.live_grep()
end, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fn', function()
	tb.find_files { cwd = '~/.config/nvim', prompt_title = 'Nvim Configs' }
end, { desc = 'Neovim Config Files' })
vim.keymap.set('n', '<leader>fo', function()
	tb.oldfiles()
end, { desc = 'Old Files' })
vim.keymap.set('n', '<leader>fp', function()
	tb.find_files { cwd = '~/Documents/Projects', prompt_title = 'Projects Files' }
end, { desc = 'Projects' })
vim.keymap.set('n', '<leader>fs', function()
	tb.current_buffer_fuzzy_find()
end, { desc = 'Current Buffer Fuzzy Find' })

vim.keymap.set('n', '<leader><space>', function()
	te.file_browser.file_browser {}
end, { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fr', function()
	te.frecency.frecency {}
end, { desc = 'Frecency' })

vim.api.nvim_add_user_command('Files', function()
	tb.find_files { hidden = true }
end, {})
vim.api.nvim_add_user_command('Grep', function()
	tb.live_grep()
end, {})
vim.api.nvim_add_user_command('Oldfiles', function()
	tb.oldfiles()
end, {})
