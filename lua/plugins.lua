local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path
	})
end

vim.cmd.packadd('packer.nvim')
local plugins = {
	{ 'wbthomason/packer.nvim', opt = true },

	'lewis6991/impatient.nvim',
	'monkoose/matchparen.nvim',

	-- UI
	'lukas-reineke/indent-blankline.nvim',
	{
		'rebelot/heirline.nvim',
		requires = 'nvim-tree/nvim-web-devicons',
	},
	{
		'folke/noice.nvim',
		requires = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		},
	},

	-- Treesitter
	{
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update({ with_sync = true }))
		end,
		requires = {
			-- 'nvim-treesitter/playground',
			'nvim-treesitter/nvim-treesitter-textobjects',
			'nvim-treesitter/nvim-treesitter-context',
			'p00f/nvim-ts-rainbow',
		}
	},

	-- Completion
	{
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'lukas-reineke/cmp-rg',
			'saadparwaiz1/cmp_luasnip',
		}
	},

	'L3MON4D3/LuaSnip',
	'windwp/nvim-autopairs',
	-- 'zbirenbaum/copilot.lua',
	-- 'zbirenbaum/copilot-cmp.lua',

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
		requires = 'nvim-lua/plenary.nvim',
	},

	'stevearc/aerial.nvim',
	-- 'glepnir/lspsaga.nvim',
	'folke/neodev.nvim',
	-- {
	-- 	'folke/trouble.nvim',
	-- 	requires = 'nvim-tree/nvim-web-devicons',
	-- },

	-- Telescope
	{
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons'
		},
	},

	'natecraddock/telescope-zf-native.nvim',
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
	},

	-- Utils
	'numToStr/Comment.nvim',
	'numtostr/FTerm.nvim',
	'lewis6991/gitsigns.nvim',
	'ggandor/leap.nvim',
	'kylechui/nvim-surround',
	{
		'sindrets/diffview.nvim',
		requires = 'nvim-lua/plenary.nvim',
	},
	{
		'kevinhwang91/nvim-bqf',
		requires = {
			'junegunn/fzf',
			run = function()
				fn['fzf#install']()
			end
		},
		config = [[require('configs.bqf')]],
		ft = 'qf',
	},

	-- TeX
	-- 'lervag/vimtex',
	{
		'ryleelyman/latex.nvim',
		ft = 'tex',
		config = [[require('configs.latex')]],
	},
	{
		'f3fora/nvim-texlabconfig',
		run = 'go build',
		ft = 'tex',
		config = [[require('texlabconfig').setup()]]
	},

	-- Norg
	-- {
	-- 	'nvim-neorg/neorg',
	-- 	run = ':Neorg sync-parsers',
	-- 	requires = {
	-- 		'nvim-lua/plenary.nvim',
	-- 		'nvim-neorg/neorg-telescope'
	-- 	},
	-- 	config = [[require('configs.neorg')]],
	-- 	ft = 'norg'
	-- },
}

require('packer').startup({ plugins })
