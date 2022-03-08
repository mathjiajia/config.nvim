local custom_cmds = {
	{ name = 'longrightarrow', mathmode = 1, concealchar = '→', opt = false, arg = false },
	{ name = 'dashrightarrow', mathmode = 1, concealchar = '⇢', opt = false, arg = false },
	{ name = 'ar', mathmode = 1, concealchar = '→', opt = true, arg = true },
}

vim.g.vimtex_quickfix_mode = 2
vim.g.vimtex_view_method = 'skim'
vim.g.vimtex_syntax_custom_cmds = custom_cmds
