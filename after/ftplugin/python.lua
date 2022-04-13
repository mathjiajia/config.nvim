vim.keymap.set('n', '<M-b>', ':execute "!python3" shellescape(@%, 1)<CR>', { buffer = true, desc = 'python3' })
