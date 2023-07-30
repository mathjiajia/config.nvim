local Util = require("util")

-- better up/down
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- stylua: ignore start
-- Move to window using the <meta> movement keys
vim.keymap.set({ "n", "t" }, "<M-h>", function() vim.cmd.wincmd("h") end, { desc = "Left Window" })
vim.keymap.set({ "n" ,"t" }, "<M-j>", function() vim.cmd.wincmd("j") end, { desc = "Bottom Window" })
vim.keymap.set({ "n", "t" }, "<M-k>", function() vim.cmd.wincmd("k") end, { desc = "Upper Window" })
vim.keymap.set({ "n", "t" }, "<M-l>", function() vim.cmd.wincmd("l") end, { desc = "Right Window" })

-- buffer
vim.keymap.set("n", "<leader>bd", function() vim.api.nvim_buf_delete(0, {}) end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bD", function() vim.api.nvim_buf_delete(0, { force = true }) end, { desc = "Delete Buffer (force)" })

-- toggle options
vim.keymap.set("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Spelling" })
vim.keymap.set("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Word Wrap" })
vim.keymap.set("n", "<leader>ul", function() Util.toggle_number() end, { desc = "Line Numbers" })
vim.keymap.set("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 2
vim.keymap.set("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end, { desc = "Conceal" })
vim.keymap.set("n", "<leader>uh", function() vim.lsp.inlay_hint(0, nil) end, { desc = "Toggle Inlay Hints" })

-- floating terminal
local lazyterm = function() Util.float_term(nil, { cwd = Util.get_root() }) end
vim.keymap.set("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>fT", function() Util.float_term() end, { desc = "Terminal (cwd)" })
vim.keymap.set("n", "<C-/>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-/>", vim.cmd.close, { desc = "Hide Terminal" })

-- lazygit
vim.keymap.set("n", "<M-g>", function() Util.float_term("lazygit", { ft = "lazygit", cwd = Util.get_root() }) end, { desc = "LazyGit (root dir)" })
vim.keymap.set("n", "<M-S-g>", function() Util.float_term("lazygit", { ft = "lazygit" }) end, { desc = "LazyGit (cwd)" })
-- stylua: ignore end
