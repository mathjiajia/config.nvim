vim.g.tex_flavor = 'latex'
vim.g.tex_comment_nospell = 1
vim.wo.conceallevel = 2

-- VimTeX
local custom_cmds = {
    { name = 'longrightarrow', mathmode = 1, concealchar = '→', opt = false, arg = false },
    { name = 'dashrightarrow', mathmode = 1, concealchar = '⇢', opt = false, arg = false },
    { name = 'ar', mathmode = 1, concealchar = '→', opt = true, arg = true },
}

vim.g.vimtex_quickfix_mode      = 2
vim.g.vimtex_view_method        = 'skim'
vim.g.vimtex_syntax_custom_cmds = custom_cmds
vim.g.vimtex_imaps_enabled      = 0
vim.g.vimtex_complete_enabled   = 0

-- SPELL
vim.opt_local.spell = true
vim.bo.spelllang = 'en_gb'
vim.keymap.set('i', '<M-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })

vim.keymap.set('n', '<M-b>', '<Cmd>TexlabBuild<CR>', { buffer = true, desc = 'Compile LaTeX' })
vim.keymap.set('n', '<M-v>', '<Cmd>TexlabForward<CR>', { buffer = true, desc = 'View PDF' })
