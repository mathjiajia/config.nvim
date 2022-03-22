vim.g.neo_tree_remove_legacy_commands = 1

require('neo-tree').setup {
	default_component_configs = {
		indent = { padding = 0, with_markers = true },
		icon = {
			folder_closed = '',
			folder_open = '',
			folder_empty = '',
			-- default = '',
		},
	},
	window = { width = 35 },
	filesystem = {
		-- filtered_items = { hide_dotfiles = false },
		follow_current_file = true,
		hijack_netrw_behavior = 'open_current',
		-- use_libuv_file_watcher = true,
	},
}

vim.keymap.set('n', '<M-t>', function()
	require('neo-tree.command')._command('toggle')
end, { desc = 'Toggle NeoTree' })
-- vim.keymap.set('n', '<M-b>', function()
-- 	require('neo-tree.command')._command('buffers')
-- end, { desc = 'Toggle NeoTree buffers' })
