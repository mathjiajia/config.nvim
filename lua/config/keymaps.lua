-- This file is automatically loaded by plugins.config

local util = require("util")

-- stylua: ignore start
-- CURSOR MOVEMENTS
vim.keymap.set("n", "<M-h>", function() vim.cmd.wincmd("h") end, { desc = "Move to Left Window" })
vim.keymap.set("n", "<M-l>", function() vim.cmd.wincmd("l") end, { desc = "Move to Right Window" })
vim.keymap.set("n", "<M-j>", function() vim.cmd.wincmd("j") end, { desc = "Move to Bottom Window" })
vim.keymap.set("n", "<M-k>", function() vim.cmd.wincmd("k") end, { desc = "Move to Upper Window" })
-- stylua: ignore end

-- REMAP FOR DEALING WITH WORD WRAP
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- INSERT
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move Forward a Char" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move Backward a Char" })

-- stylua: ignore start
-- toggle options
vim.keymap.set("n", "<leader>tf", require("plugins.lsp.format").toggle, { desc = "Format on Save" })
vim.keymap.set("n", "<leader>ts", function() util.toggle("spell") end, { desc = "Spelling" })
vim.keymap.set("n", "<leader>tw", function() util.toggle("wrap") end, { desc = "Word Wrap" })
vim.keymap.set("n", "<leader>tn", function() util.toggle("rnu", true) util.toggle("nu") end, { desc = "Line Numbers" })

-- lazygit
vim.keymap.set("n", "<M-g>", function() util.float_term({ "lazygit" }, { cwd = util.get_root() }) end, { desc = "LazyGit" })
-- stylua: ignore end

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
vim.keymap.set("n", "<leader>hl", vim.show_pos, { desc = "Highlight Groups at cursor" })
