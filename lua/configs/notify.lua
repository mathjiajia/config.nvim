local cp = {
	peach = '#F8BD96', -- Peach

	-- Diagnostic Colors
	diag = {
		error = '#FB617E',
		warning = '#FAE3B0',
		info = '#B5E8E0',
		hint = '#9ed06c',
	},
}

vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { link = 'DiagnosticError' })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { link = 'DiagnosticWarning' })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { link = 'DiagnosticInfo' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { link = 'DiagnosticHint' })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'NotifyERRORBorder' })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'NotifyWARNBorder' })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'NotifyINFOBorder' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { link = 'NotifyDEBUGBorder' })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.diag.error, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.diag.warning, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.diag.info, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.peach, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.diag.hint, italic = true })

require('notify').setup {}

vim.notify = require('notify')
