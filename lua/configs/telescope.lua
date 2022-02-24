local cp = require('colors')

vim.api.nvim_set_hl(0, 'TelescopeBorder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = cp.white, bg = cp.black3, bold = true })
vim.api.nvim_set_hl(0, 'TelescopeMatching', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'TelescopeFrecencyScores', { fg = cp.maroon })

-- require('packer').loader('telescope-fzf-native.nvim')
require('packer').loader('telescope-zf-native.nvim')
require('packer').loader('telescope-file-browser.nvim')
require('packer').loader('telescope-frecency.nvim')
require('packer').loader('telescope-project.nvim')

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
		prompt_prefix = ' ',
		selection_caret = ' ',
		path_display = { 'absolute' },
		set_env = { ['COLORTERM'] = 'truecolor' },
		mappings = {},
		file_ignore_patterns = { '%.jpeg$', '%.jpg$', '%.png$', '%.pdf$', '%.ttf$' },
	},
	pickers = {
		-- builtin
		buffers = { prompt_title = '< Search Buffers >', theme = 'ivy', sort_lastused = true, previewer = false },
		current_buffer_fuzzy_find = { prompt_title = '< Fuzzy Finder >', theme = 'ivy' },
		find_files = { prompt_title = '< Search Files >', theme = 'ivy' },
		grep_string = { prompt_title = '< Grep String >' },
		keymaps = { prompt_title = '< Keymaps >' },
		live_grep = { prompt_title = '< Live Grep >', theme = 'ivy' },
		oldfiles = { prompt_title = '< Recent Files >', theme = 'ivy' },
		-- LSP
		lsp_code_actions = { prompt_title = '< Code Actions >', theme = 'cursor' },
		lsp_definitions = { prompt_title = '< Definitions >', theme = 'dropdown' },
		lsp_document_symbols = { prompt_title = '< Document Symbols >' },
		lsp_implementations = { prompt_title = '< Implementations >', theme = 'dropdown' },
		lsp_references = { prompt_title = '< References >', theme = 'dropdown' },
	},
	extensions = {
		file_browser = {
			prompt_title = '< File Browser >',
			theme = 'ivy',
		},
		frecency = {
			show_scores = true,
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
local extensions = { 'file_browser', 'frecency', 'zf-native', 'project' }
for _, ext in ipairs(extensions) do
	require('telescope').load_extension(ext)
end

local tb = require('telescope.builtin')
local te = require('telescope').extensions

-- stylua: ignore start
vim.keymap.set('n', '<leader><space>', function() tb.buffers() end, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fc', function() tb.commands() end, { desc = 'Command Pallete' })
vim.keymap.set('n', '<leader>fd', function() tb.grep_string() end, { desc = 'Grep Strings' })
vim.keymap.set('n', '<leader>ff', function() tb.find_files { hidden = true } end, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', function() tb.live_grep() end, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>fk', function() tb.keymaps() end, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fo', function() tb.oldfiles() end, { desc = 'Old Files' })
vim.keymap.set('n', '<leader>fs', function() tb.current_buffer_fuzzy_find() end, { desc = 'Current Buffer Fuzzy Find' })
vim.keymap.set('n', '<leader>fx', function() tb.diagnostics() end, { desc = 'Workspace Diagnostics' })

vim.keymap.set('n', '<leader>fb', function() te.file_browser.file_browser {} end, { desc = 'File Browser' })
vim.keymap.set('n', '<leader>fp', function() te.project.project {} end, { desc = 'Projects' })
vim.keymap.set('n', '<leader>fr', function() te.frecency.frecency {} end, { desc = 'Frecency' })
-- stylua: ignore end
