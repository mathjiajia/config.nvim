vim.g.neo_tree_remove_legacy_commands = 1

require('neo-tree').setup {
	default_component_configs = {
		indent = { padding = 0, with_markers = true },
	},
	window = { width = 30 },
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = 'open_current',
		-- use_libuv_file_watcher = true,
	},
}

vim.keymap.set('n', '<M-t>', function()
	require('neo-tree.command')._command 'toggle'
end, { desc = 'Toggle NeoTree' })
