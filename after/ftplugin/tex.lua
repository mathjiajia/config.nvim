vim.g.tex_flavor = 'latex'
vim.wo.conceallevel = 1

-- spell
vim.opt_local.spell = true
vim.bo.spelllang = 'en_gb'
vim.keymap.set('i', '<C-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })

-- texlab
vim.keymap.set('n', '<M-b>', '<Cmd>TexlabBuild<CR>', { buffer = true, desc = 'Texlab Build' })
vim.keymap.set('n', '<M-f>', '<Cmd>TexlabForward<CR>', { buffer = true, desc = 'Texlab Forward' })
