require('impatient')

-- SOME GLOBAL FUNCTIONS
P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require('plenary.reload').reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

vim.g.mapleader = ','

-- TURN OFF SOME BUILTIN PLUGINS
vim.g.loaded_gzip = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_zipPlugin = 1

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

-- NEOVIM BUILTIN LSP CONFIGURATION
require('lsp')
