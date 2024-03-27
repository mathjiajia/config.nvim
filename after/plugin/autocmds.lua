local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

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

autocmd("LspAttach", {
	group = augroup("UserLspConfig", {}),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		local methods = vim.lsp.protocol.Methods

		local keymaps = {
			{ "gD", vim.lsp.buf.declaration, method = methods.textDocument_declaration },
			{ "gd", vim.lsp.buf.definition, method = methods.textDocument_definition },
			{ "gi", vim.lsp.buf.implementation, method = methods.textDocument_implementation },
			{ "<C-k>", vim.lsp.buf.signature_help, method = methods.textDocument_signatureHelp },
			{ "gt", vim.lsp.buf.type_definition, method = methods.textDocument_typeDefinition },
			{ "<leader>rn", vim.lsp.buf.rename, method = methods.textDocument_rename },
			{ "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" }, method = methods.textDocument_codeAction },
			{ "gr", vim.lsp.buf.references, method = methods.textDocument_references },
		}

		for _, keys in ipairs(keymaps) do
			if client and client.supports_method(keys.method) then
				vim.keymap.set(keys.mode or "n", keys[1], keys[2], { buffer = ev.buf, desc = keys.method })
			end
		end

		if client and client.supports_method(methods.textDocument_documentHighlight) then
			local group = augroup("lsp_document_highlight", {})
			autocmd({ "CursorHold", "CursorHoldI" }, {
				group = group,
				buffer = ev.buf,
				callback = vim.lsp.buf.document_highlight,
			})
			autocmd("CursorMoved", {
				group = group,
				buffer = ev.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end

		-- if client and client.supports_method(methods.textDocument_inlayHint) then
		-- 	vim.lsp.inlay_hint.enable(ev.buf, true)
		-- end

		if client and client.supports_method(methods.textDocument_codeLens) then
			vim.lsp.codelens.refresh({ bufnr = ev.buf })
			autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
				group = augroup("lsp_document_codelens", {}),
				buffer = ev.buf,
				callback = vim.lsp.codelens.refresh,
				once = true,
			})
		end
	end,
})

-- go to last loc when opening a buffer
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

-- Opens non-text files in the default program instead of in Neovim
autocmd("BufReadPost", {
	group = augroup("openFile", {}),
	pattern = { "*.jpeg", "*.jpg", "*.pdf", "*.png" },
	callback = function(ev)
		vim.fn.jobstart("open '" .. vim.fn.expand("%") .. "'", { detach = true })
		vim.api.nvim_buf_delete(ev.buf, {})
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
