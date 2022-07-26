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
	TypeParameter = ''
}

local cmp = require 'cmp'

cmp.setup {
	mapping = cmp.mapping.preset.insert({
		['<C-d>']     = cmp.mapping.scroll_docs(-4),
		['<C-f>']     = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
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
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		-- { name = 'neorg' },
		{ name = 'buffer', keyword_length = 4 },
		{ name = 'rg', keyword_length = 5 }
	},
	window = {
		completion = {
			col_offset = -2,
			side_padding = 1,
		}
	}
}

cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = 'buffer' } }
})

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'path' },
		{ name = 'cmdline' } }
})
