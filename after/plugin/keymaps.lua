local api = vim.api

-- better up/down
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- stylua: ignore start
-- Move to window using the <meta> movement keys
vim.keymap.set({ "n", "t" }, "<M-h>", function() vim.cmd.wincmd("h") end, { desc = "Left Window" })
vim.keymap.set({ "n", "t" }, "<M-j>", function() vim.cmd.wincmd("j") end, { desc = "Bottom Window" })
vim.keymap.set({ "n", "t" }, "<M-k>", function() vim.cmd.wincmd("k") end, { desc = "Upper Window" })
vim.keymap.set({ "n", "t" }, "<M-l>", function() vim.cmd.wincmd("l") end, { desc = "Right Window" })

-- buffer
vim.keymap.set("n", "<leader>bd", function() api.nvim_buf_delete(0, {}) end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", function() api.nvim_buf_delete(0, { force = true }) end, { desc = "Delete Buffer (force)" })

-- commenting
vim.keymap.set("n", "gcO", "O<Esc>Vcx<Esc><Cmd>normal gcc<CR>fxa<BS>", { desc = "Add Comment Above" })
vim.keymap.set("n", "gco", "o<Esc>Vcx<Esc><Cmd>normal gcc<CR>fxa<BS>", { desc = "Add Comment Below" })
