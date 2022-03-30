local settings = {
	Lua = {
		diagnostics = { globals = { 'vim', 'use' } },
	},
}

local M = {}

M.setup = function(on_attach, capabilities)
	local luadev = require('lua-dev').setup {
		lspconfig = {
			on_attach = on_attach,
			capabilities = capabilities,
			settings = settings,
		},
	}
	require('lspconfig').sumneko_lua.setup(luadev)
end

return M
