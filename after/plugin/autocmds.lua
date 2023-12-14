local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local Util = require("util")

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
	group = augroup("CheckTime", {}),
	command = "checktime",
})

-- Highlight yanked text
autocmd("TextYankPost", {
	group = augroup("HighlightYank", {}),
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "Highlight the yanked text",
})

-- Treesitter
autocmd("FileType", {
	-- schedule_wrap is used to stop dlopen from crashing on MacOS
	callback = vim.schedule_wrap(function()
		if not pcall(vim.treesitter.start) then
			return
		end

		-- folds
		vim.wo.foldmethod = "expr"
		vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo.foldlevel = 99

		-- indentation
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end),
	desc = "Treesitter",
})

-- put the cursor at the last edited position
autocmd("BufReadPost", {
	group = augroup("LastPlace", {}),
	callback = function(event)
		local exclude_bt = { "help", "nofile", "quickfix" }
		local exclude_ft = { "gitcommit" }
		local buf = event.buf
		if
			vim.list_contains(exclude_bt, vim.bo[buf].buftype)
			or vim.list_contains(exclude_ft, vim.bo[buf].filetype)
			or vim.api.nvim_win_get_cursor(0)[1] > 1
			or vim.b[buf].last_pos
		then
			return
		end
		vim.b[buf].last_pos = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
	desc = "Last Position",
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
