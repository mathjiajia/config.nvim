local ls    = require('luasnip')
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
	-- snip_env = {
	-- 	s = function(...)
	-- 		local snip = ls.s(...)
	-- 		table.insert(getfenv(2).ls_file_snippets, snip)
	-- 	end,
	-- parse = function(...)
	-- 	local snip = ls.parser.parse(...)
	-- 	table.insert(getfenv(2).ls_file_snippets, snip)
	-- end,
	-- },
})

vim.keymap.set(
	{ 'i', 's' },
	'<C-j>',
	function()
		if ls.expand_or_locally_jumpable() then
			ls.expand_or_jump()
		end
	end,
	{ desc = 'LuaSnip Forward Jump' }
)
vim.keymap.set(
	{ 'i', 's' },
	'<C-k>',
	function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end,
	{ desc = 'LuaSnip Backward Jump' }
)
vim.keymap.set(
	'i',
	'<C-l>',
	function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end,
	{ desc = 'LuaSnip Next Choice' }
)

require('luasnip.loaders.from_lua').lazy_load({ paths = '~/.config/nvim/LuaSnips/' })
