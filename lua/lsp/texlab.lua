local settings = {
	texlab = {
		auxDirectory = '.',
		bibtexFormatter = 'texlab',
		build = {
			args = { '-pdf', '-interaction=nonstopmode', '-synctex=1', '%f' },
			executable = 'latexmk',
			forwardSearchAfter = false,
			onSave = false,
		},
		chktex = {
			onEdit = false,
			onOpenAndSave = false,
		},
		diagnosticsDelay = 300,
		formatterLineLength = 80,
		forwardSearch = {
			executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
			args = { '%l', '%p', '%f' },
		},
		latexFormatter = 'latexindent',
		latexindent = {
			modifyLineBreaks = false,
		},
	},
}

local M = {}

M.setup = function(on_attach, capabilities)
	require('lspconfig').texlab.setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = { debounce_text_changes = 150 },
		settings = settings,
	}
end

return M
