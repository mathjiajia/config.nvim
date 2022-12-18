vim.g.tex_flavor = 'latex'
vim.g.tex_comment_nospell = 1

vim.wo.conceallevel = 2

vim.wo.spell = true
-- vim.keymap.set(
-- 	'i',
-- 	'<M-l>',
-- 	'<C-g>u<Esc>[s1z=`]a<C-g>u',
-- 	{ buffer = true, desc = 'Fix Last Miss-Spelling' }
-- )

vim.keymap.set(
	'n',
	'<M-b>',
	'<Cmd>TexlabBuild<CR>',
	{ buffer = true, desc = 'Build LaTeX' }
)
vim.keymap.set(
	'n',
	'<M-f>',
	'<Cmd>TexlabForward<CR>',
	{ buffer = true, desc = 'Build LaTeX' }
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
