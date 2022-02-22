local home = os.getenv('HOME')
require('packer').loader('telescope-file-browser.nvim')

require('telescope').setup {
	defaults = {
		sorting_strategy = 'descending',
		selection_strategy = 'reset',
		scroll_strategy = 'cycle',
		layout_strategy = 'horizontal',
		layout_config = {
			horizontal = { prompt_position = 'bottom' },
			vertical = { mirror = false },
		},
		cycle_layout_list = { 'horizontal', 'vertical' },
		winblend = 0,
		prompt_prefix = ' ',
		selection_caret = ' ',
		entry_prefix = '  ',
		multi_icon = '+',
		initial_mode = 'insert',
		border = true,
		path_display = { 'absolute' },
		borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
		hl_result_eol = true,
		dynamic_preview_title = false,
		preview = {
			filesize_limit = 5,
			timeout = 150,
			treesitter = true,
			msg_bg_fillchar = '╱',
			hide_on_startup = false,
		},
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case',
		},
		use_less = true,
		set_env = { ['COLORTERM'] = 'truecolor' },
		color_devicons = true,
		mappings = {},
		file_sorter = require('telescope.sorters').get_fuzzy_file,
		generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
		prefilter_sorter = require('telescope.sorters').prefilter,
		file_ignore_patterns = { '.pdf' },
		file_previewer = require('telescope.previewers').vim_buffer_cat.new,
		grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
		qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
		buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
	},
	pickers = {
		-- builtin
		buffers = { prompt_title = '< Search Buffers >', sort_lastused = true, previewer = false },
		current_buffer_fuzzy_find = { prompt_title = '< Fuzzy Finder >' },
		find_files = { prompt_title = '< Search Files >' },
		grep_string = { prompt_title = '< Grep String >' },
		help_tags = { prompt_title = '< Helps >' },
		keymaps = { prompt_title = '< Keymaps >' },
		live_grep = { prompt_title = '< Live Grep >', theme = 'ivy' },
		oldfiles = { prompt_title = '< Recent Files >' },
		tags = { prompt_title = '< Universal ctags >' },
		-- LSP
		lsp_code_actions = { prompt_title = 'Code Actions', theme = 'cursor' },
		lsp_definitions = { prompt_title = 'Definitions', theme = 'dropdown' },
		lsp_document_symbols = { prompt_title = '< Document Symbols >' },
		lsp_implementations = { prompt_title = 'Implementations', theme = 'dropdown' },
		lsp_references = { prompt_title = 'References', theme = 'dropdown' },
	},
	extensions = {
		-- bibtex = {
		-- 	-- Depth for the *.bib file
		-- 	depth = 2,
		-- 	-- Custom format for citation label
		-- 	custom_formats = {},
		-- 	-- Format to use for citation label.
		-- 	-- Try to match the filetype by default, or use 'plain'
		-- 	format = '',
		-- 	-- Path to global bibliographies (placed outside of the project)
		-- 	global_files = { home .. ' /Tex/mathjiajia.bib' },
		-- 	-- Define the search keys to use in the picker
		-- 	search_keys = { 'author', 'year', 'title' },
		-- 	-- Template for the formatted citation
		-- 	citation_format = '{{author}} ({{year}}), {{title}}.',
		-- 	-- Only use initials for the authors first name
		-- 	citation_trim_firstname = true,
		-- 	-- Max number of authors to write in the formatted citation
		-- 	-- following authors will be replaced by "et al."
		-- 	citation_max_auth = 2,
		-- },
		file_browser = {
			theme = 'ivy',
			grouped = true,
		},
		frecency = {
			show_scores = true,
			show_unindexed = true,
			ignore_patterns = { '*.git/*', '*/tmp/*' },
			disable_devicons = false,
			workspaces = {
				['conf'] = home .. '/.config',
				['cv'] = home .. '/Documents/CV',
				['exercise'] = home .. '/Documents/Exercises',
				['norg'] = home .. '/Documents/neorg',
				['notes'] = home .. '/Documents/Notes',
				['project'] = home .. '/Documents/Projects',
				['site'] = home .. '/my_site',
				['talks'] = home .. '/Documents/Talks',
				['tex'] = home .. ' /Tex',
			},
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
		},
		project = {
			base_dirs = {
				home .. '/.config',
				home .. '/Test',
				home .. '/Tex',
				{ path = home .. '/Documents', max_depth = 2 },
				{ path = home .. '/my_site', max_depth = 2 },
			},
			hidden_files = true,
		},
	},
}

-- Load extensions
local extensions = { 'file_browser', 'frecency', 'fzf', 'project' } -- 'bibtex',
pcall(function()
	for _, ext in ipairs(extensions) do
		require('telescope').load_extension(ext)
	end
end)

vim.keymap.set('n', '<leader><space>', function()
	require('telescope.builtin').buffers()
end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fd', function()
	require('telescope.builtin').grep_string()
end, { desc = 'Grep Strings' })
vim.keymap.set('n', '<leader>ff', function()
	require('telescope.builtin').find_files { hidden = true }
end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function()
	require('telescope.builtin').live_grep()
end, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fh', function()
	require('telescope.builtin').help_tags()
end, { desc = 'Help Tags' })
vim.keymap.set('n', '<leader>fk', function()
	require('telescope.builtin').keymaps()
end, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fl', function()
	require('telescope.builtin').highlights()
end, { desc = 'Highlight Groups' })
vim.keymap.set('n', '<leader>fo', function()
	require('telescope.builtin').oldfiles()
end, { desc = 'Old Files' })
vim.keymap.set('n', '<leader>fs', function()
	require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = 'Current Buffer Fuzzy Find' })
vim.keymap.set('n', '<leader>ft', function()
	require('telescope.builtin').tags()
end, { desc = 'Tags' })
vim.keymap.set('n', '<leader>fx', function()
	require('telescope.builtin').diagnostics()
end, { desc = 'Workspace Diagnostics' })

vim.keymap.set('n', '<leader>fb', function()
	require('telescope').extensions.file_browser.file_browser {}
end, { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fc', function()
	require('telescope').extensions.bibtex.bibtex {}
end, { desc = 'bibtex' })
vim.keymap.set('n', '<leader>fp', function()
	require('telescope').extensions.project.project {}
end, { desc = 'Projects' })
vim.keymap.set('n', '<leader>fr', function()
	require('telescope').extensions.frecency.frecency {}
end, { desc = 'Frecency' })

local cp = require('colors')

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = cp.white, bg = cp.black3, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })
