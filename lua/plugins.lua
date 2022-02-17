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

	use { 'nvim-lua/plenary.nvim', module = 'plenary' }
	use { 'tami5/sqlite.lua', module = 'sqlite' }
	use {
		'kyazdani42/nvim-web-devicons',
		module = 'nvim-web-devicons',
		config = function()
			require('configs.devicons')
		end,
	}

	-- UI stuff
	use { -- dashboard
		'goolord/alpha-nvim',
		config = function()
			require('configs.alpha')
		end,
	}
	use { -- notifications
		'rcarriga/nvim-notify',
		event = 'WinEnter',
		config = function()
			require('configs.notify')
		end,
	}
	use { -- statusline
		'nvim-lualine/lualine.nvim',
		event = 'BufRead',
		config = function()
			require('configs.lualine')
		end,
	}
	use { -- tabline
		'akinsho/nvim-bufferline.lua',
		event = 'BufRead',
		config = function()
			require('configs.bufferline')
		end,
	}
	use { -- indentline
		'lukas-reineke/indent-blankline.nvim',
		event = 'BufRead',
		config = function()
			require('configs.indentline')
		end,
	}

	-- File explorer
	use {
		'kyazdani42/nvim-tree.lua',
		module = 'nvim-tree',
		config = function()
			require('configs.nvimtree')
		end,
	}

	-- Telescope nonsense
	use {
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		config = function()
			require('configs.telescope')
		end,
	}
	use { 'nvim-telescope/telescope-file-browser.nvim', after = 'telescope.nvim' }
	use { 'nvim-telescope/telescope-frecency.nvim', after = 'telescope.nvim' }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', after = 'telescope.nvim' }
	use { 'nvim-telescope/telescope-project.nvim', after = 'telescope.nvim' }
	-- use { 'nvim-telescope/telescope-bibtex.nvim', after = 'telescope.nvim' }

	-- session management
	use {
		'Shatur/neovim-session-manager',
		module = 'session_manager.commands',
		config = function()
			require('configs.session')
		end,
	}

	-- Treesitter for better syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		event = 'BufRead',
		run = ':TSUpdate',
		config = function()
			require('configs.treesitter')
		end,
	}
	use { 'nvim-treesitter/playground', after = 'nvim-treesitter' }
	use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
	-- use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' }
	use {
		'stevearc/aerial.nvim',
		module = 'aerial',
		config = function()
			require('configs.aerial')
		end,
	}
	-- use {
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
		config = function()
			require('lsp')
		end,
	}
	use { 'jose-elias-alvarez/null-ls.nvim', module = 'null-ls' }
	use { 'kosayoda/nvim-lightbulb', module = 'nvim-lightbulb' }
	use {
		'j-hui/fidget.nvim',
		event = 'BufRead',
		config = function()
			require('configs.fidget')
		end,
	}

	-- Autocomplete engine
	use {
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		config = function()
			require('configs.cmp')
		end,
	}
	use { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' }
	use { 'hrsh7th/cmp-path', after = 'nvim-cmp' }
	use { 'lukas-reineke/cmp-rg', after = 'nvim-cmp' }
	use { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' } -- Snippets source for nvim-cmp
	use { -- Snippets plugin
		'L3MON4D3/LuaSnip',
		module = 'luasnip',
		config = function()
			require('configs.luasnip')
		end,
	}
	use {
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		config = function()
			require('configs.autopairs')
		end,
	}
	use {
		'github/copilot.vim',
		cmd = 'Copilot',
		config = function()
			require('configs.copilot')
		end,
	}

	-- Language stuff
	use { 'folke/lua-dev.nvim', module = 'lua-dev' }
	use {
		'lervag/vimtex',
		ft = 'tex',
		config = function()
			require('configs.vimtex')
		end,
	}
	use {
		'nvim-neorg/neorg',
		ft = 'norg',
		config = function()
			require('configs.neorg')
		end,
	}
	use { 'nvim-neorg/neorg-telescope', ft = 'norg' }

	-- Editors
	use {
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
	use {
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

	-- Git integration
	use {
		'lewis6991/gitsigns.nvim',
		event = 'BufRead',
		config = function()
			require('configs.gitsigns')
		end,
	}

	-- Terminal
	use {
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

	-- search/motions
	use {
		'phaazon/hop.nvim',
		module = 'hop',
		config = function()
			require('configs.hop')
		end,
	}
	use {
		'kevinhwang91/nvim-hlslens',
		keys = { { 'n', '/' } },
		config = function()
			require('configs.hlslens')
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
