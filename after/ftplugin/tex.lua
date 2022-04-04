vim.g.tex_flavor = 'latex'
vim.g.tex_comment_nospell = 1
vim.wo.conceallevel = 2

-- SPELL
vim.opt_local.spell = true
vim.bo.spelllang = 'en_gb'
vim.keymap.set('i', '<M-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })

vim.keymap.set('n', '<M-b>', '<Cmd>TexlabBuild<CR>', { buffer = true, desc = 'Compile LaTeX' })
vim.keymap.set('n', '<M-v>', '<Cmd>TexlabForward<CR>', { buffer = true, desc = 'View PDF' })
