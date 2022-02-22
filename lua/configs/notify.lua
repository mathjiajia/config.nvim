require('notify').setup {
	-- Animation style (see below for details)
	stages = 'fade_in_slide_out',

	-- Function called when a new window is opened, use for changing win settings/config
	on_open = nil,

	-- Function called when a window is closed
	on_close = nil,

	-- Render function for notifications. See notify-render()
	render = 'default',

	-- Default timeout for notifications
	timeout = 5000,

	-- Max number of columns for messages
	max_width = nil,
	-- Max number of lines for a message
	max_height = nil,

	-- For stages that change opacity this is treated as the highlight behind the window
	-- Set this to either a highlight group, an RGB hex value e.g. "#000000"
	-- or a function returning an RGB code for dynamic values
	background_colour = 'Normal',

	-- Minimum width for notification windows
	minimum_width = 50,

	-- Icons for the different levels
	icons = {
		ERROR = '',
		WARN = '',
		INFO = '',
		DEBUG = '',
		TRACE = '✎',
	},
}

vim.notify = require('notify')

local cp = require('colors')

vim.api.nvim_set_hl(0, 'NotifyERRORBorder', { link = 'DiagnosticError' })
vim.api.nvim_set_hl(0, 'NotifyWARNBorder', { link = 'DiagnosticWarning' })
vim.api.nvim_set_hl(0, 'NotifyINFOBorder', { link = 'DiagnosticInfo' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGBorder', { fg = cp.gray0 })
vim.api.nvim_set_hl(0, 'NotifyTRACEBorder', { link = 'DiagnosticHint' })

vim.api.nvim_set_hl(0, 'NotifyERRORIcon', { link = 'NotifyERRORBorder' })
vim.api.nvim_set_hl(0, 'NotifyWARNIcon', { link = 'NotifyWARNBorder' })
vim.api.nvim_set_hl(0, 'NotifyINFOIcon', { link = 'NotifyINFOBorder' })
vim.api.nvim_set_hl(0, 'NotifyDEBUGIcon', { fg = cp.gray0 })
vim.api.nvim_set_hl(0, 'NotifyTRACEIcon', { link = 'NotifyTRACEBorder' })

vim.api.nvim_set_hl(0, 'NotifyERRORTitle', { fg = cp.diag.error, italic = true })
vim.api.nvim_set_hl(0, 'NotifyWARNTitle', { fg = cp.diag.warning, italic = true })
vim.api.nvim_set_hl(0, 'NotifyINFOTitle', { fg = cp.diag.info, italic = true })
vim.api.nvim_set_hl(0, 'NotifyDEBUGTitle', { fg = cp.gray, italic = true })
vim.api.nvim_set_hl(0, 'NotifyTRACETitle', { fg = cp.diag.hint, italic = true })
