vim.g.tex_flavor = 'latex'
vim.g.tex_comment_nospell = 1

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
	vim.cmd.TexlabBuild,
	{ buffer = true, desc = 'Build LaTeX' }
)
vim.keymap.set(
	'n',
	'<M-f>',
	vim.cmd.TexlabForward,
	{ buffer = true, desc = 'Forward Search' }
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
