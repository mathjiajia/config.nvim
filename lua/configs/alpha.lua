local startify = require('alpha.themes.startify')

startify.nvim_web_devicons.enabled = false
startify.nvim_web_devicons.highlight = false
startify.section.header.val = { 'mathjiajia' }

require('alpha').setup(startify.config)

vim.keymap.set('n', '++', function()
	require('alpha').start(false)
end, { desc = 'Startify' })
