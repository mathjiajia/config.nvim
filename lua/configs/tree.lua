vim.api.nvim_set_hl(0, 'NeoTreeDirectoryName', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'NeoTreeDirectoryIcon', { link = 'NeoTreeDirectoryName' })

require('neo-tree').setup {
	close_if_last_window = true,
	popup_border_style = 'rounded',
	enable_git_status = true,
	enable_diagnostics = true,
	default_component_configs = {
		indent = {
			indent_size = 2,
			padding = 0, -- extra padding on left hand side
			with_markers = true,
			indent_marker = '│',
			last_indent_marker = '└',
			highlight = 'NeoTreeIndentMarker',
		},
		icon = {
			folder_closed = '',
			folder_open = '',
			folder_empty = '',
			default = '',
		},
		name = {
			trailing_slash = false,
			use_git_status_colors = true,
		},
		git_status = {
			-- highlight = 'NeoTreeDimText', -- if you remove this the status will be colorful
		},
	},
	filesystem = {
		follow_current_file = true,
		use_libuv_file_watcher = true,
		hijack_netrw_behavior = 'open_split',
		window = { width = 35 },
	},
	buffers = {
		show_unloaded = true,
		window = { position = 'float' },
	},
}

vim.keymap.set('n', '<M-t>', ':NeoTreeReveal<CR>', { silent = true, desc = 'Toggle NeoTree' })
