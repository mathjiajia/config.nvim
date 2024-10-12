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
	desc = "Highlight the Yanked Text",
})

autocmd("LspAttach", {
	group = augroup("UserLspConfig", {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		local methods = vim.lsp.protocol.Methods

		local keymaps = {
			{ "gD", vim.lsp.buf.declaration, method = methods.textDocument_declaration },
			{ "gd", vim.lsp.buf.definition, method = methods.textDocument_definition },
			{ "gi", vim.lsp.buf.implementation, method = methods.textDocument_implementation },
			{ "<C-k>", vim.lsp.buf.signature_help, method = methods.textDocument_signatureHelp },
			{ "gt", vim.lsp.buf.type_definition, method = methods.textDocument_typeDefinition },
		}

		for _, keys in ipairs(keymaps) do
			if client.supports_method(keys.method) then
				vim.keymap.set(keys.mode or "n", keys[1], keys[2], { buffer = ev.buf, desc = keys.method })
			end
		end

		vim.keymap.set("n", "grn", function()
			vim.lsp.buf.rename()
		end, { desc = "vim.lsp.buf.rename()" })

		vim.keymap.set({ "n", "x" }, "gra", function()
			vim.lsp.buf.code_action()
		end, { desc = "vim.lsp.buf.code_action()" })

		vim.keymap.set("n", "grr", function()
			vim.lsp.buf.references()
		end, { desc = "vim.lsp.buf.references()" })

		vim.keymap.set("i", "<C-S>", function()
			vim.lsp.buf.signature_help()
		end, { desc = "vim.lsp.buf.signature_help()" })

		if client.supports_method(methods.textDocument_documentHighlight) then
			autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = ev.buf,
				callback = vim.lsp.buf.document_highlight,
			})
			autocmd("CursorMoved", {
				buffer = ev.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end

		if client.supports_method(methods.textDocument_inlayHint) then
			vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
		end

		-- vim.lsp.completion.enable(true, ev.data.client_id, 0, { autotrigger = true })
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

-- treesitter
-- autocmd("FileType", {
-- 	callback = function(ev)
-- 		if not pcall(vim.treesitter.start, ev.buf) then
-- 			return
-- 		end
--
-- 		vim.opt_local.foldmethod = "expr"
-- 		vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--
-- 		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
-- 	end,
-- 	desc = "Enable Treesitter",
-- })

-- No buflist for special files
-- close some filetypes with <q>
autocmd("FileType", {
	group = augroup("SpecialFiles", {}),
	pattern = { "checkhealth", "help", "qf", "grug-far" },
	callback = function(ev)
		vim.b[ev.buf].buflisted = false
		vim.keymap.set("n", "q", function()
			vim.api.nvim_win_close(0, false)
		end, { buffer = ev.buf, silent = true })
	end,
	desc = "Special Files",
})

-- Enable conceal and spell for markup langs
autocmd("FileType", {
	group = augroup("ConcealSpell", {}),
	pattern = { "markdown", "norg", "tex" },
	callback = function(ev)
		vim.opt_local.conceallevel = 2
		vim.opt_local.spell = true

		vim.keymap.set("i", "<C-h>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { buffer = ev.buf, desc = "Crect Last Spelling" })
	end,
	desc = "Conceal and Spell",
})

-- Opens non-text files in the default program instead of in Neovim
autocmd("BufReadPost", {
	group = augroup("openFile", {}),
	pattern = { "*.jpeg", "*.jpg", "*.pdf", "*.png" },
	callback = function(ev)
		vim.fn.jobstart("open '" .. vim.fn.expand("%") .. "'", { detach = true })
		vim.api.nvim_buf_delete(ev.buf, {})
	end,
	desc = "Open File",
})

-- automatically regenerate spell file after editing dictionary
autocmd("BufWritePost", {
	pattern = "*/spell/*.add",
	callback = function()
		vim.cmd.mkspell({ "%", bang = true, mods = { silent = true } })
	end,
})
