return {

	-- snippets
	{
		"L3MON4D3/LuaSnip",
		lazy = true,
		submodules = false,
		dependencies = {
			"mathjiajia/mySnippets",
			opts = { path = "~/Projects/mySnippets/snippets" },
		},
		config = function()
			local ls = require("luasnip")
			local types = require("luasnip.util.types")

			ls.setup({
				update_events = "TextChanged,TextChangedI",
				delete_check_events = "TextChanged",
				ext_opts = {
					[types.insertNode] = { active = { virt_text = { { "●", "Boolean" } } } },
					[types.choiceNode] = { active = { virt_text = { { "○", "Special" } } } },
				},
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
			})

			vim.keymap.set("i", "<C-k>", function()
				if ls.expandable() then
					ls.expand()
				end
			end, { desc = "LuaSnip Expand" })

			vim.keymap.set({ "i", "s" }, "<C-l>", function()
				if ls.locally_jumpable(1) then
					ls.jump(1)
				end
			end, { desc = "LuaSnip Forward Jump" })

			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if ls.locally_jumpable(-1) then
					ls.jump(-1)
				end
			end, { desc = "LuaSnip Backward Jump" })

			vim.keymap.set({ "i", "s" }, "<C-e>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end, { desc = "LuaSnip Next Choice" })
		end,
	},

	-- auto completion
	{
		"hrsh7th/nvim-cmp",
		event = { "CmdlineEnter", "InsertEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"lukas-reineke/cmp-rg",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				formatting = {
					expandable_indicator = true,
					fields = { "abbr", "kind", "menu" },
					format = lspkind.cmp_format({
						mode = "symbol_text",
						preset = "codicons",
						maxwidth = 50,
						ellipsis_char = "…",
						menu = {
							buffer = "Buffer",
							cmdline = "Cmd",
							nvim_lsp = "Lsp",
							luasnip = "Snippet",
							neorg = "Norg",
							copilot = "Copilot",
							path = "Path",
							rg = "RG",
						},
					}),
				},
				matching = { disallow_prefix_unmatching = true },
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip", option = { show_autosnippets = true } },
					-- { name = "neorg", ft = "norg" },
					{ name = "buffer", keyword_length = 2 },
					{ name = "copilot", max_item_count = 2 },
					{ name = "path", keyword_length = 2 },
					{ name = "rg", keyword_length = 3 },
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { { name = "buffer" } },
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "path" },
					{ name = "cmdline" },
				},
			})
		end,
	},

	-- github copilot
	{
		"zbirenbaum/copilot.lua",
		build = ":Copilot auth",
		cmd = "Copilot",
		dependencies = {
			"zbirenbaum/copilot-cmp",
			config = true,
		},
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				markdown = true,
				help = true,
			},
		},
	},

	-- auto pairs
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		config = true,
	},

	-- surround
	{
		"kylechui/nvim-surround",
		config = true,
		keys = {
			{ "cs", desc = "Change Surrounding" },
			{ "ds", desc = "Delete Surrounding" },
			{ "ys", desc = "Add Surrounding" },
		},
	},

	-- better text-objects
	{
		"echasnovski/mini.ai",
		keys = {
			{ "a", mode = { "o", "x" } },
			{ "i", mode = { "o", "x" } },
		},
		config = function()
			local ai = require("mini.ai")
			ai.setup({
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}, {}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
					d = { "%f[%d]%d+" }, -- digits
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
					g = function() -- Whole buffer, similar to `gg` and 'G' motion
						local from = { line = 1, col = 1 }
						local to = {
							line = vim.fn.line("$"),
							col = math.max(vim.fn.getline("$"):len(), 1),
						}
						return { from = from, to = to }
					end,
					u = ai.gen_spec.function_call(), -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }), -- without dot in function name
				},
			})
		end,
	},
}
