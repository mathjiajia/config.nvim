return {
	'stevearc/aerial.nvim',
	config = {
		backends = {
			'lsp', 'treesitter', 'markdown', 'man'
		},
		filter_kind = false,
		icons = require('configs.icons').aerial,
		show_guides = true,
		layout = {
			min_width = 30,
		},
	},
	keys = {
		{ '<M-o>', function()
			require('aerial').toggle()
		end, desc = 'Toggle Aerial' },
	}
}
