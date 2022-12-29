local M = {
	'jose-elias-alvarez/null-ls.nvim',
	dependencies = 'nvim-lua/plenary.nvim',
	ft = { 'python', 'fish', 'css', 'javascript', 'yaml', 'markdown' },
}

function M.config()
	local null_ls = require('null-ls')
	local b = null_ls.builtins

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
			require('config.plugins.lsp.formater').setup(client, bufnr)
		end,
	})
end

return M
