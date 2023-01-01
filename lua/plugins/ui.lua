local M = {
	-- better vim.notify
	{
		'rcarriga/nvim-notify',
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.notify = function(...)
				vim.notify = require('notify')
				return vim.notify(...)
			end
		end,
	},

	-- better vim.ui
	{
		'stevearc/dressing.nvim',
		init = function()
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.select = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.select(...)
			end
			---@diagnostic disable-next-line: duplicate-set-field
			vim.ui.input = function(...)
				require('lazy').load({ plugins = { 'dressing.nvim' } })
				return vim.ui.input(...)
			end
		end
	},

	-- noicer ui
	{
		'folke/noice.nvim',
		config = {
			lsp = {
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
		event = 'VeryLazy',
	},

	-- indent guides for Neovim
	{
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufReadPre',
		config = {
			char = '▏',
			context_char = '▏',
			char_highlight_list = {
				'IndentBlanklineIndent1',
				'IndentBlanklineIndent2',
				'IndentBlanklineIndent3',
				'IndentBlanklineIndent4',
				'IndentBlanklineIndent5',
				'IndentBlanklineIndent6',
			},
			use_treesitter = true,
			show_trailing_blankline_indent = false,
			filetype_exclude = { 'alpha', 'checkhealth', 'help', 'lspinfo', 'norg', 'neo-tree', 'Trouble' },
			show_current_context = true,
			show_current_context_start = true,
		},
	},

	-- dashboard
	{ 'goolord/alpha-nvim',
		lazy = false,
		config = function()
			local startify = require('alpha.themes.startify')

			startify.section.header.val = {
				[[-- .- - .... . -- .- - .. -.-. ...]],
			}

			startify.section.top_buttons.val = {
				startify.button('e', 'New file', '<Cmd>ene <BAR> startinsert<CR>'),
			}
			startify.section.bottom_buttons.val = {
				startify.button('u', 'Update Plugins', '<cmd>Lazy update<CR>'),
				startify.button('q', 'Quit', '<Cmd>exit<CR>'),
			}

			startify.config.opts.noautocmd = true
			startify.nvim_web_devicons.enabled = false

			require('alpha').setup(startify.config)
		end
	},

	-- better quickfix
	{
		'kevinhwang91/nvim-bqf',
		dependencies = {
			'junegunn/fzf',
			build = function()
				vim.fn['fzf#install']()
			end
		},
		config = {
			preview = {
				win_height = 5,
				win_vheight = 5,
			},
		},
		ft = 'qf',
	},

	-- todo-comments
	{
		'folke/todo-comments.nvim',
		config = true,
		keys = {
			{ ']t', function()
				require('todo-comments').jump_next()
			end, desc = 'Next todo comment' },

			{ '[t', function()
				require('todo-comments').jump_prev()
			end, desc = 'Previous todo comment' },
		},
		event = 'BufReadPost',
		cmd = { 'TodoTrouble', 'TodoTelescope' },
	},

	-- alternative to matchparen neovim plugin
	{
		'monkoose/matchparen.nvim',
		config = true,
		-- event = 'BufReadPost',
	},
}


return M
