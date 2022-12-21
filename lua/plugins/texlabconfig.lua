local M = {
	'f3fora/nvim-texlabconfig',
	build = 'go build',
	ft = 'tex',
}

M.config = function()
	require('texlabconfig').setup()
end

return M
