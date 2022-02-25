local cp = require('colors')

vim.api.nvim_set_hl(0, 'CmpItemAbbr', { fg = cp.gray2 }) --  The abbr field's highlight group.
vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { fg = cp.gray0, bg = 'NONE', strikethrough = true })
-- The abbr field's highlight group that only used for deprecated item.
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { fg = cp.blue }) --  The matched character's highlight group.
vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { fg = cp.blue, bold = true })
-- The fuzzy matched character's highlight group.
vim.api.nvim_set_hl(0, 'CmpItemKind', { fg = cp.blue }) --  The kind field's highlight group.

-- 'The kind field's highlight group for specific `lsp.CompletionItemKind`.
vim.api.nvim_set_hl(0, 'CmpItemKindSnippet', { fg = cp.mauve })
vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindText', { fg = cp.teal })
vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindConstructor', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindFolder', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindModule', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindConstant', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindField', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindEnum', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { fg = cp.green })
vim.api.nvim_set_hl(0, 'CmpItemKindClass', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { fg = cp.flamingo })
vim.api.nvim_set_hl(0, 'CmpItemKindFile', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { fg = cp.yellow })
vim.api.nvim_set_hl(0, 'CmpItemKindColor', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindReference', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindEnumMember', { fg = cp.red })
vim.api.nvim_set_hl(0, 'CmpItemKindStruct', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindValue', { fg = cp.peach })
vim.api.nvim_set_hl(0, 'CmpItemKindEvent', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindOperator', { fg = cp.blue })
vim.api.nvim_set_hl(0, 'CmpItemKindTypeParameter', { fg = cp.blue })

vim.api.nvim_set_hl(0, 'CmpItemMenu', { fg = cp.white }) --  The menu field's highlight group.

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup {
	enabled = function()
		local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
		if in_prompt then
			return false
		end
		local context = require('cmp.config.context')
		return not (context.in_treesitter_capture('comment') == true or context.in_syntax_group('Comment'))
	end,
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
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = '[Buf]',
				cmdline = '[Cmd]',
				luasnip = '[Snip]',
				nvim_lsp = '[LSP]',
				neorg = '[Norg]',
				path = '[Path]',
				rg = '[RG]',
			},
		},
	},
	matching = {
		disallow_prefix_unmatching = true,
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'rg', keyword_length = 3 },
	},
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources {
		{ name = 'luasnip' },
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
