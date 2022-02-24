-- settings
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

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_symlink_arrow = ' >> '
vim.g.nvim_tree_respect_buf_cwd = 0
vim.g.nvim_tree_create_in_closed_folder = 1
vim.g.nvim_tree_show_icons = show_icons
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
	auto_close = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	filters = {
		dotfiles = false,
		custom = custom,
	},
}

vim.keymap.set('n', '<M-t>', function()
	require('nvim-tree').toggle(false)
end, { desc = 'NvimTree Toggle' })
vim.keymap.set('n', '<M-r>', function()
	require('nvim-tree.lib').refresh_tree()
end, { desc = 'NvimTree Refresh' })
