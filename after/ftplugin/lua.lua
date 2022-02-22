local cp = require('colors')

vim.api.nvim_set_hl(0, 'luaFunc', { fg = cp.green })
vim.api.nvim_set_hl(0, 'luaFunction', { fg = cp.red })
vim.api.nvim_set_hl(0, 'luaTable', { fg = cp.white })
vim.api.nvim_set_hl(0, 'luaIn', { fg = cp.red })
