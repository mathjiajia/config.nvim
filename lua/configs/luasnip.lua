local ls = require('luasnip')

ls.config.setup {
	history = true,
	region_check_events = 'CursorHold',
	delete_check_events = 'TextChanged,InsertEnter',
	store_selection_keys = '<Tab>',
	enable_autosnippets = true,
}

-- stylua: ignore start
vim.keymap.set({ 'i', 's' }, '<C-j>', function() ls.jump(1) end, { desc = 'LuaSnip Forward Jump' })
vim.keymap.set({ 'i', 's' }, '<C-k>', function() ls.jump(-1) end, { desc = 'LuaSnip Backward Jump' })
vim.keymap.set(
	{ 'i', 's' },
	'<C-E>',
	'luasnip#choice_active() ? "<Plug>luasnip-next-choice" : "<C-E>"',
	{ expr = true, desc = 'LuaSnip Next Choice' }
)
vim.keymap.set(
	{ 'i', 's' },
	'<C-T>',
	'luasnip#choice_active() ? "<Plug>luasnip-prev-choice" : "<C-T>"',
	{ expr = true, desc = 'LuaSnip Previous Choice' }
)
-- stylua: ignore end

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
