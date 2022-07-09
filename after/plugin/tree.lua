require('nvim-tree').setup {
	disable_netrw = true,
	ignore_buffer_on_setup = false,
	open_on_setup = false,
	open_on_setup_file = false,
	open_on_tab = false,
	sort_by = 'name',
	root_dirs = {},
	prefer_startup_root = false,
	sync_root_with_cwd = false,
	reload_on_bufenter = false,
	respect_buf_cwd = false,
	view = {
		adaptive_size = false,
		centralize_selection = false,
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		preserve_window_proportions = false,
		number = false,
		relativenumber = false,
		signcolumn = 'yes',
	},
	renderer = {
		add_trailing = false,
		group_empty = false,
		highlight_git = false,
		full_name = false,
		highlight_opened_files = 'none',
		root_folder_modifier = ':~',
		indent_markers = {
			-- enable = true,
			icons = {
				corner = '└ ',
				edge = '│ ',
				item = '│ ',
				none = '  ',
			},
		},
	},
	update_focused_file = {
		enable = false,
		update_root = false,
		ignore_list = {},
	},
	ignore_ft_on_setup = {},
	system_open = {
		cmd = '',
		args = {},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = false,
	},
	filters = {
		dotfiles = false,
		custom = {},
		exclude = {},
	},
	filesystem_watchers = {
		enable = false,
		interval = 100,
		debounce_delay = 50,
	},
	git = {
		enable = true,
		ignore = true,
		show_on_dirs = true,
		timeout = 400,
	},
	actions = {
		use_system_clipboard = true,
		change_dir = {
			enable = true,
			global = false,
			restrict_above_cwd = false,
		},
		expand_all = {
			max_folder_discovery = 300,
			exclude = {},
		},
		open_file = {
			quit_on_open = false,
			resize_window = true,
		},
		remove_file = {
			close_window = true,
		},
	},
	trash = {
		cmd = 'gio trash',
		require_confirm = true,
	},
	live_filter = {
		prefix = '[FILTER]: ',
		always_show_folders = true,
	},
}
