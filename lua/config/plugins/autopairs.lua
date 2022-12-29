local M = {
	'windwp/nvim-autopairs',
	event = 'InsertEnter',
}

function M.config()
	local npairs = require('nvim-autopairs')

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
end

return M
