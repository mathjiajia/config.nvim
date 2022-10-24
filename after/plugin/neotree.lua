vim.g.neo_tree_remove_legacy_commands = 1

require('neo-tree').setup({
	window = { width = 30 },
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = 'open_current',
	},
	source_selector = { winbar = true }
})

vim.keymap.set('n', '<M-t>',
	function()
		require('neo-tree.command')._command('toggle')
	end,
	{ desc = 'Toggle NeoTree' })
