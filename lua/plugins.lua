-- Install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local function install_packer()
	vim.fn.termopen(('git clone https://github.com/wbthomason/packer.nvim %q'):format(install_path))
end

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	install_packer()
end

local function spec(use)
	-- Packer can manage itself
	use { 'wbthomason/packer.nvim' }

	-- Common Requirements
	use { 'nvim-lua/plenary.nvim' }
	use { 'kyazdani42/nvim-web-devicons' }
	use { 'tami5/sqlite.lua', module = 'sqlite' }

	-- UI stuff
	use { -- statusline
		'~/Dev/statusline.nvim',
		event = 'BufRead',
		config = function()
			require('statusline').setup()
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
		-- event = 'VimEnter',
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
		-- event = 'BufRead',
		run = ':TSUpdate',
		requires = {
			{ 'nvim-treesitter/playground', cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' } },
			{ 'p00f/nvim-ts-rainbow', event = 'BufRead' },
		},
		config = function()
			require('configs.treesitter')
		end,
	}
	use {
		'stevearc/aerial.nvim',
		module = 'aerial',
		cmd = 'AerialToggle',
		config = function()
			require('configs.aerial')
		end,
	}

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
			{ 'onsails/lspkind-nvim', module = 'lspkind' },
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
		ft = 'norg',
		config = function()
			require('configs.neorg')
		end,
	}
	use { 'nvim-neorg/neorg-telescope', opt = true }

	-- Telescope nonsense
	use {
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		keys = {
			{ 'n', '<leader>f' },
			{ 'n', '<leader><space>' },
		},
		requires = {
			{ 'nvim-telescope/telescope-file-browser.nvim', after = 'telescope.nvim' },
			{ 'nvim-telescope/telescope-frecency.nvim', after = 'telescope.nvim' },
			-- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim' },
			{ 'natecraddock/telescope-zf-native.nvim', opt = true },
			{ 'nvim-telescope/telescope-project.nvim', after = 'telescope.nvim' },
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
			{ 'v', 'gb' },
			{ 'v', 'gc' },
		},
		config = function()
			require('Comment').setup()
		end,
	}
	use { -- Delimiters
		'ZhiyuanLck/smart-pairs',
		event = 'InsertEnter',
		config = function()
			-- require('pairs'):setup()
			require('configs.pairs')
		end,
	}
	use { -- Surrounding
		'ur4ltz/surround.nvim',
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
	use { -- Search Panel
		'windwp/nvim-spectre',
		keys = { { 'n', '<leader>r' } },
		config = function()
			require('configs.spectre')
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
