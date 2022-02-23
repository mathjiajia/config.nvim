-- Install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

local function install_packer()
	vim.fn.termopen(('git clone https://github.com/wbthomason/packer.nvim %q'):format(install_path))
end

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	install_packer()
end

vim.cmd([[packadd packer.nvim]])

local function spec(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim', opt = true }

	-- Common Requirements
	use { 'nvim-lua/plenary.nvim', module = 'plenary' }
	use {
		'kyazdani42/nvim-web-devicons',
		module = 'nvim-web-devicons',
		config = function()
			require('configs.devicons')
		end,
	}

	-- UI stuff
	use {
		'~/Documents/alpha-nvim', -- goolord
		config = function()
			require('configs.alpha')
		end,
	}
	use { -- statusline
		'feline-nvim/feline.nvim',
		event = 'BufRead',
		config = function()
			-- require('feline').setup()
			require('configs.feline')
		end,
	}
	use { -- tabline
		'jose-elias-alvarez/buftabline.nvim',
		event = 'BufRead',
		config = function()
			require('configs.buftabline')
		end,
	}
	use { -- notifications
		'rcarriga/nvim-notify',
		event = 'VimEnter',
		config = function()
			require('configs.notify')
		end,
	}
	use { -- indentline
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufRead',
		config = function()
			require('configs.indentline')
		end,
	}

	-- Syntax highlighter
	use {
		'nvim-treesitter/nvim-treesitter',
		event = 'BufRead',
		run = ':TSUpdate',
		requires = {
			{ 'nvim-treesitter/playground', cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' } },
			{ 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' },
			-- { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
		},
		config = function()
			require('configs.treesitter')
		end,
	}
	use {
		'stevearc/aerial.nvim',
		module = 'aerial',
		config = function()
			require('configs.aerial')
		end,
	}
	-- use { -- spellcheck
	-- 	'lewis6991/spellsitter.nvim',
	-- 	event = 'BufRead',
	-- 	config = function()
	-- 		require('spellsitter').setup()
	-- 	end,
	-- }

	-- LSP Stuff
	use { -- Collection of configurations for built-in LSP client
		'neovim/nvim-lspconfig',
		event = 'BufReadPre',
		requires = {
			{ 'folke/lua-dev.nvim', module = 'lua-dev' }, -- Lua for neovim
			{ 'kosayoda/nvim-lightbulb', module = 'nvim-lightbulb' },
		},
		config = function()
			require('lsp')
		end,
	}
	use {
		'jose-elias-alvarez/null-ls.nvim',
		ft = { 'fish', 'html', 'json', 'lua', 'markdown', 'yaml' },
		config = function()
			require('lsp.null-ls')
		end,
	}
	use { -- nvim-lsp progress
		'j-hui/fidget.nvim',
		after = 'nvim-lspconfig',
		config = function()
			require('configs.fidget')
		end,
	}

	-- Autocompletion
	use {
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		requires = {
			{ 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
			{ 'hrsh7th/cmp-path', after = 'nvim-cmp' },
			{ 'lukas-reineke/cmp-rg', after = 'nvim-cmp' },
			{ 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' }, -- Snippets source for nvim-cmp
		},
		config = function()
			require('configs.cmp')
		end,
	}
	use { -- Snippets Engine
		'L3MON4D3/LuaSnip',
		module = 'luasnip',
		config = function()
			require('configs.luasnip')
		end,
	}
	use { -- AI Tool
		'github/copilot.vim',
		cmd = 'Copilot',
		config = function()
			require('configs.copilot')
		end,
	}

	-- Language Stuff
	use { -- LaTeX
		'lervag/vimtex',
		ft = 'tex',
		config = function()
			require('configs.vimtex')
		end,
	}
	use { -- Note and Organizing
		'nvim-neorg/neorg',
		opt = true,
		ft = 'norg',
		requires = { 'nvim-neorg/neorg-telescope', opt = true },
		config = function()
			require('configs.neorg')
		end,
	}

	-- Telescope nonsense
	use {
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		keys = { { 'n', '<leader>f' } },
		requires = {
			{ 'nvim-telescope/telescope-file-browser.nvim', after = 'telescope.nvim' },
			{
				'nvim-telescope/telescope-frecency.nvim',
				opt = true,
				after = 'telescope.nvim',
				requires = { 'tami5/sqlite.lua', module = 'sqlite', opt = true },
			},
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim' },
			{ 'nvim-telescope/telescope-project.nvim', after = 'telescope.nvim' },
			-- { 'nvim-telescope/telescope-bibtex.nvim', after = 'telescope.nvim' },
		},
		config = function()
			require('configs.telescope')
		end,
	}

	-- File Explorer
	use {
		'kyazdani42/nvim-tree.lua',
		keys = { { 'n', '<M-t>' } },
		config = function()
			require('configs.nvimtree')
		end,
	}

	-- Editors
	use { -- Git Integration
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		config = function()
			require('configs.gitsigns')
		end,
	}
	use { -- Comment/Uncomment
		'numToStr/Comment.nvim',
		keys = {
			{ 'n', 'gb' },
			{ 'n', 'gc' },
			{ 'n', 'g<' },
			{ 'n', 'g>' },
			{ 'v', 'gb' },
			{ 'v', 'gc' },
			{ 'v', 'g<' },
			{ 'v', 'g>' },
		},
		config = function()
			require('Comment').setup()
		end,
	}
	use { -- Delimiters
		'ZhiyuanLck/smart-pairs',
		event = 'InsertEnter',
		config = function()
			require('configs.pairs')
		end,
	}
	use { -- Surrounding
		'~/Documents/surround.nvim',
		keys = {
			{ 'n', 'sa' },
			{ 'n', 'sr' },
			{ 'n', 'sd' },
			{ 'x', 's' },
		},
		config = function()
			require('configs.surround')
		end,
	}
	-- use { -- Search Panel
	-- 	'windwp/nvim-spectre',
	-- 	keys = { { 'n', '<leader>r' } },
	-- 	config = function()
	-- 		require('configs.spectre')
	-- 	end,
	-- }
	use { -- Motions
		'phaazon/hop.nvim',
		keys = {
			{ 'n', '<leader>h' },
			{ 'x', '<leader>h' },
			{ 'o', '<leader>h' },
		},
		config = function()
			require('configs.hop')
		end,
	}
	use { -- Sessions Management
		'Shatur/neovim-session-manager',
		keys = { { 'n', '<leader>s' } },
		config = function()
			require('configs.session')
		end,
	}

	-- Terminal Emulator
	use { --floating terminal
		'numtostr/FTerm.nvim',
		module = 'FTerm',
		keys = {
			{ 'n', '<M-i>' },
			{ 'n', '<M-g>' },
		},
		config = function()
			require('configs.fterm')
		end,
	}

	use {
		'dstein64/vim-startuptime',
		cmd = 'StartupTime',
		config = function()
			vim.g.startuptime_tries = 10
		end,
	}
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
