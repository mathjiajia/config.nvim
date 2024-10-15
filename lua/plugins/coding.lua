return {

	{
		"luasnip",
		event = { "InsertEnter" },
		after = function()
			local ls = require("luasnip")
			local types = require("luasnip.util.types")

			ls.setup({
				update_events = "TextChanged,TextChangedI",
				delete_check_events = "TextChanged",
				ext_opts = {
					[types.insertNode] = { active = { virt_text = { { "", "Boolean" } } } },
					[types.choiceNode] = { active = { virt_text = { { "󱥸", "Special" } } } },
				},
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
			})

			local path = "/nix/store/6pcw2vnnja9pb6xi3xbd8kw1rg2hm4qg-vimplugin-mySnippets/snippets"
			require("luasnip.loaders.from_lua").lazy_load({ paths = path })

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

	{
		"cmp.nvim",
		event = { "CmdlineEnter", "InsertEnter" },
		after = function()
			local cmp = require("cmp")

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
					fields = { "abbr", "menu", "kind" },
					format = function(entry, item)
						local maxwidth = 30
						local icon = require("mini.icons").get("lsp", item.kind)

						if vim.fn.strchars(item.abbr) > maxwidth then
							item.abbr = vim.fn.strcharpart(item.abbr, 0, maxwidth) .. "…"
						end
						item.menu = ({
							buffer = "[Buffer]",
							cmdline = "[Cmd]",
							nvim_lsp = "[LSP]",
							luasnip = "[Snip]",
							neorg = "[Norg]",
							path = "[Path]",
							rg = "[RG]",
						})[entry.source.name]
						item.kind = icon .. " " .. item.kind
						return item
					end,
				},
				window = {
					completion = { border = "rounded", col_offset = -1 },
					documentation = { border = "rounded" },
				},
				---@diagnostic disable-next-line: missing-fields
				matching = { disallow_prefix_unmatching = true },
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip", option = { show_autosnippets = true } },
					{ name = "path" },
				}, {
					{ name = "copilot", max_item_count = 2 },
					{ name = "buffer" },
					{ name = "neorg" },
				}, {
					{ name = "rg", keyword_length = 2 },
				}),
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = { name = "buffer" },
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end,
	},

	{
		"copilot.lua",
		cmd = "Copilot",
		after = function()
			require("copilot").setup({
				panel = { enabled = false },
				suggestion = { enabled = false },
			})
		end,
	},

	{
		"ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		after = function()
			require("ultimate-autopair").setup()
		end,
	},

	{
		"nvim-surround",
		after = function()
			require("nvim-surround").setup({})
		end,
		ft = { "tex" },
		keys = {
			{ "cs", desc = "Change Surrounding" },
			{ "ds", desc = "Delete Surrounding" },
			{ "ys", desc = "Add Surrounding" },
			{ "yS", desc = "Add Surrounding to Current Line" },
			{ "S", mode = { "x" }, desc = "Add Surrounding" },
			{ "gS", mode = { "x" }, desc = "Add Surrounding to Current Line" },
			{ "<C-g>s", mode = { "i" }, desc = "Add Surrounding" },
			{ "<C-g>S", mode = { "i" }, desc = "Add Surrounding to Current Line" },
		},
	},
}
