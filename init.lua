require('impatient').enable_profile()

P = function(v)
	print(vim.inspect(v))
	return v
end

require('options')
require('keymaps')
require('autocmds')
require('lsp')
-- require('plugins')
