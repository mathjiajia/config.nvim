local util = require("util")

-- better up/down
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- stylua: ignore start
-- Move to window using the <meta> movement keys
vim.keymap.set("n", "<M-h>", function() vim.cmd.wincmd("h") end, { desc = "Move to Left Window" })
vim.keymap.set("n", "<M-j>", function() vim.cmd.wincmd("j") end, { desc = "Move to Bottom Window" })
vim.keymap.set("n", "<M-k>", function() vim.cmd.wincmd("k") end, { desc = "Move to Upper Window" })
vim.keymap.set("n", "<M-l>", function() vim.cmd.wincmd("l") end, { desc = "Move to Right Window" })
-- stylua: ignore end

-- INSERT
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move Forward a Char" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move Backward a Char" })

-- list
vim.keymap.set("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Open Location List" })
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Open Quickfix List" })

-- stylua: ignore start
-- toggle options
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
vim.keymap.set("n", "<leader>tc", function()
	util.toggle("conceallevel", false, {0, conceallevel})
end, { desc = "Conceal" })
vim.keymap.set("n", "<leader>td", util.toggle_diagnostics, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>tf", function() require("plugins.lsp.format").toggle() end, { desc = "Format on Save" })
vim.keymap.set("n", "<leader>tn", function()
	util.toggle("relativenumber", true)
	util.toggle("number")
end, { desc = "Line Numbers" })
vim.keymap.set("n", "<leader>ts", function() util.toggle("spell") end, { desc = "Spelling" })
vim.keymap.set("n", "<leader>tw", function() util.toggle("wrap") end, { desc = "Word Wrap" })

-- floating terminal
vim.keymap.set("n", "<leader>or", function() util.code_run() end, { desc = "Code Runner" })
vim.keymap.set("n", "<leader>ot", function()
	util.float_term(nil, { cwd = util.get_root() })
end, { desc = "Terminal (root dir)" })
vim.keymap.set("n", "<leader>oT", function() util.float_term() end, { desc = "Terminal (cwd)" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- lazygit
vim.keymap.set("n", "<M-g>", function()
	util.float_term("lazygit", { cwd = util.get_root() })
end, { desc = "LazyGit (root dir)" })
vim.keymap.set("n", "<M-S-g>", function() util.float_term("lazygit") end, { desc = "LazyGit (cwd)" })
-- stylua: ignore end
