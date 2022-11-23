local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source | PackerCompile',
	pattern = 'plugins.lua',
	group   = 'packer_user_config',
	desc    = 'reload whenever plugins.lua is updated',
})

local plugins = {
	'wbthomason/packer.nvim',

	'lewis6991/impatient.nvim',
	{
		'monkoose/matchparen.nvim',
		config = [[require('matchparen').setup({})]]
	},

	-- UI
	{
		'rebelot/heirline.nvim',
		config = [[require('configs.heirline')]]
	},
	{
		'lukas-reineke/indent-blankline.nvim',
		config = [[require('configs.indentline')]]
	},
	{
		'folke/noice.nvim',
		requires = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
		config = [[require('configs.noice')]]
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update({ with_sync = true }))
		end,
		config = [[require('configs.treesitter')]]
	},
	-- 'nvim-treesitter/playground',
	'nvim-treesitter/nvim-treesitter-context',
	'p00f/nvim-ts-rainbow',

	-- Completion
	{
		'hrsh7th/nvim-cmp',
		config = [[require('configs.cmp')]]
	},

	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',
	'lukas-reineke/cmp-rg',
	'saadparwaiz1/cmp_luasnip',

	{
		'L3MON4D3/LuaSnip',
		config = [[require('configs.luasnip')]]
	},
	{
		'windwp/nvim-autopairs',
		config = [[require('configs.autopairs')]]
	},
	-- {
	-- 	'zbirenbaum/copilot.lua',
	-- 	config = [[require('copilot').setup()]]
	-- },
	-- {
	-- 	'zbirenbaum/copilot-cmp.lua',
	-- 	config = [[require('copilot_cmp').setup()]]
	-- },

	-- LSP
	{
		'neovim/nvim-lspconfig',
		requires = {
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',
		},
		config = [[require('configs.lsp')]]
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('configs.null-ls')]]
	},

	{
		'stevearc/aerial.nvim',
		config = [[require('configs.aerial')]]
	},
	-- 'glepnir/lspsaga.nvim',
	'folke/neodev.nvim',
	-- {
	-- 	'folke/trouble.nvim',
	-- 	requires = 'nvim-tree/nvim-web-devicons',
	-- 	config = [[require('trouble').setup()]]
	-- },

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons'
		},
		config = [[require('configs.telescope')]]
	},

	{
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	},
	{
		'nvim-telescope/telescope-frecency.nvim',
		requires = 'kkharji/sqlite.lua'
	},
	'nvim-telescope/telescope-file-browser.nvim',
	'nvim-telescope/telescope-bibtex.nvim',
	'nvim-telescope/telescope-ui-select.nvim',

	-- File Exploer
	{
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			'MunifTanjim/nui.nvim'
		},
		config = [[require('configs.neotree')]]
	},

	-- Utils
	{
		'numToStr/Comment.nvim',
		config = [[require('Comment').setup()]]
	},
	{
		'numtostr/FTerm.nvim',
		config = [[require('configs.fterm')]]
	},
	{
		'lewis6991/gitsigns.nvim',
		config = [[require('configs.gitsigns')]]
	},
	{
		'ggandor/leap.nvim',
		config = [[require('leap').add_default_mappings()]]
	},
	{
		'kylechui/nvim-surround',
		config = [[require('nvim-surround').setup()]]
	},

	-- Tex
	{
		'lervag/vimtex',
		config = [[require('configs.vimtex')]]
	},
	{
		'f3fora/nvim-texlabconfig',
		run = 'go build',
		config = [[require('texlabconfig').setup()]]
	},

	-- Norg
	-- {
	-- 	'nvim-neorg/neorg',
	-- 	requires = {
	-- 		'nvim-lua/plenary.nvim',
	-- 		'nvim-neorg/neorg-telescope'
	-- 	},
	-- },
}

require('packer').startup({ plugins })
