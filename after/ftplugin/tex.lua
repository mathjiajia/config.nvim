vim.g.tex_flavor = 'latex'

vim.wo.conceallevel = 2
vim.wo.spell = true

vim.keymap.set(
	'i',
	'<M-l>',
	'<C-g>u<Esc>[s1z=`]a<C-g>u',
	{ buffer = true, desc = 'Fix Last Miss-Spelling' }
)

require('nvim-surround').buffer_setup({
	surrounds = {
		['"'] = {
			add = { '``', "''" },
			find = "``.-''",
			delete = "^(``)().-('')()$",
		},
		['$'] = {
			add = { '\\(', '\\)' },
			find = '\\%(.-\\%)',
			delete = '^(\\%()().-(\\%))()$',
			change = {
				target = '^\\(%()().-(\\%))()$',
				replacement = function()
					return { { '[', '\t' }, { '', '\\]' } }
				end,
			},
		},
	},
})
