vim.wo.conceallevel = 2

vim.wo.spell = true
vim.bo.spelllang = 'en_gb'
vim.keymap.set('i', '<M-l>',
    '<C-g>u<Esc>[s1z=`]a<C-g>u',
    { buffer = true, desc = 'Fix Last Miss-Spelling' })
