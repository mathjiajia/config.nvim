local null_ls = require('null-ls')
local b = null_ls.builtins

local sources = {
	-- formatting

	b.formatting.fish_indent,
	b.formatting.latexindent,
	b.formatting.prettierd.with {
		filetypes = { 'html', 'json', 'yaml', 'markdown' },
	},
	b.formatting.stylua,
	-- diagnostics
	-- b.diagnostics.chktex,
	b.diagnostics.markdownlint,
	-- code actions
	-- b.code_actions.gitsigns,
	-- hover
	-- b.hover.dictionary,
}

local M = {}
M.setup = function(null_on_attach)
	null_ls.setup {
		-- debug = true,
		sources = sources,
		on_attach = null_on_attach,
	}
end

return M
