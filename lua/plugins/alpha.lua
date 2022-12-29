local M = {
	'goolord/alpha-nvim',
	lazy = false,
	-- dependencies = 'nvim-tree/nvim-web-devicons',
}

M.config = function()
	local alpha = require('alpha')
	local startify = require('alpha.themes.startify')

	startify.nvim_web_devicons.enabled = false
	startify.config.opts.noautocmd = true
	startify.section.header.val = {
		[[-- .- - .... . -- .- - .. -.-. ...]],
	}

	alpha.setup(startify.config)
end

return M
