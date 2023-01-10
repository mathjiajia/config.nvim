local M = {}

local lsp = vim.lsp

function M.on_attach(client, bufnr)
	local self = M.new(client, bufnr)

	self:map("gD", lsp.buf.declaration, { desc = "Goto Declaration" })
	self:map("gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
	self:map("K", function()
		require("lspsaga.hover"):render_hover_doc()
	end, { desc = "Docs Hover" })
	self:map("gi", lsp.buf.implementation, { desc = "Goto Implementation" })
	self:map("gr", lsp.buf.references, { desc = "References" })
	self:map("gt", vim.lsp.buf.type_definition, { desc = "Goto Type Definition" })
	self:map("<C-k>", lsp.buf.signature_help, { desc = "Signature" })

	self:map("<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
	self:map("<leader>ca", function()
		require("lspsaga.codeaction"):code_action()
	end, { desc = "Code Action", mode = { "n", "v" }, has = "codeAction" })
end

---@param client string
---@param bufnr number
---@return table
function M.new(client, bufnr)
	return setmetatable({ client = client, buffer = bufnr }, { __index = M })
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
	vim.keymap.set(opts.mode or "n", lhs, rhs, { silent = true, buffer = self.buffer, desc = opts.desc })
end

return M
