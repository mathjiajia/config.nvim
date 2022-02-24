local cp = require('colors')

vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { fg = cp.black3 })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = cp.white })

-- vim.api.nvim_set_hl(0, 'IndentBlanklineIndent6', { fg = cp.yellow, nocombine = true })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineIndent5', { fg = cp.red, nocombine = true })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineIndent4', { fg = cp.teal, nocombine = true })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineIndent3', { fg = cp.peach, nocombine = true })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineIndent2', { fg = cp.blue, nocombine = true })
-- vim.api.nvim_set_hl(0, 'IndentBlanklineIndent1', { fg = cp.pink, nocombine = true })

require('indent_blankline').setup {
	-- char = '|',
	char_list = {},
	char_highlight_list = {
		-- 'IndentBlanklineIndent1',
		-- 'IndentBlanklineIndent2',
		-- 'IndentBlanklineIndent3',
		-- 'IndentBlanklineIndent4',
		-- 'IndentBlanklineIndent5',
		-- 'IndentBlanklineIndent6',
	},
	space_char_blankline = ' ',
	use_treesitter = true,
	indent_level = 10,
	show_first_indent_level = true,
	show_trailing_blankline_indent = false,
	show_current_context = true,
	show_current_context_start = true,
	filetype_exclude = { 'lspinfo', 'packer', 'checkhealth', 'help', '' },
	buftype_exclude = { 'terminal', 'nofile' },
}
