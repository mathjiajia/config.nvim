return {

	-- symbols outline
	{
		'stevearc/aerial.nvim',
		config = {
			backends = { 'lsp', 'treesitter', 'markdown', 'man' },
			filter_kind = false,
			icons = require('configs.icons').aerial,
			show_guides = true,
			layout = { min_width = 30 },
		},
		keys = {
			{ '<M-o>', function()
				require('aerial').toggle()
			end, desc = 'Toggle Aerial' },
		}
	},

	-- file explorer
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
		end,
		config = {
			window = {
				position = 'float',
				popup = {
					position = { row = 0, col = '100%' },
					size = function(state)
						local root_name = vim.fn.fnamemodify(state.path, ':~')
						local root_len = string.len(root_name) + 2
						return {
							width = math.max(root_len, 32),
							height = '50%'
						}
					end,
					border = { style = 'rounded' },
				},
			},
			filesystem = {
				follow_current_file = true,
				hijack_netrw_behavior = 'open_current',
			},
			source_selector = {
				winbar = true,
				tab_labels = { buffers = '  Bufs ' },
			}
		},
		cmd = 'Neotree',
		keys = {
			{ '<M-t>', function()
				require('neo-tree.command').execute({
					toggle = true,
					dir = require('configs.utils').get_root()
				})
			end, desc = 'Toggle NeoTree' },
		}

	}
}
