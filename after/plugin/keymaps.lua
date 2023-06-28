local Util = require("util")

-- better up/down
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- stylua: ignore start
-- Move to window using the <meta> movement keys
vim.keymap.set("n", "<M-h>", function() vim.cmd.wincmd("h") end, { desc = "Left Window" })
vim.keymap.set("n", "<M-j>", function() vim.cmd.wincmd("j") end, { desc = "Bottom Window" })
vim.keymap.set("n", "<M-k>", function() vim.cmd.wincmd("k") end, { desc = "Upper Window" })
vim.keymap.set("n", "<M-l>", function() vim.cmd.wincmd("l") end, { desc = "Right Window" })

-- buffer
vim.keymap.set("n", "<leader>bd", function() vim.api.nvim_buf_delete(0, {}) end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", function() vim.api.nvim_buf_delete(0, { force = true }) end, { desc = "Delete Buffer (force)" })

-- list
vim.keymap.set("n", "<leader>xl", function() vim.cmd.lopen() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>xq", function() vim.cmd.copen() end, { desc = "Quickfix List" })

-- toggle options
vim.keymap.set("n", "<leader>uf", function() require("plugins.lsp.format").toggle() end, { desc = "Format on Save" })
vim.keymap.set("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Spelling" })
vim.keymap.set("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Word Wrap" })
vim.keymap.set("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Line Numbers" })
vim.keymap.set("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 2
vim.keymap.set("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end, { desc = "Conceal" })
vim.keymap.set("n", "<leader>uh", function() vim.lsp.buf.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })

-- floating terminal
vim.keymap.set("n", "<M-i>", function() Util.float_term(nil, { cwd = Util.get_root() }) end, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<M-S-i>", function() Util.float_term() end, { desc = "Terminal (cwd)" })

-- lazygit
vim.keymap.set("n", "<M-g>", function() Util.float_term("lazygit", { cwd = Util.get_root() }) end, { desc = "LazyGit (root dir)" })
vim.keymap.set("n", "<M-S-g>", function() Util.float_term("lazygit") end, { desc = "LazyGit (cwd)" })
-- stylua: ignore end
