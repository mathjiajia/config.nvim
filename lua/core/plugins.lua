-- Install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.termopen(('git clone https://github.com/wbthomason/packer.nvim %q'):format(install_path))
end

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

vim.api.nvim_create_augroup { name = 'packer_user_config' }
vim.api.nvim_create_autocmd {
	group = 'packer_user_config',
	event = 'BufWritePost',
	pattern = 'plugins.lua',
	callback = function()
		vim.cmd([[source <afile> | PackerCompile]])
	end,
}

local function spec(use)
	use { 'wbthomason/packer.nvim', opt = true }
	use { 'lewis6991/impatient.nvim' }

	use {
		'rcarriga/nvim-notify',
		config = function()
			require('configs.notify')
		end,
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {},
		config = function()
			require('configs.treesitter')
		end,
	}
	use { 'nvim-treesitter/playground', cmd = { 'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor' } }
	use { 'p00f/nvim-ts-rainbow' }
	use {
		'stevearc/aerial.nvim',
		module = 'aerial',
		cmd = 'AerialToggle',
		config = function()
			require('configs.aerial')
		end,
	}

	-- LSP Stuff
	use {
		'neovim/nvim-lspconfig',
		config = function()
			require('lsp')
		end,
	}
	use {
		{ 'folke/lua-dev.nvim', module = 'lua-dev' },
		{ 'kosayoda/nvim-lightbulb', module = 'nvim-lightbulb' },
		{
			'jose-elias-alvarez/null-ls.nvim',
			ft = { 'fish', 'html', 'json', 'lua', 'markdown', 'yaml' },
			config = function()
				require('lsp.null-ls')
			end,
		},
		{
			'j-hui/fidget.nvim',
			after = 'nvim-lspconfig',
			config = function()
				require('fidget').setup { text = { spinner = 'line' } }
			end,
		},
	}

	-- Autocompletion
	use {
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		config = function()
			require('configs.cmp')
		end,
	}
	use {
		{ 'onsails/lspkind-nvim', module = 'lspkind' },
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
		config = function()
			require('configs.luasnip')
		end,
	}
	use {
		'github/copilot.vim',
		cmd = 'Copilot',
		config = function()
			require('configs.copilot')
		end,
	}

	-- Language Stuff
	use {
		'lervag/vimtex',
		ft = 'tex',
		config = function()
			require('configs.vimtex')
		end,
	}
	use {
		{
			'nvim-neorg/neorg',
			ft = 'norg',
			config = function()
				require('configs.neorg')
			end,
		},
		{ 'nvim-neorg/neorg-telescope', opt = true },
	}

	-- Telescope nonsense
	use {
		'nvim-telescope/telescope.nvim',
		cmd = 'Telescope',
		module = 'telescope',
		keys = {
			{ 'n', '<leader>f' },
			{ 'n', '<leader><space>' },
		},
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('configs.telescope')
		end,
	}
	use {
		{ 'nvim-telescope/telescope-file-browser.nvim', opt = true },
		{
			'nvim-telescope/telescope-frecency.nvim',
			opt = true,
			requires = { 'tami5/sqlite.lua', opt = true },
		},
		{ 'natecraddock/telescope-zf-native.nvim', opt = true },
		{ 'nvim-telescope/telescope-project.nvim', opt = true },
	}

	-- File Explorer
	use {
		'kyazdani42/nvim-tree.lua',
		keys = { { 'n', '<M-t>' } },
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			require('configs.nvimtree')
		end,
	}

	-- Editors
	use { -- Git Integration
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
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
	use { -- indentline
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require('configs.indentline')
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
			vim.g.startuptime_tries = 20
		end,
	}
end

require('packer').startup {
	spec,
	config = {
		profile = {
			enable = true,
			threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},
		display = {
			open_fn = function()
				return require('packer.util').float { border = 'single' }
			end,
			prompt_border = 'single',
		},
	},
}
