vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group    = 'HighlightYank',
	desc     = 'Highlight the yanked text',
})

vim.api.nvim_create_augroup('init_nvim', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
	command = 'silent! lcd %:p:h',
	group   = 'init_nvim',
	desc    = 'change the working directory',
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
