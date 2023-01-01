local fn = vim.fn

-- Diagnostic signs
for name, icon in pairs(require('configs.icons').diagnostics) do
    name = 'DiagnosticSign' .. name
    fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
end

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Float Diagnostics' })
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous Diagnostics' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next Diagnostics' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Loclist Diagnostics' })
