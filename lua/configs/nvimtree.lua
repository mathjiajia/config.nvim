-- settings
local special_files = {
	['README.md'] = true,
	['LICENSE'] = true,
}

local icons = {
	default = '',
	symlink = '',
	git = {
		unstaged = '✗',
		staged = '✓',
		unmerged = '',
		renamed = '➜',
		untracked = '★',
		deleted = '',
		ignored = '◌',
	},
	folder = {
		arrow_open = '',
		arrow_closed = '',
		default = '',
		open = '',
		empty = '',
		empty_open = '',
		symlink = '',
		symlink_open = '',
	},
}
local show_icons = {
	git = 1,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

vim.g.nvim_tree_indent_markers = 1 -- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 2 -- 0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ':~' -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_add_trailing = 0 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 1 --  0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_icon_padding = ' ' -- one space by default, used for rendering the space between the icon and the filename.
vim.g.nvim_tree_symlink_arrow = ' >> ' --  defaults to ' ➛ '. used as a separator between symlinks' source and target.
vim.g.nvim_tree_respect_buf_cwd = 0 -- 0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
vim.g.nvim_tree_create_in_closed_folder = 1 -- 0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
vim.g.nvim_tree_special_files = special_files
-- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = show_icons
-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath.
-- if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
-- but this will not work when you set indent_markers (because of UI conflict)

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = icons

local custom = {
	'.cache',
	'.cpan',
	'.dropbox',
	'.gem',
	'.git',
	'.npm',
	'.vscode',
	'.wns',
	'.DS_Store',
	'.CFUserTextEncoding',
	'.node_repl_history',
	'bin',
	'node_modules',
	'Applications',
	'Library',
	'Movies',
	'Music',
	'neovim',
	'Pictures',
	'Public',
	'Zotero',
}

require('nvim-tree').setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = true,
	auto_reload_on_write = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = '',
			info = '',
			warning = '',
			error = '',
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = custom,
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = {},
		},
		number = false,
		relativenumber = false,
		signcolumn = 'yes',
	},
	trash = {
		cmd = 'trash',
		require_confirm = true,
	},
	actions = {
		change_dir = {
			global = false,
		},
		open_file = {
			quit_on_open = false,
			window_picker = {
				enable = true,
				chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
				exclude = {
					filetype = {
						'notify',
						'packer',
						'qf',
					},
				},
			},
		},
	},
}
