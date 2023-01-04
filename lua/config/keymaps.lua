-- This file is automatically loaded by plugins.config

-- CURSOR MOVEMENTS
vim.keymap.set("n", "<M-h>", function()
  vim.cmd.wincmd("h")
end, { desc = "Move to Left Window" })
vim.keymap.set("n", "<M-l>", function()
  vim.cmd.wincmd("l")
end, { desc = "Move to Right Window" })
vim.keymap.set("n", "<M-j>", function()
  vim.cmd.wincmd("j")
end, { desc = "Move to Bottom Window" })
vim.keymap.set("n", "<M-k>", function()
  vim.cmd.wincmd("k")
end, { desc = "Move to Upper Window" })

-- REMAP FOR DEALING WITH WORD WRAP
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- INSERT
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move Forward a Char" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move Backward a Char" })

-- lazygit
vim.keymap.set("n", "<M-g>", function()
  local util = require("util")
  util.float_term({ "lazygit" }, { cwd = util.get_root() })
end, { desc = "LazyGit" })
