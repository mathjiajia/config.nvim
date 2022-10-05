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

local source_names = {
	buffer   = { '[Buf]', 'String' },
	nvim_lsp = { '[LSP]', 'Question' },
	path     = { '[Path]', 'WarningMsg' },
	cmdline  = { '[Cmd]', 'CmpItemMenu' },
	luasnip  = { '[Snip]', 'CmpItemMenu' },
	-- neorg    = { '[Org]', 'CmpItemMenu' },
	rg       = { '[RG]', 'CmpItemMenu' },
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

			local nm = source_names[entry.source.name]
			if nm then
				vim_item.menu = nm[1]
				vim_item.menu_hl_group = nm[2]
				vim_item.kind_hl_group = nm[2]
			else
				vim_item.menu = entry.source.name
			end

			local maxwidth = 50
			if #vim_item.abbr > maxwidth then
				vim_item.abbr = vim_item.abbr:sub(1, maxwidth) .. '...'
			end
			return vim_item
		end
	},
	matching = { disallow_prefix_unmatching = true },
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path', keyword_length = 4 },
		-- { name = 'neorg' },
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'rg', keyword_length = 4 }
	},
	window = {
		completion = {
			col_offset = -2,
			side_padding = 1,
		}
	}
}

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
