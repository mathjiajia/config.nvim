local hop = require('hop')
hop.setup { keys = 'etovxqpdygfblzhckisuran' }

-- stylua: ignore start
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hw', function() hop.hint_words() end, { desc = 'Hop Words' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>hl', function() hop.hint_lines() end, { desc = 'Hop Lines' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h/', function() hop.hint_patterns() end, { desc = 'Hop Patterns' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h1', function() hop.hint_char1() end, { desc = 'Hop 1-char' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>h2', function() hop.hint_char2() end, { desc = 'Hop 2-char' })
-- stylua: ignore end
