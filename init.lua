local ok, impatient = pcall(require, 'impatient')
if ok then
	impatient.enable_profile()
else
	vim.notify(impatient)
end

P = function(v)
	print(vim.inspect(v))
	return v
end

require('options')
require('keymaps')
require('autocmds')
