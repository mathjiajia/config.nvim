local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.termopen(('git clone https://github.com/wbthomason/packer.nvim %q'):format(install_path))
end

vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	pattern = 'plugins.lua',
	group = 'packer_user_config',
	desc = 'Compile whenever plugins.lua is updated',
})

local function spec(use)
	use { 'wbthomason/packer.nvim' }
	use { 'lewis6991/impatient.nvim' }

	use { 'kyazdani42/nvim-web-devicons', config = [[require('configs.devicons')]] }
	use { 'tami5/sqlite.lua', module = 'sqlite' }
	use { 'rcarriga/nvim-notify', config = [[require('notify').setup {} vim.notify = require('notify')]] }

	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = [[require('configs.treesitter')]] }
	use {
		{ 'nvim-treesitter/playground', module = 'nvim-treesitter-playground' },
		{ 'p00f/nvim-ts-rainbow' },
		{ 'lukas-reineke/indent-blankline.nvim', config = [[require('configs.indentline')]] },
	}
	use { 'simrat39/symbols-outline.nvim', module = 'symbols-outline', config = [[require('configs.outline')]] }

	use {
		'nvim-telescope/telescope.nvim',
		-- cmd = 'Telescope',
		-- module = 'telescope',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('configs.telescope')]],
	}
	use {
		{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		{ 'nvim-telescope/telescope-file-browser.nvim' },
		{ 'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sqlite.lua' },
		{ 'nvim-telescope/telescope-project.nvim' },
	}

	use {
		'kyazdani42/nvim-tree.lua',
		module = 'nvim-tree',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = [[require('configs.nvimtree')]],
	}

	use { 'neovim/nvim-lspconfig', config = [[require('lsp')]] }
	use {
		{ 'folke/lua-dev.nvim', module = 'lua-dev' },
		{ 'kosayoda/nvim-lightbulb', module = 'nvim-lightbulb' },
		{
			'jose-elias-alvarez/null-ls.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = [[require('lsp.null-ls')]],
		},
		{ 'j-hui/fidget.nvim', config = [[require('fidget').setup { text = { spinner = 'line' } }]] },
	}

	use { 'hrsh7th/nvim-cmp', event = { 'CmdlineEnter', 'InsertEnter' }, config = [[require('configs.cmp')]] }
	use {
		{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
		{ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' },
		{ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
	}
	use { 'L3MON4D3/LuaSnip', after = 'nvim-cmp', config = [[require('configs.luasnip')]] }
	use { 'ZhiyuanLck/smart-pairs', event = 'InsertEnter', config = [[require('configs.pairs')]] }
	use { 'github/copilot.vim', opt = true, config = [[require('configs.copilot')]] }

	use { 'lewis6991/gitsigns.nvim', requires = 'nvim-lua/plenary.nvim', config = [[require('configs.gitsigns')]] }
	use { 'numToStr/Comment.nvim', config = [[require('Comment').setup()]] }
	use {
		'ur4ltz/surround.nvim',
		keys = { { 'n', 'sa' }, { 'n', 'sr' }, { 'n', 'sd' }, { 'x', 's' } },
		config = [[require('configs.surround')]],
	}
	use { 'phaazon/hop.nvim', config = [[require('hop').setup()]] }
	use { 'windwp/nvim-spectre', module = 'spectre' }
	use { 'numtostr/FTerm.nvim', module = 'FTerm' }

	use { 'lervag/vimtex', ft = 'tex', config = [[require('configs.latex')]] }
	use {
		{ 'nvim-neorg/neorg', ft = 'norg', config = [[require('configs.neorg')]] },
		{ 'nvim-neorg/neorg-telescope', opt = true },
	}

	-- use { 'dstein64/vim-startuptime', cmd = 'StartupTime', config = [[vim.g.startuptime_tries = 3]] }
end

require('packer').startup {
	spec,
	config = {
		display = {
			open_fn = function()
				return require('packer.util').float { border = 'single' }
			end,
			prompt_border = 'single',
		},
	},
}
