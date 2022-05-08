local fterm = require 'FTerm'

vim.keymap.set({ 'n', 't' }, '<C-\\>', function() fterm.toggle() end, { desc = 'Terminal Toggle' })
vim.keymap.set('t', '<Esc>', function() fterm.exit() end, { desc = 'Terminal Exit' })
vim.keymap.set('n', '<M-g>', function() fterm:new({ cmd = 'lazygit', dimensions = { height = 1, width = 1 } }):open() end, { desc = 'LazyGit' })
