local M = {
	'f3fora/nvim-texlabconfig',
	build = 'go build',
	ft = 'tex',
}

function M.config()
	require('texlabconfig').setup()
end

return M
