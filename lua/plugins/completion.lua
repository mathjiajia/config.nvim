local M = {
	-- completion (and sources)
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'lukas-reineke/cmp-rg',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function()
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
						local cmp_kinds = require('config.icons').kinds

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
						border = 'rounded',
						col_offset = -3,
					},
					documentation = {
						border = 'rounded',
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
		end,
		event = 'InsertEnter',
	},

	-- snippets
	{
		'L3MON4D3/LuaSnip',
		config = function()
			local ls = require('luasnip')
			local types = require('luasnip.util.types')

			ls.setup({
				update_events = 'TextChanged,TextChangedI',
				enable_autosnippets = true,
				ext_opts = {
					[types.choiceNode] = {
						active = {
							virt_text = { { '« ', 'NonText' } }
						},
					}
				},
			})

			vim.keymap.set({ 'i', 's' }, '<C-j>', function()
				if ls.expandable() or ls.locally_jumpable(1) then
					ls.expand_or_jump()
				end
			end, { desc = 'LuaSnip Forward Jump' })
			vim.keymap.set({ 'i', 's' }, '<C-k>', function()
				if ls.locally_jumpable(-1) then
					ls.jump(-1)
				end
			end, { desc = 'LuaSnip Backward Jump' })
			vim.keymap.set('i', '<C-l>', function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { desc = 'LuaSnip Next Choice' })

			require('luasnip.loaders.from_lua').lazy_load({ paths = '~/.config/nvim/LuaSnips/' })
		end,
	},

	-- auto pairs
	{
		'windwp/nvim-autopairs',
		config = function()
			local npairs = require('nvim-autopairs')

			npairs.setup()

			npairs.get_rule("'")[1]:with_pair(function()
				if vim.bo.filetype == 'tex' then
					return false
				end
			end)

			npairs.get_rule('"')[1]:with_pair(function()
				if vim.bo.filetype == 'tex' then
					return false
				end
			end)
		end,
		event = 'InsertEnter',
	},

	-- github copilot
	{
		'zbirenbaum/nvim-copilot',
		enabled = false,
		dependencies = {
			'zbirenbaum/copilot_cmp',
			config = true,
		},
		config = {
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					jump_prev = '[[',
					jump_next = ']]',
					accept = '<CR>',
					refresh = 'gr',
					open = '<M-CR>'
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = '<M-l>',
					accept_word = false,
					accept_line = false,
					next = '<M-]>',
					prev = '<M-[>',
					dismiss = '<C-]>',
				},
			},
			filetypes = {
				yaml = false,
				markdown = false,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				['.'] = false,
			},
			copilot_node_command = 'node',
			server_opts_overrides = {},
		},
	},
}

return M
