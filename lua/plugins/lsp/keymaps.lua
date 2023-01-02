local M = {}

local lsp = vim.lsp

function M.on_attach(client, bufnr)
	local self = M.new(client, bufnr)

	self:map('gD', lsp.buf.declaration, { desc = 'Goto Declaration' })
	self:map('gd', function()
		require('lspsaga.definition'):peek_definition()
	end, { desc = 'Goto Definition' })
	self:map('K', function()
		require('lspsaga.hover'):render_hover_doc()
	end, { desc = 'Docs Hover' })
	self:map('gi', lsp.buf.implementation, { desc = 'Goto Implementation' })
	self:map('<C-k>', lsp.buf.signature_help, { desc = 'Signature' })
	self:map('<leader>rn', vim.lsp.buf.rename, { desc = 'Rename Symbol' })
	self:map('gr', lsp.buf.references, { desc = 'References' })

	self:map('<leader>ca', function()
		require('lspsaga.codeaction'):code_action()
	end, { desc = 'Code Action', mode = { 'n', 'x' }, has = 'codeAction' })
end

function M.new(client, bufnr)
	return setmetatable({ client = client, buffer = bufnr }, { __index = M })
end

function M:has(cap)
	return self.client.server_capabilities[cap .. 'Provider']
end

function M:map(lhs, rhs, opts)
	opts = opts or {}
	if opts.has and not self:has(opts.has) then
		return
	end
	vim.keymap.set(
		opts.mode or 'n',
		lhs,
		rhs,
		{ silent = true, buffer = self.buffer, desc = opts.desc }
	)
end

return M
