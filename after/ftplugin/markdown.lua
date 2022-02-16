-- spell
vim.opt_local.spell = true
vim.bo.spelllang = 'en_gb'
vim.keymap.set('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })

vim.bo.textwidth = 80

vim.keymap.set('n', '<F12>', function()
	require('FTerm')
		:new({
			cmd = 'Glow',
			dimensions = {
				height = 1,
				width = 1,
			},
		})
		:open()
end, { buffer = true, silent = true, desc = 'Markdown Preview' })
