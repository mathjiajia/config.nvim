-- This file is automatically loaded by plugins.config

local api, fn = vim.api, vim.fn
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	command = "checktime",
	group = augroup("CheckTime", {}),
})

-- Highlight yanked text
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = augroup("HighlightYank", {}),
	desc = "Highlight the yanked text",
})

-- Opens PDF files in sioyek instead of viewing the binary in Neovim
autocmd("BufReadPost", {
	pattern = "*.pdf",
	callback = function()
		fn.jobstart("sioyek '" .. fn.expand("%") .. "'", { detach = true })
		api.nvim_buf_delete(0, {})
	end,
	group = augroup("OpenPDF", {}),
	desc = "Opens PDF file in sioyek",
})
