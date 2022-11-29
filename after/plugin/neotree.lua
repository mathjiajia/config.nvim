vim.g.neo_tree_remove_legacy_commands = 1

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

vim.keymap.set(
	'n',
	'<M-t>',
	function()
		require('neo-tree.command')._command('toggle')
	end,
	{ desc = 'Toggle NeoTree' }
)
