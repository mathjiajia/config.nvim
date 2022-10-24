local ls    = require('luasnip')
local types = require('luasnip.util.types')

ls.config.setup({
	update_events = 'TextChanged,TextChangedI',
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { '« ', 'NonText' } }
			},
		}
	}
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

-- vim.api.nvim_add_user_command('LuaSnipEdit', edit_ft, {})
