local autocmd = {}

function autocmd.nvim_create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		vim.api.nvim_command('augroup ' .. group_name)
		vim.api.nvim_command('autocmd!')
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
			vim.api.nvim_command(command)
		end
		vim.api.nvim_command('augroup END')
	end
end

function autocmd.load_autocmds()
	local definitions = {
		bufs = {
			{ 'BufEnter', '*', 'silent! lcd %:p:h' }, -- Auto change work directory
			{
				'BufReadPost',
				'*',
				[[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
			}, -- auto place to last edit
		},
		packer_user_config = {
			{ 'BufWritePost', 'plugins.lua', 'source <afile> | PackerCompile' },
		},
		yank = {
			{ 'TextYankPost', '*', 'silent! lua vim.highlight.on_yank()' }, -- Highlight on yank
		},
	}

	autocmd.nvim_create_augroups(definitions)
end

autocmd.load_autocmds()

-- vim.api.nvim_create_augroup({ name = bufs })
-- vim.api.nvim_create_autocmd {
-- 	event = 'BufEnter',
-- 	group = 'bufs',
-- 	pattern = '*',
--	callback = 'silent! lcd %:p:h',
-- 	once = true,
-- }
-- vim.api.nvim_create_autocmd {
-- 	event = 'BufRead',
-- 	group = 'bufs',
-- 	pattern = '*',
--	callback = [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif]],
-- 	once = true,
-- }

-- vim.api.nvim_create_augroup({ name = packer_user_config })
-- vim.api.nvim_create_autocmd {
-- 	event = 'BufWritePost',
-- 	group = 'packer_user_config',
-- 	pattern = 'plugins.lua',
--	callback = 'source <afile> | PackerCompile',
-- 	once = true,
-- }

-- vim.api.nvim_create_augroup({ name = yank })
-- vim.api.nvim_create_autocmd {
-- 	event = 'TextYankPost',
-- 	group = 'yank',
-- 	pattern = '*',
--	callback = 'silent! lua vim.highlight.on_yank()',
-- 	once = true,
-- }
