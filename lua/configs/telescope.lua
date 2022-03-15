local home = os.getenv('HOME')

-- require('packer').loader('telescope-fzf-native.nvim')
-- require('packer').loader('telescope-file-browser.nvim')
-- require('packer').loader('telescope-frecency.nvim')
-- require('packer').loader('telescope-project.nvim')

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
		-- border = false,
		path_display = { 'absolute' },
		set_env = { ['COLORTERM'] = 'truecolor' },
		file_ignore_patterns = { '%.jpeg$', '%.jpg$', '%.png$', '%.pdf$' },
	},
	pickers = {
		-- builtin
		buffers = { prompt_title = 'Active Buffers', theme = 'dropdown', sort_lastused = true, previewer = false },
		current_buffer_fuzzy_find = { prompt_title = 'Fuzzy Finder', theme = 'ivy' },
		find_files = { results_title = 'Files List', theme = 'ivy' },
		grep_string = { theme = 'ivy' },
		live_grep = { prompt_title = 'Live Grep', theme = 'ivy' },
		oldfiles = { prompt_title = 'Recent Files', results_title = 'Files List', theme = 'ivy' },
		-- LSP
		lsp_code_actions = { prompt_title = 'Code Actions', theme = 'cursor' },
		lsp_definitions = { preview_title = 'Results Preview', theme = 'dropdown' },
		lsp_implementations = { preview_title = 'Results Preview', theme = 'dropdown' },
		lsp_references = { preview_title = 'Results Preview', theme = 'dropdown' },
	},
	extensions = {
		file_browser = { prompt_title = 'File Browser', theme = 'ivy' },
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
	},
}

-- Load extensions
local extensions = { 'fzf', 'file_browser', 'frecency', 'notify' }
for _, ext in ipairs(extensions) do
	require('telescope').load_extension(ext)
end
