-- spell
vim.opt_local.spell = true
vim.bo.spelllang = 'en_gb'
vim.keymap.set('i', '<M-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })

vim.bo.textwidth = 80

vim.keymap.set('n', '<F12>', function()
	require('FTerm'):new({ cmd = 'Glow', dimensions = { height = 1, width = 1 } }):open()
end, { buffer = true, silent = true, desc = 'Markdown Preview' })

local cp = require('colors')

vim.api.nvim_set_hl(0, 'markdownH1', { fg = cp.lavender })
vim.api.nvim_set_hl(0, 'markdownH2', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'markdownH3', { fg = cp.green })
-- vim.api.nvim_set_hl(0, 'markdownH4', { fg = cp.yellow })
-- vim.api.nvim_set_hl(0, 'markdownH5', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'markdownH6', { fg = cp.teal })

-- vim.api.nvim_set_hl(0, 'markdownUrl', { underline = true })
-- vim.api.nvim_set_hl(0, 'markdownItalic', { italic = true })
-- vim.api.nvim_set_hl(0, 'markdownBold', { bold = true })
-- vim.api.nvim_set_hl(0, 'markdownItalicDelimiter', { fg = cp.gray0 })

-- vim.api.nvim_set_hl(0, 'markdownCode', { fg = cp.flamingo })
-- vim.api.nvim_set_hl(0, 'markdownCodeBlock', { fg = cp.pink })
-- vim.api.nvim_set_hl(0, 'markdownBlockquote', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'markdownListMarker', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'markdownOrderedListMarker', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'markdownRule', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'markdownHeadingRule', { fg = cp.gray0 })
-- vim.api.nvim_set_hl(0, 'markdownUrlDelimiter', { fg = cp.white })
-- vim.api.nvim_set_hl(0, 'markdownLinkText', { fg = cp.blue, underline = true })
-- vim.api.nvim_set_hl(0, 'markdownLinkTextDelimiter', { fg = cp.white })
-- vim.api.nvim_set_hl(0, 'markdownHeadingDelimiter', { fg = cp.maroon, bold = true })
-- vim.api.nvim_set_hl(0, 'markdownUrlTitleDelimiter', { fg = cp.white })
-- vim.api.nvim_set_hl(0, 'markdownIdDeclaration', { link = 'markdownLinkText' })
