local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local settings = {
	Lua = {
		runtime = {
			version = 'LuaJIT',
			path = runtime_path,
		},
		diagnostics = {
			globals = { 'vim', 'packer_plugins' },
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file('', true),
		},
		telemetry = {
			enable = false,
		},
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
