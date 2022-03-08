local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.termopen(('git clone https://github.com/wbthomason/packer.nvim %q'):format(install_path))
end

vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	pattern = '~/.config/nvim/lua/core/plugins.lua',
	group = 'packer_user_config',
	desc = 'Compile whenever plugins.lua is updated',
})

local function spec(use)
	use { 'wbthomason/packer.nvim' }
	use { 'lewis6991/impatient.nvim' }
	use { 'nvim-lua/plenary.nvim' }

	use {
		'rcarriga/nvim-notify',
		config = [[
			require('notify').setup {}
			vim.notify = require('notify')
		]],
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = [[require('configs.treesitter')]],
	}
	use {
		{ 'nvim-treesitter/playground' },
		{ 'p00f/nvim-ts-rainbow' },
		{
			'lukas-reineke/indent-blankline.nvim',
			config = [[require('configs.indentline')]],
		},
	}

	use {
		'simrat39/symbols-outline.nvim',
		opt = true,
		config = [[require('configs.outline')]],
	}

	use {
		'neovim/nvim-lspconfig',
		config = [[require('lsp')]],
	}
	use {
		{ 'folke/lua-dev.nvim', module = 'lua-dev' },
		{ 'kosayoda/nvim-lightbulb', module = 'nvim-lightbulb' },
		{
			'jose-elias-alvarez/null-ls.nvim',
			opt = true,
			requires = { 'nvim-lua/plenary.nvim' },
			config = [[require('lsp.null-ls')]],
		},
		{
			'j-hui/fidget.nvim',
			config = [[require('fidget').setup { text = { spinner = 'line' } }]],
		},
	}

	use {
		'hrsh7th/nvim-cmp',
		opt = true,
		config = [[require('configs.cmp')]],
	}
	use {
		{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
		{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
		{ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' },
		{ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
	}
	use {
		'L3MON4D3/LuaSnip',
		module = 'luasnip',
		config = [[require('configs.luasnip')]],
	}
	use {
		'ZhiyuanLck/smart-pairs',
		opt = true,
		config = [[require('configs.pairs')]],
	}
	use {
		'github/copilot.vim',
		cmd = 'Copilot',
		config = [[require('configs.copilot')]],
	}

	use {
		'lervag/vimtex',
		opt = true,
		config = [[require('configs.vimtex')]],
	}
	use {
		{
			'nvim-neorg/neorg',
			opt = true,
			config = [[require('configs.neorg')]],
		},
		{ 'nvim-neorg/neorg-telescope', opt = true },
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = [[require('configs.telescope')]],
	}
	use {
		{ 'nvim-telescope/telescope-file-browser.nvim' },
		{ 'nvim-telescope/telescope-frecency.nvim', requires = 'tami5/sqlite.lua' },
		{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		{ 'nvim-telescope/telescope-project.nvim' },
	}

	use {
		'kyazdani42/nvim-tree.lua',
		key = { { 'n', '<M-t>' } },
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = [[require('configs.nvimtree')]],
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = [[require('configs.gitsigns')]],
	}
	use {
		'numToStr/Comment.nvim',
		config = [[require('Comment').setup()]],
	}

	use {
		'ur4ltz/surround.nvim',
		config = [[require('configs.surround')]],
	}
	use {
		'phaazon/hop.nvim',
		config = [[require('configs.hop')]],
	}
	use {
		'windwp/nvim-spectre',
		config = [[require('configs.spectre')]],
	}
	use {
		'Shatur/neovim-session-manager',
		config = [[require('configs.session')]],
	}

	use {
		'numtostr/FTerm.nvim',
		opt = true,
		config = [[require('configs.terminal')]],
	}
	use {
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		config = [[vim.g.startuptime_tries = 20]],
	}
end

require('packer').startup {
	spec,
	config = {
		profile = {
			enable = true,
			threshold = 1,
		},
		display = {
			open_fn = function()
				return require('packer.util').float { border = 'single' }
			end,
			prompt_border = 'single',
		},
	},
}
