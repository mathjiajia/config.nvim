local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
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
	desc    = 'Compile whenever plugins.lua is updated',
})

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'lewis6991/impatient.nvim'

	use 'monkoose/matchparen.nvim'

	-- UI
	-- use 'vigoux/notifier.nvim'
	use 'rebelot/heirline.nvim'
	use 'lukas-reineke/indent-blankline.nvim'
	use {
		'folke/noice.nvim',
		requires = {
			'MunifTanjim/nui.nvim',
			'rcarriga/nvim-notify',
		}
	}

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'nvim-treesitter/playground', opt = true }
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'p00f/nvim-ts-rainbow'

	-- Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-path'
	use 'lukas-reineke/cmp-rg'
	use 'saadparwaiz1/cmp_luasnip'

	use 'L3MON4D3/LuaSnip'
	use 'windwp/nvim-autopairs'
	use { 'github/copilot.vim', opt = true }

	-- LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use { 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' }

	use 'stevearc/aerial.nvim'
	use 'kosayoda/nvim-lightbulb'
	use 'folke/neodev.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons'
		}
	}

	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use { 'nvim-telescope/telescope-frecency.nvim', requires = 'kkharji/sqlite.lua' }
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-bibtex.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'

	-- File Exploer
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim'
		}
	}

	-- Utils
	use 'numtostr/FTerm.nvim'
	use 'numToStr/Comment.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'ggandor/leap.nvim'
	use 'kylechui/nvim-surround'

	-- Tex
	use 'lervag/vimtex'
	use { 'f3fora/nvim-texlabconfig', run = 'go build' }

	-- Norg
	-- use 'nvim-neorg/neorg'
	-- use 'nvim-neorg/neorg-telescope'

	-- use 'dstein64/vim-startuptime'
end)
