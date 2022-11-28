vim.g.neo_tree_remove_legacy_commands = 1

require('neo-tree').setup({
	window = {
		position = 'float',
		popup = {
			position = {
				row = 0,
				col = '100%',
			},
			size = {
				width = 37,
				height = '50%'
			},
			border = {
				style = 'rounded',
			},
		},
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = 'open_current',
	},
	source_selector = { winbar = true }
})

vim.keymap.set(
	'n',
	'<M-t>',
	function()
		require('neo-tree.command')._command('toggle')
	end,
	{ desc = 'Toggle NeoTree' }
)
