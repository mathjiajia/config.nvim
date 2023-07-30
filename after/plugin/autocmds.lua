local api, fn = vim.api, vim.fn
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

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

autocmd("FileType", {
	-- schedule_wrap is used to stop dlopen from crashing on MacOS
	callback = vim.schedule_wrap(function()
		if not pcall(vim.treesitter.start) then
			return
		end

		-- folds
		vim.opt_local.foldmethod = "expr"
		vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldenable = false
		-- vim.cmd.normal("zx")

		-- indentation
		-- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end),
	desc = "treesitter",
})

-- put the cursor at the last edited position
autocmd({ "BufWinEnter", "FileType" }, {
	group = augroup("LastPlace", {}),
	callback = function(ev)
		local buf = ev.buf

		local ignore_buftype = { "quickfix", "nofile", "help" }
		local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

		if
			vim.list_contains(ignore_buftype, vim.bo[buf].buftype)
			or vim.list_contains(ignore_filetype, vim.bo[buf].filetype)
			or api.nvim_win_get_cursor(0)[1] > 1
		then
			return
		end

		local mark = api.nvim_buf_get_mark(buf, '"')
		local last_line = mark[1]
		local lcount = api.nvim_buf_line_count(buf)

		if last_line > 0 and last_line <= lcount then
			local win_last_line = fn.line("w$")
			local win_height = api.nvim_win_get_height(0)
			if win_last_line == lcount then
				pcall(api.nvim_win_set_cursor, 0, mark)
			elseif win_height < (lcount - last_line + 1) * 2 then
				vim.cmd.normal({ [[g`"zz]], bang = true })
			else
				vim.cmd.normal({ [[G'"<C-e>]], bang = true })
			end
		end
	end,
	desc = "Last Position",
})

-- Opens non-text files in the default program instead of in Neovim
autocmd("BufReadPost", {
	group = augroup("openFile", {}),
	pattern = { "*.jpeg", "*.jpg", "*.pdf", "*.png" },
	callback = function()
		fn.jobstart("open '" .. fn.expand("%") .. "'", { detach = true })
		api.nvim_buf_delete(0, {})
	end,
	desc = "openFile",
})
