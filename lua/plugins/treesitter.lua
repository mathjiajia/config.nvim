local M = {
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		-- { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },
		'nvim-treesitter/nvim-treesitter-textobjects',
		'nvim-treesitter/nvim-treesitter-context',
		'p00f/nvim-ts-rainbow',
	},
	event = 'BufReadPost',
}

function M.build()
	pcall(require('nvim-treesitter.install').update({ with_sync = true }))
end

function M.config()
	local langs = {
		'bash',
		-- 'comment',
		'diff',
		'fish',
		'latex',
		'markdown',
		'markdown_inline',
		'norg',
		'python',
		'query',
		'regex',
		'swift',
	}

	require('nvim-treesitter.install').compilers = { '/opt/homebrew/bin/gcc-12' }

	require('nvim-treesitter.configs').setup({
		ensure_installed = langs,
		highlight = { enable = true },
		incremental_selection = { enable = true },
		indent = { enable = true },
		-- pairs = { enable = true },
		rainbow = { enable = true },
		-- playground = { enable = true },
		-- query_linter = { enable = true },
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					['ab'] = '@block.outer',
					['ib'] = '@block.inner',
					['ac'] = '@class.outer',
					['ic'] = '@class.inner',
					['af'] = '@function.outer',
					['if'] = '@function.inner',
					['as'] = '@statement.outer',
				}
			},
			swap = {
				enable = true,
				swap_next = {
					['<leader>a'] = '@parameter.inner',
				},
				swap_previous = {
					['<leader>A'] = '@parameter.inner',
				},
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
			lsp_interop = {
				enable = true,
				border = 'none',
				peek_definition_code = {
					['<leader>df'] = '@function.outer',
					['<leader>dc'] = '@class.outer',
					['<leader>db'] = '@block.outer',
				}
			}
		},
	})
end

return M
