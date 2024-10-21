local api = vim.api

-- better up/down
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- stylua: ignore start
-- buffer
vim.keymap.set("n", "<leader>bd", function() api.nvim_buf_delete(0, {}) end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", function() api.nvim_buf_delete(0, { force = true }) end, { desc = "Delete Buffer (force)" })
