-- local opts = {
-- 	pairs = {
-- 		norg = { { '`', '`' } },
-- 		tex = {
-- 			{ "'", "'", { ignore_pre = '\\v(\\\\|\\S)' } },
-- 			{ '``', "''" },
-- 		},
-- 	},
-- 	space = { enable_mapping = false },
-- }

-- require('pairs'):setup(opts)

local npairs = require 'nvim-autopairs'

npairs.setup()

npairs.get_rule("'")[1]:with_pair(function()
	if vim.bo.filetype == 'tex' then
		return false
	end
end)

npairs.get_rule('"')[1]:with_pair(function()
	if vim.bo.filetype == 'tex' then
		return false
	end
end)
