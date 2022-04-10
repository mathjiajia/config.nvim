local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
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

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'lewis6991/impatient.nvim'

	use {
		'monkoose/matchparen.nvim',
		config = [[require('matchparen').setup()]],
	}
	use {
		'rcarriga/nvim-notify',
		config = [[vim.notify = require('notify')]],
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = [[require('configs.treesitter')]],
	}
	-- use('nvim-treesitter/nvim-treesitter-textobjects')
	use 'nvim-treesitter/playground'
	use 'p00f/nvim-ts-rainbow'
	-- use ('lewis6991/nvim-treesitter-context')
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = [[require('configs.indentline')]],
	}
	-- use {
	-- 	'lewis6991/spellsitter.nvim',
	-- 	config = [[require('spellsitter').setup()]],
	-- }
	use {
		'stevearc/aerial.nvim',
		config = [[require('configs.outline')]],
	}
	use {
		'SmiteshP/nvim-gps',
		requires = 'nvim-treesitter/nvim-treesitter',
		config = [[require('nvim-gps').setup()]],
	}

	use {
		'hrsh7th/nvim-cmp',
		config = [[require('configs.cmp')]],
	}
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-path'
	use 'lukas-reineke/cmp-rg'
	use 'saadparwaiz1/cmp_luasnip'
	use {
		'L3MON4D3/LuaSnip',
		config = [[require('configs.luasnip')]],
	}
	-- use {
	-- 	'ZhiyuanLck/smart-pairs',
	-- 	config = [[require('configs.pairs')]],
	-- }
	use {
		'windwp/nvim-autopairs',
		config = [[require('configs.pairs')]],
	}
	use {
		'github/copilot.vim',
		opt = true,
		config = [[require('configs.copilot')]],
	}

	use 'neovim/nvim-lspconfig'
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('lsp.null-ls')]],
	}
	use {
		'j-hui/fidget.nvim',
		config = [[require('fidget').setup { text = { spinner = 'line' }, window = { relative = 'editor' } }]],
	}
	use 'kosayoda/nvim-lightbulb'
	use 'folke/lua-dev.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = [[require('configs.telescope')]],
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make',
	}
	use {
		'nvim-telescope/telescope-frecency.nvim',
		requires = 'tami5/sqlite.lua',
	}
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-bibtex.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'

	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'main',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons',
			'MunifTanjim/nui.nvim',
		},
		config = [[require('configs.tree')]],
	}

	use {
		'lewis6991/gitsigns.nvim',
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
	use '~/Dev/surround.nvim'
	use 'ggandor/lightspeed.nvim'
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
		'f3fora/nvim-texlabconfig',
		config = [[require('texlabconfig').setup()]],
	}

	use {
		'nvim-neorg/neorg',
		config = [[require('configs.neorg')]],
	}
	use 'nvim-neorg/neorg-telescope'

	-- use {
	-- 	'dstein64/vim-startuptime',
	-- 	config = [[vim.g.startuptime_tries = 10]],
	-- }
end)
