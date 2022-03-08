vim.keymap.set('n', '<M-t>', function()
	require('nvim-tree').toggle()
end, { desc = 'Toggle NvimTree' })

-- settings
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 2
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_symlink_arrow = ' >> '
vim.g.nvim_tree_respect_buf_cwd = 0
vim.g.nvim_tree_create_in_closed_folder = 1

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
