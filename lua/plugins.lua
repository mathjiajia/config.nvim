local install_path = vim.fn.stdpath 'data' .. '/site/pack/paqs/start/paq-nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.termopen(('git clone --depth=1 https://github.com/savq/paq-nvim.git %q'):format(install_path))
end

require 'paq' {
	'savq/paq-nvim'; -- Let Paq manage itself
	'lewis6991/impatient.nvim';

	-- required
	'nvim-lua/plenary.nvim';
	'kyazdani42/nvim-web-devicons';
	'kkharji/sqlite.lua';

	-- builtin enhancement/fix
	'monkoose/matchparen.nvim';
	'antoinemadec/FixCursorHold.nvim';

	-- UI
	'rcarriga/nvim-notify';
	'rebelot/heirline.nvim';

	-- TreeSitter
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' };
	{ 'nvim-treesitter/playground', opt = true };
	'p00f/nvim-ts-rainbow';
	'lukas-reineke/indent-blankline.nvim';

	-- LSP
	'neovim/nvim-lspconfig';
	'jose-elias-alvarez/null-ls.nvim';
	'j-hui/fidget.nvim';
	'kosayoda/nvim-lightbulb';
	'folke/lua-dev.nvim';
	'stevearc/aerial.nvim';

	-- Autocompletion
	'hrsh7th/nvim-cmp';

	'hrsh7th/cmp-buffer';
	'hrsh7th/cmp-cmdline';
	'hrsh7th/cmp-nvim-lsp';
	'hrsh7th/cmp-path';
	'lukas-reineke/cmp-rg';
	'saadparwaiz1/cmp_luasnip';
	'L3MON4D3/LuaSnip';

	'windwp/nvim-autopairs';
	{ 'github/copilot.vim', opt = true };

	-- Telescope
	'nvim-telescope/telescope.nvim';
	{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' };
	'nvim-telescope/telescope-frecency.nvim';
	'nvim-telescope/telescope-file-browser.nvim';
	'nvim-telescope/telescope-bibtex.nvim';
	'nvim-telescope/telescope-ui-select.nvim';

	-- File Explorer
	'kyazdani42/nvim-tree.lua';

	-- Utilities
	'numToStr/Comment.nvim';
	'numtostr/FTerm.nvim';
	'lewis6991/gitsigns.nvim';
	'ggandor/leap.nvim';
	'Shatur/neovim-session-manager';
	'kylechui/nvim-surround';

	-- LaTeX
	'lervag/vimtex';
	{ 'f3fora/nvim-texlabconfig', run = 'go build' };

	-- Neorg
	'nvim-neorg/neorg';
	'nvim-neorg/neorg-telescope';
}
