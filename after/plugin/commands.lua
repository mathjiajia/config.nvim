local Util = require("util")

vim.api.nvim_create_user_command("LazyRoot", function()
	Util.root.info()
end, { desc = "LazyRoots for the current buffer" })

-- Manual format
vim.api.nvim_create_user_command("LazyFormat", function()
	Util.format.format({ force = true })
end, { desc = "Format selection or buffer" })

-- Format info
vim.api.nvim_create_user_command("LazyFormatInfo", function()
	Util.format.info()
end, { desc = "Show info about the formatters for the current buffer" })
