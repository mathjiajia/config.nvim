local M = {}

local api, lsp = vim.api, vim.lsp
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

function M.on_attach(client, bufnr)
	local self = M.new(client, bufnr)

	self:map("gD", lsp.buf.declaration, { desc = "Goto Declaration" })
	self:map("gd", function()
		require("glance").open("definitions")
	end, { desc = "Goto Definition" })
	self:map("K", lsp.buf.hover, { desc = "Docs Hover" })
	self:map("gi", function()
		require("glance").open("implementations")
	end, { desc = "Goto Implementation" })
	self:map("gr", function()
		require("glance").open("references")
	end, { desc = "References" })
	self:map("gt", function()
		require("glance").open("type_references")
	end, { desc = "Goto Type Definition" })
	self:map("<C-k>", lsp.buf.signature_help, { desc = "Signature" })

	self:map("<leader>rn", lsp.buf.rename, { desc = "Rename Symbol" })
	self:map("<leader>ca", lsp.buf.code_action, { desc = "Code Action", has = "codeAction" })

	if self:has("documentHighlight") then
		augroup("lsp_document_highlight", {})
		autocmd({ "CursorHold", "CursorHoldI" }, {
			callback = lsp.buf.document_highlight,
			group = "lsp_document_highlight",
			buffer = bufnr,
		})
		autocmd({ "CursorMoved", "CursorMovedI" }, {
			callback = lsp.buf.clear_references,
			group = "lsp_document_highlight",
			buffer = bufnr,
		})
	end

	-- if self:has('codeLens') then
	-- 	augroup("lsp_document_codelens", {})
	-- 	autocmd("BufEnter", {
	-- 		callback = lsp.codelens.refresh,
	-- 		buffer = bufnr,
	-- 		group = "lsp_document_codelens",
	-- 		once = true,
	-- 	})
	-- 	autocmd({ "InsertLeave", "BufWritePost", "CursorHold" }, {
	-- 		callback = lsp.codelens.refresh,
	-- 		buffer = bufnr,
	-- 		group = "lsp_document_codelens",
	-- 	})
	-- end
end

---@param client string
---@param bufnr number
---@return table
function M.new(client, bufnr)
	return setmetatable({ client = client, bufnr = bufnr }, { __index = M })
end

---@param cap string
---@return boolean
function M:has(cap)
	return self.client.server_capabilities[cap .. "Provider"]
end

---@param lhs string
---@param rhs string|function
---@param opts table<string, any>
function M:map(lhs, rhs, opts)
	opts = opts or {}
	if opts.has and not self:has(opts.has) then
		return
	end
	vim.keymap.set(opts.mode or "n", lhs, rhs, { silent = true, buffer = self.bufnr, desc = opts.desc })
end

return M
