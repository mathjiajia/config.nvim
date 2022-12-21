local M = {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'lukas-reineke/cmp-rg',
		'saadparwaiz1/cmp_luasnip',
	},
	event = 'VeryLazy',
}

M.config = function()
	local cmp_kinds = {
		Text          = '',
		Method        = '',
		Function      = '',
		Constructor   = '',
		Field         = '',
		Variable      = '',
		Class         = '',
		Interface     = '',
		Module        = '',
		Property      = '',
		Unit          = '',
		Value         = '',
		Enum          = '',
		Keyword       = '',
		Snippet       = '',
		Color         = '',
		File          = '',
		Reference     = '',
		Folder        = '',
		EnumMember    = '',
		Constant      = '',
		Struct        = '',
		Event         = '',
		Operator      = '',
		TypeParameter = '',
	}

	local cmp = require('cmp')

	cmp.setup({
		mapping = cmp.mapping.preset.insert({
			['<C-d>']     = cmp.mapping.scroll_docs(-4),
			['<C-f>']     = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete({}),
			['<C-y>']     = cmp.mapping.confirm { select = true }
		}),
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end
		},
		formatting = {
			fields = { 'kind', 'abbr', 'menu' },
			format = function(entry, vim_item)
				vim_item.kind = cmp_kinds[vim_item.kind]
				vim_item.menu = ({
					buffer   = '[Buf]',
					cmdline  = '[Cmd]',
					-- copilot  = '[Cop]',
					luasnip  = '[Snip]',
					nvim_lsp = '[LSP]',
					-- neorg    = '[Norg]',
					path     = '[Path]',
					rg       = '[RG]',
				})[entry.source.name]
				return vim_item
			end
		},
		matching = { disallow_prefix_unmatching = true },
		sources = {
			{ name = 'nvim_lsp', max_item_count = 10 },
			{ name = 'luasnip', max_item_count = 10, option = { show_autosnippets = true } },
			{ name = 'path', keyword_length = 4, max_item_count = 10 },
			-- { name = 'neorg', max_item_count = 10 },
			{ name = 'buffer', keyword_length = 3, max_item_count = 10 },
			{ name = 'copilot', max_item_count = 3 },
			{ name = 'rg', keyword_length = 4, max_item_count = 10 }
		},
		window = {
			completion = {
				col_offset = -2,
				side_padding = 1,
			}
		}
	})

	cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = { { name = 'buffer' } }
	})

	cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = 'path' },
			{ name = 'cmdline' }
		}
	})
end

return M
