local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local settings = {
	Lua = {
		runtime = {
			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT',
			-- Setup your lua path
			path = runtime_path,
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = { 'vim', 'packer_plugins' },
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = vim.api.nvim_get_runtime_file('', true),
		},
		-- Do not send telemetry data containing a randomized but unique identifier
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
			flags = { debounce_text_changes = 150 },
			settings = settings,
		},
	}
	require('lspconfig').sumneko_lua.setup(luadev)
end

return M
