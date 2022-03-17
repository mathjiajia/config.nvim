vim.g.neo_tree_remove_legacy_commands = 1

require('neo-tree').setup {
	default_component_configs = {
		indent = { padding = 0, with_markers = true },
		icon = {
			folder_closed = '',
			folder_open = '',
			folder_empty = '',
			default = '',
		},
		git_status = {
			symbols = {
				-- Change type
				added = '',
				deleted = '',
				modified = '',
				renamed = '',
				-- Status type
				untracked = '',
				ignored = '',
				unstaged = '',
				staged = '',
				conflict = '',
			},
		},
	},
	window = { width = 35 },
	filesystem = {
		filtered_items = { hide_dotfiles = false },
		follow_current_file = true,
		hijack_netrw_behavior = 'open_current',
	},
}

vim.keymap.set('n', '<M-t>', ':Neotree show<CR>', { silent = true, desc = 'Toggle NeoTree' })
-- vim.keymap.set('n', '<M-b>', ':Neotree buffers<CR>', { silent = true, desc = 'Toggle NeoTree Buffer' })
-- vim.keymap.set('n', '<M-b>', function()
-- 	require('neo-tree').show('buffers', true)
-- end, { desc = 'Toggle NeoTree Buffers' })
-- vim.keymap.set('n', '<M-t>', function()
-- 	require('neo-tree').focus('filesystem', true)
-- end, { desc = 'Toggle NeoTree' })
