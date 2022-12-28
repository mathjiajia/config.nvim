local M = {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'onsails/lspkind.nvim',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-cmdline',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		'lukas-reineke/cmp-rg',
		'saadparwaiz1/cmp_luasnip',
	},
	-- event = 'VeryLazy',
	event = 'InsertEnter',
}

function M.config()
	-- local cmp_kinds = {
	-- 	Text          = '',
	-- 	Method        = '',
	-- 	Function      = '',
	-- 	Constructor   = '',
	-- 	Field         = '',
	-- 	Variable      = '',
	-- 	Class         = '',
	-- 	Interface     = '',
	-- 	Module        = '',
	-- 	Property      = '',
	-- 	Unit          = '',
	-- 	Value         = '',
	-- 	Enum          = '',
	-- 	Keyword       = '',
	-- 	Snippet       = '',
	-- 	Color         = '',
	-- 	File          = '',
	-- 	Reference     = '',
	-- 	Folder        = '',
	-- 	EnumMember    = '',
	-- 	Constant      = '',
	-- 	Struct        = '',
	-- 	Event         = '',
	-- 	Operator      = '',
	-- 	TypeParameter = '',
	-- }

	local icons = {
		kind = {
			Class         = '',
			Color         = '',
			Constant      = '',
			Constructor   = '',
			Enum          = '',
			EnumMember    = '',
			Event         = '',
			Field         = '',
			File          = '',
			Folder        = '',
			Function      = '',
			Interface     = '',
			Keyword       = '',
			Method        = '',
			Module        = '',
			Namespace     = '',
			Number        = '',
			Operator      = '',
			Package       = '',
			Property      = '',
			Reference     = '',
			Snippet       = '',
			Struct        = '',
			Text          = '',
			TypeParameter = '',
			Unit          = '',
			Value         = '',
			Variable      = '',
			-- ccls-specific icons.
			TypeAlias     = '',
			Parameter     = '',
			StaticMethod  = '',
			Macro         = '',
		},

		type = {
			Array   = '',
			Boolean = '',
			Null    = 'ﳠ',
			Number  = '',
			Object  = '',
			String  = '',
		},

		cmp = {
			Copilot     = '',
			Copilot_alt = '',
			nvim_lsp    = '',
			nvim_lua    = '',
			path        = '',
			buffer      = ' ',
			spell       = '暈',
			luasnip     = '',
			treesitter  = '',
		}
	}

	local cmp = require('cmp')
	local lspkind = require('lspkind')
	local border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' }

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
				local kind = lspkind.cmp_format({
					mode = 'symbol_text',
					maxwidth = 50,
					symbol_map = vim.tbl_deep_extend('force', icons.kind, icons.type, icons.cmp),
				})(entry, vim_item)
				local strings = vim.split(kind.kind, '%s', { trimempty = true })
				kind.kind = strings[1]
				kind.menu = ' (' .. strings[2] .. ')'
				return kind
			end,
		},
		matching = { disallow_prefix_unmatching = true },
		sources = {
			{ name = 'nvim_lsp', max_item_count = 10 },
			{ name = 'luasnip', max_item_count = 10, option = { show_autosnippets = true } },
			{ name = 'path', keyword_length = 4, max_item_count = 5 },
			{ name = 'neorg', max_item_count = 5 },
			{ name = 'buffer', keyword_length = 3, max_item_count = 10 },
			{ name = 'copilot', max_item_count = 3 },
			{ name = 'rg', keyword_length = 4, max_item_count = 8 }
		},
		window = {
			completion = {
				border = border,
				max_width = 80,
				max_height = 20,
				col_offset = -3,
			},
			documentation = {
				border = border,
			},
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
