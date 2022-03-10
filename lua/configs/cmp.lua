local cp = {
	rosewater = '#F5E0DC', -- Rosewater
	flamingo = '#F2CDCD', -- Flamingo
	mauve = '#DDB6F2', -- Mauve
	pink = '#F5C2E7', -- Pink
	red = '#F28FAD', -- Red
	maroon = '#E8A2AF', -- Maroon
	peach = '#F8BD96', -- Peach
	yellow = '#FAE3B0', -- Yellow
	green = '#ABE9B3', -- Green
	blue = '#96CDFB', -- Blue
	sky = '#89DCEB', -- Sky
	teal = '#B5E8E0', -- Teal
	lavender = '#C9CBFF', -- Lavender
	white = '#D9E0EE', -- White
	gray2 = '#C3BAC6', -- Gray2
	gray1 = '#988BA2', -- Gray1
	gray0 = '#6E6C7E', -- Gray0
	-- black4 = '#575268', -- Black4
	-- black3 = '#302D41', -- Black3
	-- black2 = '#1E1E2E', -- Black2
	-- black1 = '#1A1826', -- Black1
	-- black0 = '#161320', -- Black0
}

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.gray2 })
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.gray0, strikethrough = true })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { link = 'TSConstructor' })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.pink })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { link = 'TSField' })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { link = 'Type' })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { link = 'Directory' })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { link = 'TSParameterReference' })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.lavender })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.sky })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.gray0 })

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
		{ name = 'buffer', keyword_length = 3 },
		{ name = 'rg', keyword_length = 3 },
	},
	experimental = { ghost_text = true },
}

cmp.setup.filetype('gitcommit', {
	sources = {
		{ name = 'luasnip' },
		{ name = 'buffer', keyword_length = 3 },
	},
})
cmp.setup.filetype('norg', {
	sources = {
		{ name = 'luasnip' },
		{ name = 'neorg' },
		{ name = 'buffer', keyword_length = 3 },
	},
})

cmp.setup.cmdline('/', {
	sources = { { name = 'buffer' } },
})
cmp.setup.cmdline(':', {
	sources = {
		{ name = 'path' },
		{ name = 'cmdline' },
	},
})
