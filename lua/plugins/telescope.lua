local M = {
	'nvim-telescope/telescope.nvim',
	-- "~/Desktop/NeovimPlugins/telescope.nvim", requires = "nvim-lua/plenary.nvim",
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'natecraddock/telescope-zf-native.nvim',
		{
			'nvim-telescope/telescope-frecency.nvim',
			dependencies = { 'kkharji/sqlite.lua' }
		},
		'nvim-telescope/telescope-file-browser.nvim',
		'nvim-telescope/telescope-bibtex.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
	},
	cmd = 'Telescope',
}

M.init = function()
	local fn = vim.fn

	vim.keymap.set('n', '<leader><leader>', function()
		require('telescope.builtin').buffers()
	end, { desc = 'Buffers' })

	vim.keymap.set('n', '<leader><space>', function()
		require('telescope').extensions.file_browser.file_browser()
	end, { desc = 'File Browser' })

	vim.keymap.set('n', '<F12>', function()
		require('telescope.builtin').commands()
	end, { desc = 'Command Pallete' })

	vim.keymap.set('n', '<leader>fd', function()
		require('telescope.builtin').find_files()
	end, { desc = 'Find Files' })

	vim.keymap.set('n', '<leader>ff', function()
		require('telescope.builtin').current_buffer_fuzzy_find()
	end, { desc = 'Current Buffer Fuzzy Find' })

	vim.keymap.set('n', '<leader>fg', function()
		require('telescope.builtin').live_grep()
	end, { desc = 'Live Grep' })

	vim.keymap.set('n', '<leader>fh', function()
		require('telescope.builtin').help_tags()
	end, { desc = 'Help Tags' })

	vim.keymap.set('n', '<leader>fm', function()
		require('telescope.builtin').builtin()
	end, { desc = 'Telescope Meta' })

	vim.keymap.set('n', '<leader>fr', function()
		require('telescope').extensions.frecency.frecency(require('telescope.themes').get_ivy())
	end, { desc = 'Recent Files' })

	vim.keymap.set('n', '<leader>fz', function()
		require('telescope.builtin').find_files({
			find_command = { 'rg', '--files', '--type', fn.input({ prompt = 'Type: ' }) }
		})
	end, { desc = 'Search Certain Type Files' })

	vim.keymap.set('n', '<leader>f/', function()
		require('telescope.builtin').grep_string({
			search = fn.input({ prompt = 'Grep String > ' })
		})
	end, { desc = 'Grep Strings' })

	vim.keymap.set('n', '<leader>fn', function()
		require('telescope.builtin').find_files({
			cwd = '~/.config/nvim',
			prompt_title = 'Nvim Configs'
		})
	end, { desc = 'Neovim Config Files' })
end

M.config = function()
	local telescope = require('telescope')
	local actions = require('telescope.actions')
	local actions_layout = require('telescope.actions.layout')
	local themes = require('telescope.themes')

	local home = vim.fn.expand('~')

	telescope.setup({
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
			file_ignore_patterns = { '%.jpeg$', '%.jpg$', '%.png$', '.DS_Store' },
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
					['tex']  = home .. '/TeX',
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

	local extns = {
		'zf-native',
		'file_browser',
		'frecency',
		'bibtex',
		'ui-select',
		'aerial',
		'noice',
	}
	for _, extn in ipairs(extns) do
		telescope.load_extension(extn)
	end
end

return M
