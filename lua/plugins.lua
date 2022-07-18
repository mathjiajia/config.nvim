local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		install_path })
end

vim.api.nvim_create_augroup('packer_user_config', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	pattern = 'plugins.lua',
	group   = 'packer_user_config',
	desc    = 'Compile whenever plugins.lua is updated',
})

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'lewis6991/impatient.nvim'

	use {
		'monkoose/matchparen.nvim',
		config = [[require('matchparen').setup()]]
	}

	use 'rebelot/heirline.nvim'
	use {
		'rcarriga/nvim-notify',
		config = [[vim.notify = require('notify')]]
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run    = ':TSUpdate',
		config = [[require('configs.treesitter')]]
	}
	use {
		'nvim-treesitter/playground',
		opt = true,
	}
	use 'nvim-treesitter/nvim-treesitter-context'
	use {
		'lewis6991/spellsitter.nvim',
		config = [[require('spellsitter').setup()]]
	}

	use 'p00f/nvim-ts-rainbow'
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = [[require('configs.indentline')]]
	}
	use {
		'stevearc/aerial.nvim',
		config = [[require('configs.outline')]]
	}

	use {
		'hrsh7th/nvim-cmp',
		config = [[require('configs.cmp')]]
	}
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-path'
	use 'lukas-reineke/cmp-rg'
	use 'saadparwaiz1/cmp_luasnip'
	use {
		'L3MON4D3/LuaSnip',
		config = [[require('configs.luasnip')]]
	}
	use {
		'windwp/nvim-autopairs',
		config = [[require('configs.pairs')]]
	}
	use {
		'github/copilot.vim',
		opt    = true,
		config = [[require('configs.copilot')]]
	}

	use 'neovim/nvim-lspconfig'
	use {
		'jose-elias-alvarez/null-ls.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config   = [[require('lsp.null-ls')]]
	}
	use {
		'j-hui/fidget.nvim',
		config = [[require('fidget').setup()]]
	}
	use 'kosayoda/nvim-lightbulb'
	use 'folke/lua-dev.nvim'

	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'kyazdani42/nvim-web-devicons'
		},
		config = [[require('configs.telescope')]]
	}
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}
	use {
		'nvim-telescope/telescope-frecency.nvim',
		requires = 'kkharji/sqlite.lua'
	}
	use 'nvim-telescope/telescope-file-browser.nvim'
	use 'nvim-telescope/telescope-bibtex.nvim'
	use 'nvim-telescope/telescope-ui-select.nvim'

	use {
		'kyazdani42/nvim-tree.lua',
		requires = 'kyazdani42/nvim-web-devicons',
		config = [[require('configs.tree')]]
	}

	use {
		'numToStr/Comment.nvim',
		config = [[require('Comment').setup()]]
	}
	use {
		'numtostr/FTerm.nvim',
		config = [[require('configs.terminal')]]
	}
	use {
		'lewis6991/gitsigns.nvim',
		config = [[require('configs.gitsigns')]]
	}
	use {
		'ggandor/leap.nvim',
		config = [[require('leap').set_default_keymaps()]]
	}
	use {
		'kylechui/nvim-surround',
		config = [[require('nvim-surround').setup()]]
	}

	use {
		'lervag/vimtex',
		config = [[require('configs.vimtex')]]
	}
	use {
		'f3fora/nvim-texlabconfig',
		-- run = 'go build',
		tag = 'v0.1.0',
		config = [[require('texlabconfig').setup()]]
	}

	-- use {
	--     'nvim-neorg/neorg',
	--     config = [[require('configs.neorg')]]
	-- }
	-- use 'nvim-neorg/neorg-telescope'
end)
