vim.treesitter.start()

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.wo.conceallevel = 2
vim.wo.spell = true

vim.keymap.set("i", "<M-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { buffer = true, desc = "Fix Last Miss-Spelling" })
