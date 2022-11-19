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
	'rebelot/heirline.nvim',
	'lukas-reineke/indent-blankline.nvim',
	{
		'folke/noice.nvim',
		requires = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		}
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			require('nvim-treesitter.install').update({ with_sync = true })
		end
	},
	{
		'nvim-treesitter/playground',
		opt = true
	},
	'nvim-treesitter/nvim-treesitter-context',
	'p00f/nvim-ts-rainbow',

	-- Completion
	'hrsh7th/nvim-cmp',

	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-path',
	'lukas-reineke/cmp-rg',
	'saadparwaiz1/cmp_luasnip',

	'L3MON4D3/LuaSnip',
	'windwp/nvim-autopairs',
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
		}
	},
	{
		'jose-elias-alvarez/null-ls.nvim',
		requires = 'nvim-lua/plenary.nvim'
	},

	'stevearc/aerial.nvim',
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
		}
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
		}
	},

	-- Utils
	'numtostr/FTerm.nvim',
	'lewis6991/gitsigns.nvim',
	{
		'numToStr/Comment.nvim',
		config = [[require('Comment').setup()]]
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
	{ 'lervag/vimtex' },
	{
		'f3fora/nvim-texlabconfig',
		run = 'go build',
		config = [[require('texlabconfig').setup()]]
	},

	-- Norg
	-- {
	-- 	'nvim-neorg/neorg',
	-- 	requires = 'nvim-neorg/neorg-telescope'
	-- },
}

require('packer').startup({ plugins })
