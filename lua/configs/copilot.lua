local excluded_filetypes = { 'nofile', 'prompt' }
local copilot_filetypes = {}
for _, ft in pairs(excluded_filetypes) do
	copilot_filetypes[ft] = false
end

vim.api.nvim_set_var('copilot_filetypes', copilot_filetypes)

vim.keymap.set(
	'i',
	'<C-j>',
	'copilot#Accept("\\<CR>")',
	{ silent = true, script = true, expr = true, desc = 'Copilot Accept' }
)

vim.api.nvim_set_var('copilot_no_tab_map', true)
vim.api.nvim_set_var('copilot_assume_mapped', true)
