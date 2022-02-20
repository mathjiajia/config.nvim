local ls = require('luasnip')
-- local home = os.getenv('HOME')

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

vim.keymap.set({ 'i', 's' }, '<C-j>', function()
	require('luasnip').jump(1)
end, { desc = 'LuaSnip Forward Jump' })
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
	require('luasnip').jump(-1)
end, { desc = 'LuaSnip Backward Jump' })
-- vim.keymap.set({ 'i', 's' }, '<C-E>', function()
-- 	require('luasnip').change_choice(1)
-- end, { desc = 'LuaSnip Next Choice' })
-- vim.keymap.set({ 'i', 's' }, '<C-T>', function()
-- 	require('luasnip').change_choice(-1)
-- end, { desc = 'LuaSnip Previuos Choice' })

_G.if_char_insert_space = function()
	if string.find(vim.v.char, '%a') then
		vim.v.char = ' ' .. vim.v.char
	end
end

local snippets = {}
local autosnippets = {}

for _, ft in ipairs { 'all', 'gitcommit', 'lua', 'markdown', 'norg', 'tex' } do
	snippets.ft = require('snippets.' .. ft)
end

for _, ft in ipairs { 'markdown', 'norg', 'tex' } do
	autosnippets.ft = require('snippets.' .. ft)
end

ls.snippets = snippets
ls.autosnippets = autosnippets
