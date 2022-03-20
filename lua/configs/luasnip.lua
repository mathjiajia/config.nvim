local ls = require('luasnip')
local types = require('luasnip.util.types')

ls.config.setup {
	updateevents = 'TextChanged,TextChangedI',
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				-- virt_text = { { '●', 'DiagnosticSignHint' } },
				-- virt_text = { { '◍', 'DiagnosticSignHint' } },
				virt_text = { { '<- Current Choice', 'NonText' } },
			},
		},
	},
	-- ft_func = require('luasnip.extras.filetype_functions').from_pos_or_filetype,
	-- globals injected into luasnippet-files.
	-- snip_env = {
	-- 	s = require('luasnip.nodes.snippet').S,
	-- 	sn = require('luasnip.nodes.snippet').SN,
	-- 	t = require('luasnip.nodes.textNode').T,
	-- 	f = require('luasnip.nodes.functionNode').F,
	-- 	i = require('luasnip.nodes.insertNode').I,
	-- 	c = require('luasnip.nodes.choiceNode').C,
	-- 	d = require('luasnip.nodes.dynamicNode').D,
	-- 	r = require('luasnip.nodes.restoreNode').R,
	-- 	l = require('luasnip.extras').lambda,
	-- 	rep = require('luasnip.extras').rep,
	-- 	p = require('luasnip.extras').partial,
	-- 	m = require('luasnip.extras').match,
	-- 	n = require('luasnip.extras').nonempty,
	-- 	dl = require('luasnip.extras').dynamic_lambda,
	-- 	fmt = require('luasnip.extras.fmt').fmt,
	-- 	fmta = require('luasnip.extras.fmt').fmta,
	-- 	conds = require('luasnip.extras.expand_conditions'),
	-- 	types = require('luasnip.util.types'),
	-- 	events = require('luasnip.util.events'),
	-- 	parse = require('luasnip.util.parser').parse_snippet,
	-- 	ai = require('luasnip.nodes.absolute_indexer'),
	-- },
}

-- stylua: ignore start
vim.keymap.set(
	{ 'i', 's' }, '<C-j>',
	function()
		if ls.expand_or_locally_jumpable() then
			ls.expand_or_jump()
		end
	end,
	{ desc = 'LuaSnip Forward Jump' }
)
vim.keymap.set(
	{ 'i', 's' }, '<C-k>',
	function()
		if ls.jumpable(-1) then
			ls.jump(-1)
		end
	end,
	{ desc = 'LuaSnip Backward Jump' }
)
vim.keymap.set(
	'i', '<C-l>',
	function()
		if ls.choice_active() then
			ls.change_choice(1)
		end
	end,
	{ desc = 'LuaSnip Next Choice' }
)
-- stylua: ignore end

-- require('luasnip.loaders.from_lua').lazy_load { include = { 'all', 'cpp' } }
require('luasnip.loaders.from_lua').lazy_load()

-- vim.api.nvim_add_user_command('LuaSnipEdit', edit_ft, {})
