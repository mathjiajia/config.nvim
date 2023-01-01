local M = {
	-- comments
	{
		'numToStr/Comment.nvim',
		config = true,
		keys = { 'gbc', 'gc', 'gcc' },
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

	-- surround
	{
		'kylechui/nvim-surround',
		config = true,
		keys = { 'cs', 'ds', 'ys' },
	},

	-- terminal
	{
		'numtostr/FTerm.nvim',
		keys = {
			{ '<M-i>', function()
				require('FTerm').toggle()
			end, mode = { 'n', 't' }, desc = 'Toggle Terminal' },

			{ '<leader><Enter>', function()
				require('configs.utils').code_run()
			end, desc = 'Code Runner' },
		},
		config = function()
			vim.keymap.set('t', '<Esc>', function()
				require('FTerm').exit()
			end, { desc = 'Exit Terminal' })
		end,
	},
}

return M
