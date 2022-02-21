require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'ayu_mirage',
		component_separators = '|',
		section_separators = '',
		disabled_filetypes = { 'aerial', 'alpha', 'help', 'tsplayground' },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = { 'filetype' },
		lualine_x = { 'diagnostics' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { 'aerial', 'nvim-tree', 'quickfix' },
}
