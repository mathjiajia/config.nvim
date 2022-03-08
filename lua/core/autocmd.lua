local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('load_lazyly', { clear = true })
autocmd('FileType', {
	callback = function()
		require('packer').loader('null-ls.nvim')
	end,
	pattern = {
		'fish',
		'html',
		'json',
		'lua',
		'markdown',
		'yaml',
	},
	group = 'load_lazyly',
	desc = 'Lazy Loading null-ls',
})
autocmd('FileType', {
	callback = function()
		require('packer').loader('neorg')
	end,
	pattern = 'norg',
	group = 'load_lazyly',
	desc = 'Lazy Loading neorg',
})
autocmd('FileType', {
	callback = function()
		require('packer').loader('vimtex')
	end,
	pattern = 'tex',
	group = 'load_lazyly',
	desc = 'Lazy Loading vimtex',
})

autocmd('InsertEnter', {
	callback = function()
		require('packer').loader('nvim-cmp')
		require('packer').loader('smart-pairs')
	end,
	pattern = '*',
	group = 'load_lazyly',
	once = true,
	desc = 'Lazy Loading cmp and pairs',
})
