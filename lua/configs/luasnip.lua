local ls = require('luasnip')

ls.config.setup {
	-- history = true,
	updateevents = 'TextChanged,TextChangedI',
	enable_autosnippets = true,
}

vim.keymap.set({ 'i', 's' }, '<C-j>', function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { desc = 'LuaSnip Forward Jump' })
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { desc = 'LuaSnip Backward Jump' })
vim.keymap.set({ 'i', 's' }, '<C-l>', function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { desc = 'LuaSnip Next Choice' })
-- vim.keymap.set({ 'i', 's' }, '<C-h>', function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(-1)
-- 	end
-- end, { desc = 'LuaSnip Previous Choice' })

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
