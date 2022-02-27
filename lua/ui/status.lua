local M = {}

local api = vim.api

vim.api.nvim_set_hl(0, 'User1', { fg = '#302D41', bg = '#96CDFB' })
vim.api.nvim_set_hl(0, 'User2', { fg = '#96CDFB', bg = '#F2CDCD' })
vim.api.nvim_set_hl(0, 'User3', { fg = '#302D41', bg = '#F2CDCD' })
vim.api.nvim_set_hl(0, 'User4', { fg = '#F2CDCD', bg = '#1A1826' })
vim.api.nvim_set_hl(0, 'User5', { fg = '#96CDFB', bg = '#1A1826' })
vim.api.nvim_set_hl(0, 'User6', { fg = '#ABE9B3', bg = '#1A1826' })
vim.api.nvim_set_hl(0, 'User7', { fg = '#FAE3B0', bg = '#1A1826' })
vim.api.nvim_set_hl(0, 'User8', { fg = '#F28FAD', bg = '#1A1826' })
vim.api.nvim_set_hl(0, 'User9', { fg = '#FB617E', bg = '#1A1826' })
vim.api.nvim_set_hl(0, 'StatusInfo', { fg = '#B5E8E0', bg = '#1A1826' })
vim.api.nvim_set_hl(0, 'StatusHint', { fg = '#9ed06c', bg = '#1A1826' })

local mode_alias = {
	['n'] = 'Normal',
	['no'] = 'OP',
	['nov'] = 'OP',
	['noV'] = 'OP',
	['no'] = 'OP',
	['niI'] = 'Normal',
	['niR'] = 'Normal',
	['niV'] = 'Normal',
	['v'] = 'Visual',
	['V'] = 'Lines',
	[''] = 'Block',
	['s'] = 'Select',
	['S'] = 'Select',
	[''] = 'Block',
	['i'] = 'Insert',
	['ic'] = 'Insert',
	['ix'] = 'Insert',
	['R'] = 'Replace',
	['Rc'] = 'Replace',
	['Rv'] = 'V-Replace',
	['Rx'] = 'Replace',
	['c'] = 'Command',
	['cv'] = 'Command',
	['ce'] = 'Command',
	['r'] = 'Enter',
	['rm'] = 'More',
	['r?'] = 'Confirm',
	['!'] = 'Shell',
	['t'] = 'Terminal',
	['nt'] = 'Terminal',
	['null'] = 'None',
}

local function git_diff(type)
	local gsd = vim.b.gitsigns_status_dict

	if gsd and gsd[type] and gsd[type] > 0 then
		return tostring(gsd[type])
	end

	return ''
end

local function get_diagnostics_count(level)
	return vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
end

local function diagnostics(level)
	local count = get_diagnostics_count(level)
	return count ~= 0 and tostring(count) or ''
end

function M.get_vim_mode()
	return mode_alias[vim.api.nvim_get_mode().mode]
end

function M.git_branch()
	if vim.b.gitsigns_head then
		return ' ' .. vim.b.gitsigns_head
	end

	return ''
end

function M.git_diff_added()
	if git_diff('added') ~= '' then
		return ' ' .. git_diff('added')
	end

	return ''
end

function M.git_diff_changed()
	if git_diff('changed') ~= '' then
		return ' ' .. git_diff('changed')
	end

	return ''
end

function M.git_diff_deleted()
	if git_diff('removed') ~= '' then
		return ' ' .. git_diff('removed')
	end

	return ''
end

function M.lsp_cilent_list()
	if next(vim.lsp.buf_get_clients(0)) == nil then
		return ''
	end

	local clients = {}
	for _, client in ipairs(vim.lsp.buf_get_clients(0)) do
		clients[#clients + 1] = client.name
	end

	local list = table.concat(clients, ' • ')
	return ' ' .. list .. ' '
end

function M.diagnostic_error()
	local error = vim.diagnostic.severity.ERROR

	if get_diagnostics_count(error) > 0 then
		return ' ' .. diagnostics(error)
	end

	return ''
end

function M.diagnostic_warning()
	local warning = vim.diagnostic.severity.WARN
	if get_diagnostics_count(warning) > 0 then
		return ' ' .. diagnostics(warning)
	end

	return ''
end

function M.diagnostic_info()
	local info = vim.diagnostic.severity.INFO
	if get_diagnostics_count(info) > 0 then
		return ' ' .. diagnostics(info)
	end

	return ''
end

function M.diagnostic_hint()
	local hint = vim.diagnostic.severity.HINT
	if get_diagnostics_count(hint) > 0 then
		return ' ' .. diagnostics(hint)
	end

	return ''
end

function M.file_dict()
	local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')

	return ' ' .. dir_name .. ' '
end

function M.file_icon()
	local filename = api.nvim_buf_get_name(0)
	local filetype = vim.bo.filetype

	local icon = require('nvim-web-devicons').get_icon(filename, filetype, { default = true })
	return icon
end

function M.treesitter()
	local bufnr = api.nvim_get_current_buf()
	if vim.treesitter.highlighter.active[bufnr] then
		return ' 侮'
	end
	return ' '
end

local function pad(x)
	return '%( ' .. x .. ' %)'
end

local function func(name)
	return '%{%v:lua.statusline.' .. name .. '()%}'
end

function M.active()
	vim.wo.statusline = table.concat {
		'%1*  ',
		func('get_vim_mode'),
		'%(%2*%)%<%3*',
		pad(func('git_branch')),
		'%(%4*%)%6*',
		pad(func('git_diff_added')),
		'%7*',
		pad(func('git_diff_changed')),
		'%8*',
		pad(func('git_diff_deleted')),
		'%=%#StatusLineNC#',
		func('lsp_cilent_list'),
		'%9*',
		pad(func('diagnostic_error')),
		'%7*',
		pad(func('diagnostic_warning')),
		'%#StatusInfo#',
		pad(func('diagnostic_info')),
		'%#StatusHint#',
		pad(func('diagnostic_hint')),
		'%0*%=',
		pad('%3p%% Ln %l, Col %c'),
		'%(%4*%)%3*',
		func('file_dict'),
		'%(%2*%)%1*',
		func('file_icon'),
		' %f',
		func('treesitter'),
	}
end

function M.inactive()
	vim.wo.statusline = table.concat {
		'%1*  ',
		func('get_vim_mode'),
		'%(%5*%)%0*%=%(%5*%1*%f %)',
	}
end

-- Only set up WinEnter autocmd when the WinLeave autocmd runs
vim.cmd([[
	augroup statusline
		autocmd!
		autocmd WinLeave,FocusLost *
			\ autocmd statusline BufWinEnter,WinEnter,FocusGained *
			\ if index(['aerial','help','NvimTree','packer','qf','spectre_panel','TelescopePrompt','tsplayground'], &ft) < 0
			\ | lua statusline.active()
		autocmd WinLeave,FocusLost * lua statusline.inactive()
		autocmd VimEnter * lua statusline.active()
	augroup END
]])

_G.statusline = M

return M
