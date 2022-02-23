local startify = require('startify')

require('alpha').setup(startify.config)

-- stylua: ignore start
vim.keymap.set('n', '++', function() require('alpha').start(false) end, { desc = 'Startify' })
-- stylua: ignore end
