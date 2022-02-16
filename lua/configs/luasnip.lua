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

-- local function load_snippet_file(filename)
-- 	-- 420 = 0644
-- 	local fd = vim.loop.fs_open(filename, 'r', 420)

-- 	if not fd then
-- 		return nil
-- 	end

-- 	local size = vim.loop.fs_fstat(fd).size
-- 	local func_string = vim.loop.fs_read(fd, size)
-- 	-- don't use require, we know where the file resides.
-- 	func_string = 'dofile("~/.config/nvim/lua/plugins/luasnip/helpers.lua").setup_snip_env() ' .. func_string
-- 	return loadstring(func_string)()
-- end

-- ls.snippets = setmetatable({}, {
-- 	__index = function(t, k)
-- 		-- absolute path!!!
-- 		-- adds snip_env to the file before generating the function.
-- 		local snippets = load_snippet_file('~/.config/nvim/lua/snippets/' .. k .. '.lua')
-- 		-- set to empty table if no snippets found, prevents loading the file again on the next expand.
-- 		t[k] = snippets or {}
-- 		return t[k]
-- 	end,
-- })

-- ls.autosnippets = setmetatable({}, {
-- 	__index = function(t, k)
-- 		-- absolute path!!!
-- 		-- adds snip_env to the file before generating the function.
-- 		local snippets = load_snippet_file('~/.config/nvim/lua/autosnippets/' .. k .. '.lua')
-- 		-- set to empty table if no snippets found, prevents loading the file again on the next expand.
-- 		t[k] = snippets or {}
-- 		return t[k]
-- 	end,
-- })

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
