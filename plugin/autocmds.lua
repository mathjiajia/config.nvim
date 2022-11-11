vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group    = 'HighlightYank',
	desc     = 'Highlight the yanked text',
})

vim.api.nvim_create_autocmd('FileType', {
	callback = function()
		vim.keymap.set('n', 'q', '<Cmd>close<CR>', { buffer = true, silent = true })
		vim.keymap.set('n', '<Esc>', '<Cmd>close<CR>', { buffer = true, silent = true })
	end,
	pattern = { 'help', 'man', 'qf', 'tsplaygound' }
})

-- vim.api.nvim_create_autocmd('LSPAttach', {
-- 	callback = function(args)
-- 		local bufnr = args.buf
-- 		local client = args.data.client
-- 		vim.notify(
-- 			string.format('%s(%d) attached to buffer(%d)', client.name, client.id, bufnr),
-- 			vim.log.levels.INFO,
-- 			{ title = 'LSP' }
-- 		)
-- 	end,
-- 	group    = 'init_nvim',
-- })
