local M = {
	'nvim-neo-tree/neo-tree.nvim',
	branch = 'v2.x',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
	},
	cmd = 'Neotree',
}

M.init = function()
	vim.g.neo_tree_remove_legacy_commands = 1

	vim.keymap.set(
		'n',
		'<M-t>',
		function()
			require('neo-tree.command')._command('toggle')
		end,
		{ desc = 'Toggle NeoTree' }
	)
end

M.config = function()
	local fn = vim.fn

	require('neo-tree').setup({
		window = {
			position = 'float',
			popup = {
				position = {
					row = 0,
					col = '100%',
				},
				size = function(state)
					local root_name = fn.fnamemodify(state.path, ':~')
					local root_len = string.len(root_name) + 2
					return {
						width = math.max(root_len, 32),
						height = '50%'
					}
				end,
				border = {
					style = 'rounded',
				},
			},
		},
		filesystem = {
			follow_current_file = true,
			hijack_netrw_behavior = 'open_current',
		},
		source_selector = {
			winbar = true,
			tab_labels = {
				buffers = '  Bufs ',
			},
		}
	})
end

return M
