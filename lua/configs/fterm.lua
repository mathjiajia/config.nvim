local FTerm = require('FTerm')

FTerm.setup {
	-- Filetype of the terminal buffer
	ft = 'FTerm',

	-- Command to run inside the terminal. It could be a `string` or `table`
	cmd = os.getenv('SHELL'),

	-- Neovim's native window border. See `:h nvim_open_win` for more configuration options.
	border = 'single',

	-- Close the terminal as soon as shell/command exits.
	-- Disabling this will mimic the native terminal behaviour.
	auto_close = true,

	-- Highlight group for the terminal. See `:h winhl`
	hl = 'Normal',

	-- Transparency of the floating window. See `:h winblend`
	blend = 0,

	-- Object containing the terminal window dimensions.
	-- The value for each field should be between `0` and `1`
	dimensions = {
		height = 0.8, -- Height of the terminal window
		width = 0.8, -- Width of the terminal window
		x = 0.5, -- X axis of the terminal window
		y = 0.5, -- Y axis of the terminal window
	},

	-- Callback invoked when the terminal exits.
	-- See `:h jobstart-options`
	on_exit = nil,

	-- Callback invoked when the terminal emits stdout data.
	-- See `:h jobstart-options`
	on_stdout = nil,

	-- Callback invoked when the terminal emits stderr data.
	-- See `:h jobstart-options`
	on_stderr = nil,
}

-- stylua: ignore start
vim.keymap.set({ 'n', 't' }, '<M-i>', function() FTerm.toggle() end, { desc = 'Terminal Toggle' })
vim.keymap.set('t', '<M-S-i>', function() FTerm.exit() end, { desc = 'Terminal Exit' })
vim.keymap.set(
	'n',
	'<M-g>',
	function()
		FTerm:new({ cmd = 'lazygit', dimensions = { height = 0.9, width = 0.9 } }):open()
	end,
	{ desc = 'LazyGit' }
)
-- stylua: ignore start
