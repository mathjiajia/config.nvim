local M = {
	-- comments
	{
		'numToStr/Comment.nvim',
		config = true,
		keys = { 'gbc', 'gc', 'gcc' },
	},

	-- screen navigation
	{
		'ggandor/leap.nvim',
		-- dependencies = {
		-- 	{ 'ggandor/flit.nvim' },
		-- 	{ 'ggandor/leap-ast.nvim' },
		-- },
		config = function()
			require('leap').add_default_mappings()
			-- require('flit').setup({
			-- 	labeled_modes = 'nv',
			-- })
			-- vim.keymap.set({ 'n', 'x', 'o' }, 'M', function()
			-- 	require('leap-ast').leap()
			-- end, {})
		end,
		event = 'VeryLazy',
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
				require('utils').code_run()
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
