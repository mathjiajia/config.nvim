local luasnip = require('luasnip')
local cmp = require('cmp')

local kind_icons = {
	Text = '',
	Method = '',
	Function = '',
	Constructor = '',
	Field = '',
	Variable = '',
	Class = 'ﴯ',
	Interface = '',
	Module = '',
	Property = 'ﰠ',
	Unit = '',
	Value = '',
	Enum = '',
	Keyword = '',
	Snippet = '',
	Color = '',
	File = '',
	Reference = '',
	Folder = '',
	EnumMember = '',
	Constant = '',
	Struct = '',
	Event = '',
	Operator = '',
	TypeParameter = '',
}

cmp.setup {
	enabled = function()
		local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
		if in_prompt then
			return false
		end
		local context = require('cmp.config.context')
		return not (context.in_treesitter_capture('comment') == true or context.in_syntax_group('Comment'))
	end,

	-- preselect = types.cmp.PreselectMode.Item,

	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-e>'] = cmp.mapping {
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if luasnip.expandable() then
				luasnip.expand()
			elseif cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	},

	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},

	-- completion = {
	-- 	keyword_length = 1,
	-- 	keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
	-- 	autocomplete = {
	-- 		types.cmp.TriggerEvent.TextChanged,
	-- 	},
	-- 	completeopt = 'menu,menuone,noselect',
	-- },

	formatting = {
		fields = { 'abbr', 'kind', 'menu' },
		format = function(entry, vim_item)
			-- Kind icons
			-- This concatonates the icons with the name of the item kind
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
			-- Source
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

	matching = {
		disallow_fuzzy_matching = false,
		disallow_partial_matching = false,
		disallow_prefix_unmatching = true,
	},

	-- sorting = {
	-- 	priority_weight = 2,
	-- 	comparators = {
	-- 		compare.offset,
	-- 		compare.exact,
	-- 		compare.score,
	-- 		compare.recently_used,
	-- 		compare.kind,
	-- 		compare.sort_text,
	-- 		compare.length,
	-- 		compare.order,
	-- 	},
	-- },

	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'rg', keyword_length = 3 },
	},

	-- documentation = {
	-- 	border = { '', '', '', ' ', '', '', '', ' ' },
	-- 	winhighlight = 'NormalFloat:NormalFloat,FloatBorder:NormalFloat',
	-- 	maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
	-- 	maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines)),
	-- },

	-- confirmation = {
	-- 	default_behavior = types.cmp.ConfirmBehavior.Insert,
	-- 	get_commit_characters = function(commit_characters)
	-- 		return commit_characters
	-- 	end,
	-- },

	-- event = {},

	-- experimental = {
	-- 	ghost_text = false,
	-- },

	-- view = {
	-- 	entries = 'custom',
	-- },
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources {
		{ name = 'luasnip' }, -- You can specify the `cmp_git` source if you were installed it.
		{ name = 'buffer' },
	},
})

cmp.setup.filetype('norg', {
	sources = cmp.config.sources {
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'neorg' },
	},
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = { name = 'buffer' },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources {
		{ name = 'path' },
		{ name = 'cmdline' },
	},
})
