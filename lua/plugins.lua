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

	use {
		'rcarriga/nvim-notify',
		config = [[require('notify').setup() vim.notify = require('notify')]],
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
		'stevearc/aerial.nvim',
		config = [[require('configs.outline')]],
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('configs.telescope')]],
	}
	use {
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			run = 'make',
		},
		{
			'nvim-telescope/telescope-frecency.nvim',
			requires = 'tami5/sqlite.lua',
		},
		{ 'nvim-telescope/telescope-file-browser.nvim' },
		{ 'nvim-telescope/telescope-ui-select.nvim' },
	}
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v1.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		config = [[require('configs.tree')]],
	}
	-- use {
	-- 	'kyazdani42/nvim-tree.lua',
	-- 	requires = 'kyazdani42/nvim-web-devicons',
	-- 	config = [[require('configs.nvimtree')]],
	-- }

	use {
		'neovim/nvim-lspconfig',
		config = [[require('lsp')]],
	}
	use {
		{
			'jose-elias-alvarez/null-ls.nvim',
			requires = 'nvim-lua/plenary.nvim',
			config = [[require('lsp.null-ls')]],
		},
		{
			'j-hui/fidget.nvim',
			config = [[require('fidget').setup { text = { spinner = 'line' }, window = { relative = 'editor' } }]],
		},
		{ 'kosayoda/nvim-lightbulb' },
		{ 'folke/lua-dev.nvim' },
	}

	use {
		'hrsh7th/nvim-cmp',
		config = [[require('configs.cmp')]],
	}
	use {
		{ 'hrsh7th/cmp-buffer' },
		{ 'hrsh7th/cmp-cmdline' },
		{ 'hrsh7th/cmp-nvim-lsp' },
		{ 'hrsh7th/cmp-path' },
		{ 'lukas-reineke/cmp-rg' },
		{ 'saadparwaiz1/cmp_luasnip' },
	}
	use {
		'L3MON4D3/LuaSnip',
		config = [[require('configs.luasnip')]],
	}
	use {
		'ZhiyuanLck/smart-pairs',
		config = [[require('configs.pairs')]],
	}
	use {
		'github/copilot.vim',
		opt = true,
		config = [[require('configs.copilot')]],
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('configs.gitsigns')]],
	}
	use {
		'numToStr/Comment.nvim',
		config = [[require('Comment').setup({ padding = function () return vim.bo.filetype ~= 'norg' end })]],
	}
	use {
		'Shatur/neovim-session-manager',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('configs.session')]],
	}
	use {
		'~/Dev/surround.nvim',
		config = [[require('surround').setup()]],
	}
	use {
		'phaazon/hop.nvim',
		config = [[require('configs.hop')]],
	}
	use {
		'windwp/nvim-spectre',
		config = [[require('configs.search')]],
	}
	use {
		'numtostr/FTerm.nvim',
		config = [[require('configs.terminal')]],
	}

	use {
		'lervag/vimtex',
		config = [[require('configs.latex')]],
	}
	use {
		{
			'nvim-neorg/neorg',
			config = [[require('configs.neorg')]],
		},
		{ 'nvim-neorg/neorg-telescope' },
	}

	use {
		'dstein64/vim-startuptime',
		config = [[vim.g.startuptime_tries = 10]],
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
				return require('packer.util').float { border = 'rounded' }
			end,
			prompt_border = 'rounded',
		},
	},
}
