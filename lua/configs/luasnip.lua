local ls = require('luasnip')

ls.config.setup {
	history = true,
	updateevents = 'InsertLeave',
	region_check_events = 'CursorHold',
	delete_check_events = 'TextChanged,InsertEnter',
	store_selection_keys = '<Tab>',
	ext_base_prio = 200,
	ext_prio_increase = 7,
	enable_autosnippets = true,
	-- default applied in util.parser, requires iNode, cNode
	-- (Dependency cycle if here).
	parser_nested_assembler = nil,
	-- Function expected to return a list of filetypes (or empty list)
	-- ft_func = ft_functions.from_filetype,
}

local function map(key, rhs, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set({ 'i', 's' }, key, rhs, opts)
end

map('<C-j>', function() require('luasnip').jump(1) end, { desc = 'LuaSnip Forward Jump' })
map('<C-k>', function() require('luasnip').jump(-1) end, { desc = 'LuaSnip Backward Jump' })
-- map(
-- 	'<C-E>',
-- 	'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"',
-- 	{ expr = true, desc = 'LuaSnip Next Choice' }
-- )
-- map(
-- 	'<C-T>',
-- 	'luasnip#choice_active() ? "<Plug>luasnip-prev-choice" : "<C-T>"',
-- 	{ expr = true, desc = 'LuaSnip Previous Choice' }
-- )

_G.if_char_insert_space = function()
	if string.find(vim.v.char, '%a') then
		vim.v.char = ' ' .. vim.v.char
	end
end

local snippets = {}
local autosnippets = {}

snippets.all = require('snippets.all')

snippets.gitcommit = require('snippets.gitcommit')
snippets.lua = require('snippets.lua')
snippets.markdown = require('snippets.markdown')
snippets.norg = require('snippets.norg')
snippets.tex = require('snippets.tex')

autosnippets.markdown = require('autosnippets.markdown')
autosnippets.norg = require('autosnippets.norg')
autosnippets.tex = require('autosnippets.tex')

ls.snippets = snippets
ls.autosnippets = autosnippets
