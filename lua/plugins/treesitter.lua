return {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-context',
		'nvim-treesitter/nvim-treesitter-textobjects',
		'p00f/nvim-ts-rainbow',
	},
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.install').compilers = { '/opt/homebrew/bin/gcc-12' }
		require('nvim-treesitter.configs').setup({
			ensure_installed = {
				'bash',
				'diff',
				'fish',
				'latex',
				'markdown',
				'markdown_inline',
				'python',
				'query',
				'regex',
				'swift',
			},
			highlight = { enable = true },
			incremental_selection = { enable = true },
			indent = { enable = true },
			rainbow = { enable = true },
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						['af'] = '@function.outer',
						['if'] = '@function.inner',
						['ac'] = '@class.outer',
						['ic'] = '@class.inner',
						['ab'] = '@block.outer',
						['ib'] = '@block.inner',
						['as'] = '@statement.outer',
					}
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						[']m'] = '@function.outer',
						[']]'] = '@class.outer',
						[']}'] = '@block.outer',
					},
					goto_next_end = {
						[']M'] = '@function.outer',
						[']['] = '@class.outer',
						[']{'] = '@block.outer',
					},
					goto_previous_start = {
						['[m'] = '@function.outer',
						['[['] = '@class.outer',
						['[{'] = '@block.outer',
					},
					goto_previous_end = {
						['[M'] = '@function.outer',
						['[]'] = '@class.outer',
						['[}'] = '@block.outer',
					},
				},
			},
		})
	end,
	event = 'BufReadPost',
}
