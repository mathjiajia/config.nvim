-- vim.g.neo_tree_remove_legacy_commands = 1

require('neo-tree').setup {
	-- log_level = 'error',
	default_component_configs = {
		indent = { padding = 0, with_markers = true },
		icon = {
			folder_closed = '',
			folder_open = '',
			folder_empty = '',
			-- 	default = '',
		},
	},
	filesystem = {
		filters = { --These filters are applied to both browsing and searching
			show_hidden = true,
			respect_gitignore = true,
		},
		follow_current_file = false, -- This will find and focus the file in the active buffer every
		-- time the current file is changed while the tree is open.
		use_libuv_file_watcher = true, -- This will use the OS level file watchers
		-- to detect changes instead of relying on nvim autocmd events.
		hijack_netrw_behavior = 'open_split',
		window = { width = 35 },
	},
	-- window = { width = 35 },
	-- filesystem = {
	-- 	filtered_items = { hide_dotfiles = false },
	-- 	follow_current_file = true,
	-- 	hijack_netrw_behavior = 'open_current',
	-- },
}

vim.keymap.set('n', '<M-t>', ':NeoTreeShowToggle<CR>', { silent = true, desc = 'Toggle NeoTree' })
-- vim.keymap.set('n', '<M-t>', function()
-- 	require('neo-tree.command')._command('toggle')
-- end, { desc = 'Toggle NeoTree' })
-- vim.keymap.set('n', '<M-b>', function()
-- 	require('neo-tree.command')._command('buffers')
-- end, { desc = 'Toggle NeoTree buffers' })'arrow_open': "",
-- \   'arrow_closed': "",
-- \   'default': "",
-- \   'open': "",
-- \   'empty': "",
-- \   'empty_open': "",
-- \   'symlink': "",
-- \   'symlink_open': "",
