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
	Property = '',
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
		fields = { 'kind', 'abbr', 'menu' },
		format = function(entry, vim_item)
			vim_item.kind = cmp_kinds[vim_item.kind]
			-- vim_item.kind = string.format('%s %s', cmp_kinds[vim_item.kind], vim_item.kind)
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
		{ name = 'neorg' },
		{ name = 'buffer', keyword_length = 4 },
		{ name = 'rg', keyword_length = 5 },
	},
	-- window = {
	-- 	completion = {
	-- 		border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
	-- 		-- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	-- 		winhighlight = {
	-- 			bordered = 'Normal:CmpBorderedWindow_Normal,FloatBorder:CmpBorderedWindow_FloatBorder,CursorLine:CmpBorderedWindow_CursorLine,Search:None',
	-- 			default = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
	-- 		},
	-- 	},
	-- },
}

cmp.setup.cmdline('/', { sources = { { name = 'buffer' } } })
cmp.setup.cmdline(':', { sources = { { name = 'path' }, { name = 'cmdline' } } })
