local M = {}

M.autoformat = true

function M.toggle()
	M.autoformat = not M.autoformat
	vim.notify(M.autoformat and "Enabled 'format on save'" or "Disabled 'format on save'")
end

function M.format()
	local buf = vim.api.nvim_get_current_buf()
	local ft = vim.bo[buf].filetype
	local have_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

	vim.lsp.buf.format({
		bufnr = buf,
		filter = function(client)
			if have_nls then
				return client.name == "null-ls"
			end
			return client.name ~= "null-ls"
		end,
	})
end

function M.on_attach(client, bufnr)
	local self = M.new(client, bufnr)

	-- document formatting
	self:map("<leader>cf", M.format, { desc = "Format Document", has = "documentFormatting" })
	self:map("<leader>cf", M.format, { mode = "x", desc = "Format Range", has = "documentRangeFormatting" })

	-- if client.supports_method('textDocument/formatting') then
	if self:has("documentFormatting") then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
			buffer = bufnr,
			callback = function()
				if M.autoformat then
					M.format()
				end
			end,
		})
	end
end

function M.new(client, bufnr)
	return setmetatable({ client = client, buffer = bufnr }, { __index = M })
end

function M:has(cap)
	return self.client.server_capabilities[cap .. "Provider"]
end

function M:map(lhs, rhs, opts)
	opts = opts or {}
	if opts.has and not self:has(opts.has) then
		return
	end
	vim.keymap.set(opts.mode or "n", lhs, rhs, { silent = true, buffer = self.buffer, desc = opts.desc })
end

return M
