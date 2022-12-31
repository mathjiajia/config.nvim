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

function M.init()
	vim.g.neo_tree_remove_legacy_commands = 1
end

M.config = {
	window = {
		position = 'float',
		popup = {
			position = {
				row = 0,
				col = '100%',
			},
			size = function(state)
				local root_name = vim.fn.fnamemodify(state.path, ':~')
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
}

M.keys = {
	{ '<M-t>', function()
		require('neo-tree.command').execute({
			toggle = true,
			dir = require('utils').get_root()
		})
	end, desc = 'Toggle NeoTree' },
}

return M
