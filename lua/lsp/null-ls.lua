local null_ls = require 'null-ls'
local b = null_ls.builtins

local sources = {
	b.formatting.fish_indent,
	-- b.formatting.latexindent,
	b.formatting.prettierd.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
	-- b.formatting.stylua,
	-- b.diagnostics.chktex,
	b.diagnostics.markdownlint,
}

null_ls.setup {
	sources = sources,
	on_attach = function(client, bufnr)
		if client.resolved_capabilities.document_formatting then
			vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, { buffer = bufnr, desc = 'Formmating' })
		end
		if client.resolved_capabilities.document_range_formatting then
			vim.keymap.set(
				'v',
				'<leader>lf',
				vim.lsp.buf.range_formatting,
				{ buffer = bufnr, desc = 'Range Formmating' }
			)
		end
	end,
}
