local api = vim.api
local Util = require("util")

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

-- toggle options
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 2
vim.keymap.set("n", "<leader>uc", function() Util.toggle("conceallevel", false, { 0, conceallevel }) end, { desc = "Toggle Conceal" })
vim.keymap.set("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
vim.keymap.set("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
vim.keymap.set("n", "<leader>uL", function() Util.toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
vim.keymap.set("n", "<leader>uf", function() Util.format.toggle() end, { desc = "Toggle auto format (global)" })
vim.keymap.set("n", "<leader>uF", function() Util.format.toggle(true) end, { desc = "Toggle auto format (buffer)" })
vim.keymap.set("n", "<leader>ul", function() Util.toggle.number() end, { desc = "Toggle Line Numbers" })
vim.keymap.set("n", "<leader>ud", function() Util.toggle.diagnostics() end, { desc = "Toggle Diagnostics" })
vim.keymap.set("n", "<leader>uh", function() Util.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
vim.keymap.set("n", "<leader>uT", function() Util.toggle.ts_highlight() end, { desc = "Toggle Treesitter Highlight" })

-- lazygit
vim.keymap.set("n", "<M-g>", function() Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false }) end, { desc = "LazyGit (root dir)" })
vim.keymap.set("n", "<M-S-g>", function() Util.terminal({ "lazygit" }, { esc_esc = false }) end, { desc = "LazyGit (cwd)" })

-- floating terminal
local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end

vim.keymap.set("n", "<C-/>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-/>", vim.cmd.close, { desc = "Hide Terminal" })
vim.keymap.set("n", "<leader>ft", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>fT", function() Util.terminal() end, { desc = "Terminal (cwd)" })
