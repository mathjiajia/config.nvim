local settings = {
	texlab = {
		build = {
			-- executable = 'tectonic',
			-- args = { '-X', 'compile', '%f', '--synctex', '--keep-logs', '--keep-intermediates' },
			executable = 'latexmk',
			args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
			forwardSearchAfter = true,
			onSave = false,
		},
		forwardSearch = {
			executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
			args = { '%l', '%p', '%f' },
		},
	},
}

local M = {}

M.setup = function(on_attach, capabilities)
	require('lspconfig').texlab.setup {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = settings,
	}
end

vim.keymap.set('n', '<M-b>', '<Cmd>TexlabBuild<CR>', { buffer = true, desc = 'Compile LaTeX' })
vim.keymap.set('n', '<M-v>', '<Cmd>TexlabForward<CR>', { buffer = true, desc = 'View PDF' })

return M
