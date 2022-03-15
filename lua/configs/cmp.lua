local cmp_kinds = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = '',
	Interface = '',
	Module = '',
	Property = '',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
}

vim.opt.completeopt = 'menu,menuone,noselect'

local cmp = require('cmp')

cmp.setup {
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
		['<C-e>'] = cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() },
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				buffer = '[Buf]',
				cmdline = '[Cmd]',
				luasnip = '[Snip]',
				nvim_lsp = '[LSP]',
				neorg = '[Norg]',
				path = '[Path]',
				rg = '[RG]',
			})[entry.source.name]
			return vim_item
		end,
	},
	matching = { disallow_prefix_unmatching = true },
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer', keyword_length = 4 },
		{ name = 'rg', keyword_length = 5 },
	},
}

cmp.setup.filetype('gitcommit', { sources = { { name = 'luasnip' }, { name = 'buffer', keyword_length = 3 } } })
cmp.setup.filetype(
	'norg',
	{ sources = { { name = 'luasnip' }, { name = 'neorg' }, { name = 'buffer', keyword_length = 3 } } }
)

cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
cmp.setup.cmdline(':', { sources = { { name = 'path' }, { name = 'cmdline' } } })
