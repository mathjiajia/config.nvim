local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local Util = require("util")

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("CheckTime", {}),
	callback = function()
		if vim.o.buftype ~= "nofile" then
			vim.cmd("checktime")
		end
	end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
	group = augroup("HighlightYank", {}),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight the yanked text",
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup("last_loc", {}),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.list_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].last_loc then
			return
		end
		vim.b[buf].last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Autoformat autocmd
autocmd("BufWritePre", {
	group = augroup("LazyFormat", {}),
	callback = function(event)
		Util.format.format({ buf = event.buf })
	end,
})

-- Opens non-text files in the default program instead of in Neovim
autocmd("BufReadPost", {
	group = augroup("openFile", {}),
	pattern = { "*.jpeg", "*.jpg", "*.pdf", "*.png" },
	callback = function()
		vim.fn.jobstart("open '" .. vim.fn.expand("%") .. "'", { detach = true })
		vim.api.nvim_buf_delete(0, {})
	end,
	desc = "openFile",
})

-- automatically regenerate spell file after editing dictionary
autocmd("BufWritePost", {
	pattern = "*/spell/*.add",
	callback = function()
		vim.cmd.mkspell({ "%", bang = true, mods = { silent = true } })
	end,
})
