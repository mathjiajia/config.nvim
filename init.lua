local ok, impatient = pcall(require, 'impatient')
if ok then
	impatient.enable_profile()
else
	vim.notify(impatient)
end

-- Do all init in core/init.lua so impatient can cache it
require('core')
