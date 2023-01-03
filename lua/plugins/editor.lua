local util = require('configs.util')

return {

	-- comments
	{
		'numToStr/Comment.nvim',
		config = true,
		keys = {
			'gcc',
			{ 'gbc', mode = { 'n', 'x' } },
			{ 'gc', mode = { 'n', 'x' } },
		},
	},

	-- easily jump to any location and enhanced f/t motions for Leap
	{
		'ggandor/leap.nvim',
		event = 'VeryLazy',
		dependencies = {
			'ggandor/flit.nvim',
			config = { labeled_modes = 'nv' },
		},
		config = function()
			require('leap').add_default_mappings()
		end,
	},

	-- search/replace in multiple files
	{
		'windwp/nvim-spectre',
		keys = {
			{ '<leader>sr', function()
				require('spectre').open()
			end, desc = 'Replace in files (Spectre)' },
		},
	},

	-- surround
	{
		'kylechui/nvim-surround',
		config = true,
		keys = { 'cs', 'ds', 'ys', 'yS' },
	},

	-- terminal
	{
		'numtostr/FTerm.nvim',
		keys = {
			{ '<M-i>', function()
				require('FTerm').toggle()
			end, mode = { 'n', 't' }, desc = 'Toggle Terminal' },

			{ '<leader><Enter>', function()
				require('configs.util').code_run()
			end, desc = 'Code Runner' },
		},
		config = function()
			vim.keymap.set('t', '<Esc>', function()
				require('FTerm').exit()
			end, { desc = 'Exit Terminal' })
		end,
	},

	-- fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'natecraddock/telescope-zf-native.nvim',
			{
				'nvim-telescope/telescope-frecency.nvim',
				dependencies = { 'kkharji/sqlite.lua' }
			},
			'nvim-telescope/telescope-file-browser.nvim',
			'nvim-telescope/telescope-bibtex.nvim',
		},
		config = function()
			local telescope = require('telescope')
			local actions = require('telescope.actions')
			local actions_layout = require('telescope.actions.layout')

			local home = vim.fn.expand('~')

			telescope.setup({
				defaults = {
					sorting_strategy = 'ascending',
					layout_config = { horizontal = { prompt_position = 'top' } },
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
				},
			})

			local extns = {
				'zf-native',
				'file_browser',
				'frecency',
				'bibtex',
				'aerial',
				'noice',
			}
			for _, extn in ipairs(extns) do
				telescope.load_extension(extn)
			end
		end,
		cmd = 'Telescope',
		keys = {
			{ '<leader><leader>', function()
				require('telescope.builtin').buffers()
			end, desc = 'Buffers' },

			{ '<leader><space>', function()
				require('telescope').extensions.file_browser.file_browser({ path = '%:p:h' })
			end, desc = 'File Browser' },

			{ '<leader>fd', function()
				util.telescope('find_files')
			end, desc = 'Find Files' },

			{ '<leader>ff', function()
				require('telescope.builtin').current_buffer_fuzzy_find()
			end, desc = 'Current Buffer Fuzzy Find' },

			{ '<leader>fg', function()
				util.telescope('live_grep')
			end, desc = 'Live Grep' },

			{ '<leader>fh', function()
				require('telescope.builtin').help_tags()
			end, desc = 'Help Tags' },

			{ '<leader>fm', function()
				require('telescope.builtin').builtin()
			end, desc = 'Telescope Meta' },

			{ '<leader>fr', function()
				require('telescope').extensions.frecency.frecency()
			end, desc = 'Recent Files' },

			{ '<leader>fz', function()
				util.telescope('find_files', {
					find_command = { 'rg', '--files', '--type', vim.fn.input({ prompt = 'Type: ' }) },
				})
			end, desc = 'Search Certain Type Files' },

			{ '<leader>f/', function()
				util.telescope('grep_string', { search = vim.fn.input({ prompt = 'Grep String > ' }) })
			end, desc = 'Grep Strings' },

			{ '<leader>fn', function()
				require('telescope.builtin').find_files({
					cwd = '~/.config/nvim',
					prompt_title = 'Nvim Configs'
				})
			end, desc = 'Neovim Config Files' },
		},
	},
}
