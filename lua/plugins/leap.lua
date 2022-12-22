local M = {
	'ggandor/leap.nvim',
	-- dependencies = {
	-- 	{ 'ggandor/flit.nvim' },
	-- 	{ 'ggandor/leap-ast.nvim' },
	-- },
	event = 'VeryLazy',
}

function M.config()
	require('leap').add_default_mappings()
	-- require('flit').setup({
	-- 	labeled_modes = 'nv',
	-- })
	-- vim.keymap.set({ 'n', 'x', 'o' }, 'M', function()
	-- 	require('leap-ast').leap()
	-- end, {})
end

return M
