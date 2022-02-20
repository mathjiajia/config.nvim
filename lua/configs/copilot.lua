local excluded_filetypes = { 'nofile', 'prompt' }
local copilot_filetypes = {}
for _, ft in ipairs(excluded_filetypes) do
	copilot_filetypes[ft] = false
end

vim.g.copilot_filetypes = copilot_filetypes

vim.keymap.set(
	'i',
	'<C-j>',
	'copilot#Accept("\\<CR>")',
	{ silent = true, script = true, expr = true, desc = 'Copilot Accept' }
)

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
