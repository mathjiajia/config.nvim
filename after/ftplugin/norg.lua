vim.treesitter.start()

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

vim.wo.conceallevel = 2
vim.wo.spell = true
