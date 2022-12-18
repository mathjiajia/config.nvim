local null_ls = require('null-ls')
local b = null_ls.builtins
local lsp = vim.lsp

local sources = {
	b.formatting.black,
	b.formatting.fish_indent,
	-- b.formatting.latexindent,
	b.formatting.prettierd.with { filetypes = { 'css', 'javascript', 'yaml', 'markdown' } },
	-- b.formatting.stylua,
	-- b.diagnostics.chktex,
	b.diagnostics.fish,
	b.diagnostics.markdownlint.with { args = { '--config', '~/.config/markdownlint/markdownlint.yaml', '--stdin' } },
}

null_ls.setup({
	sources = sources,
	on_attach = function(client, bufnr)
		local caps = client.server_capabilities

		if caps.documentFormattingProvider then
			vim.keymap.set(
				'n',
				'<leader>lf',
				function()
					lsp.buf.format({ bufnr = bufnr, async = true })
				end,
				{ buffer = bufnr, desc = 'Formmating' }
			)
		end
		if caps.documentRangeFormattingProvider then
			vim.keymap.set(
				'x',
				'<leader>lf',
				function()
					lsp.buf.format({ bufnr = bufnr, async = true })
				end,
				{ buffer = bufnr, desc = 'Range Formmating' }
			)
		end
	end,
})
