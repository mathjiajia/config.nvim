local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/lewis6991/packer.nvim',
		install_path
	})
end

vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source',
	pattern = 'plugins.lua',
	group   = 'packer_user_config',
	desc    = 'reload whenever plugins.lua is updated',
})

local plugins = {
	'lewis6991/packer.nvim',
	'lewis6991/impatient.nvim',

	'monkoose/matchparen.nvim',

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
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	{ 'nvim-treesitter/playground', opt = true },
	-- 'nvim-treesitter/nvim-treesitter-context',
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
	-- 'zbirenbaum/copilot.lua',
	-- 'zbirenbaum/copilot-cmp',

	-- LSP
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	{ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' },

	'glepnir/lspsaga.nvim',
	'stevearc/aerial.nvim',
	'folke/neodev.nvim',

	{ 'folke/trouble.nvim', requires = 'nvim-tree/nvim-web-devicons' },
	-- 'theHamsta/nvim-semantic-tokens',

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons'
		}
	},

	{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
	{ 'nvim-telescope/telescope-frecency.nvim', requires = 'kkharji/sqlite.lua' },
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
	'numToStr/Comment.nvim',
	'lewis6991/gitsigns.nvim',
	'ggandor/leap.nvim',
	'kylechui/nvim-surround',

	-- Tex
	{ 'lervag/vimtex' },
	{ 'f3fora/nvim-texlabconfig', run = 'go build' },

	-- Norg
	-- {
	-- 	'nvim-neorg/neorg',
	-- 	requires = 'nvim-neorg/neorg-telescope'
	-- },
}

require('packer').startup({ plugins })
