-- This file is automatically loaded by plugins.config

local api, fn, lsp = vim.api, vim.fn, vim.lsp
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

autocmd("LspAttach", {
	group = augroup("UserLspConfig", {}),
	callback = function(ev)
		local bufnr = ev.buf

		vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

		local function has(method)
			method = method:find("/") and method or "textDocument/" .. method
			local clients = lsp.get_clients({ bufnr = bufnr })
			for _, client in ipairs(clients) do
				if client.supports_method(method) then
					return true
				end
			end
			return false
		end

		if has("documentHighlight") then
			local group = augroup("lsp_document_highlight", {})
			autocmd({ "CursorHold", "CursorHoldI" }, {
				group = group,
				buffer = bufnr,
				callback = lsp.buf.document_highlight,
			})
			autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = group,
				buffer = bufnr,
				callback = lsp.buf.clear_references,
			})
		end

		-- if has("inlayHint") then
		-- 	lsp.inlay_hint(bufnr, true)
		-- end

		-- if has("codeLens") then
		-- 	local group = augroup("lsp_document_codelens", {})
		-- 	autocmd("BufEnter", {
		-- 		group = group,
		-- 		buffer = bufnr,
		-- 		callback = lsp.codelens.refresh,
		-- 		once = true,
		-- 	})
		-- 	autocmd({ "InsertLeave", "BufWritePost", "CursorHold" }, {
		-- 		group = group,
		-- 		buffer = bufnr,
		-- 		callback = lsp.codelens.refresh,
		-- 	})
		-- end

		local keymaps = {
			-- stylua: ignore start
			{ "gd", function() require("glance").open("definitions") end, desc = "Goto Definition", method = "definition" },
			{ "gi", function() require("glance").open("implementations") end,  desc = "Goto Implementation", method = "implementation" },
			{ "gr", function() require("glance").open("references") end,  desc = "References", method = "references" },
			{ "gt", function() require("glance").open("type_definitions") end, desc = "Goto Type Definition", method = "typeDefinition" },
			-- stylua: ignore end
			{ "gD", lsp.buf.declaration, desc = "Goto Declaration", method = "declaration" },
			{ "<C-k>", lsp.buf.signature_help, desc = "Signature", method = "signatureHelp" },
			{ "<leader>rn", lsp.buf.rename, desc = "Rename Symbol", method = "rename" },
			{ "<leader>ca", lsp.buf.code_action, mode = { "n", "v" }, desc = "Code Action", method = "codeAction" },
		}

		for _, keys in ipairs(keymaps) do
			if has(keys.method) then
				vim.keymap.set(keys.mode or "n", keys[1], keys[2], { buffer = bufnr, desc = keys.desc })
			end
		end
	end,
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
