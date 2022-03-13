vim.api.nvim_create_augroup('HighlightYank', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank {}
	end,
	pattern = '*',
	group = 'HighlightYank',
	desc = 'Highlight the yanked text',
})

local function lastplace()
	local function find_pattern_match(tbl, val)
		return next(vim.tbl_filter(function(pattern)
			return val:match(pattern)
		end, tbl))
	end

	if find_pattern_match({ '^help$', '^nofile$', '^quickfix$' }, vim.bo.buftype) then
		return
	end
	if find_pattern_match({ '^gitcommit$', '^gitrebase$' }, vim.bo.filetype) then
		vim.api.nvim_command([[normal! gg]])
		return
	end

	if vim.fn.line([['"]]) > 0 and vim.fn.line([['"]]) <= vim.fn.line('$') then
		if vim.fn.line('w$') == vim.fn.line('$') then
			vim.api.nvim_command([[normal! g`"]])
		elseif vim.fn.line('$') - vim.fn.line([['"]]) > ((vim.fn.line('w$') - vim.fn.line('w0')) / 2) - 1 then
			vim.api.nvim_command([[normal! g`"zz]])
		else
			vim.api.nvim_command([[normal! G'"<c-e>]])
		end
	end
	if vim.fn.foldclosed('.') ~= -1 then
		vim.api.nvim_command([[normal! zvzz]])
	end
end

local init_nvim = vim.api.nvim_create_augroup('init_nvim', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
	command = 'silent! lcd %:p:h',
	pattern = '*',
	group = init_nvim,
	desc = 'change the working directory',
})
vim.api.nvim_create_autocmd('BufReadPost', {
	callback = lastplace,
	pattern = '*',
	group = init_nvim,
	desc = 'restore the cursor position',
})
vim.api.nvim_create_autocmd('CursorHold', {
	callback = function()
		require('plugins')
	end,
	pattern = '*',
	group = init_nvim,
	once = true,
	desc = 'Load Packer',
})
