local M = {}

local nbg = vim.api.nvim_get_hl_by_name('StatusLine', true).background
local ncbg = vim.api.nvim_get_hl_by_name('StatusLineNC', true).background
local gitfg = vim.api.nvim_get_hl_by_name('String', true).foreground
local dictfg = vim.api.nvim_get_hl_by_name('Directory', true).foreground
local posfg = vim.api.nvim_get_hl_by_name('Float', true).foreground
local lnfg = vim.api.nvim_get_hl_by_name('Error', true).foreground

vim.api.nvim_set_hl(0, 'User1', { fg = gitfg, bg = nbg })
vim.api.nvim_set_hl(0, 'User2', { fg = dictfg, bg = ncbg })
vim.api.nvim_set_hl(0, 'User3', { fg = posfg, bg = nbg })
vim.api.nvim_set_hl(0, 'User4', { fg = lnfg, bg = nbg })

local function hunks()
	if vim.b.gitsigns_status then
		local status = ' %1* ' .. vim.b.gitsigns_head
		if vim.b.gitsigns_status ~= '' then
			status = status .. ' | ' .. vim.b.gitsigns_status
		end
		return status .. ' '
	elseif vim.g.gitsigns_head then
		return ' %1* ' .. vim.g.gitsigns_head .. ' '
	end
	return ''
end

local function gps()
	local nvim_gps = require 'nvim-gps'
	if nvim_gps.is_available() then
		return nvim_gps.get_location()
	end
	return ''
end

for _, ty in ipairs { 'Warn', 'Error', 'Info', 'Hint' } do
	local hl = vim.api.nvim_get_hl_by_name('Diagnostic' .. ty, true)
	local name = ('Diagnostic%sStatus'):format(ty)
	vim.api.nvim_set_hl(0, name, { fg = hl.foreground, bg = ncbg })
end

local function lsp_status()
	if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
		return ''
	end

	local status = {}
	for _, ty in ipairs { { 'Error', '' }, { 'Warn', '' }, { 'Info', '' }, { 'Hint', '' } } do
		local n = vim.diagnostic.get(0, { severity = ty[1] })
		if #n > 0 then
			table.insert(status, ('%%#Diagnostic%sStatus# %s %s'):format(ty[1], ty[2], #n))
		end
	end

	if vim.g.metals_status then
		status[#status + 1] = vim.g.metals_status:gsub('%%', '%%%%')
	end
	local r = table.concat(status, ' ')
	return r == '' and '  LSP' or r
end

local function file_info()
	local fullname = vim.api.nvim_buf_get_name(0)
	local shortname = vim.fn.pathshorten(fullname)
	local simplename = shortname:gsub('^/U/%w+', '~')
	return ' %2*' .. simplename
end

local function pad(c, m)
	local padch = '·'
	return string.rep(padch, string.len(tostring(m)) - string.len(tostring(c)))
end

local function position()
	local nbline = vim.fn.line '$'
	local line = vim.fn.line '.'
	local col = vim.fn.col '.'
	local percent = math.floor(line * 100 / nbline)
	local pos = string.format(' %s%d%%%%', pad(percent, 100), percent)
	-- local ln_col = string.format('Ln %s%d, Col %s%d ', pad(line, nbline), line, pad(col, 100), col)
	local ln_col = string.format('%s%d %s%d ', pad(line, nbline), line, pad(col, 100), col)
	return ' %3*' .. pos .. ' %4*' .. ln_col
end

local function find_pattern_match(tbl, val)
	return next(vim.tbl_filter(function(pattern)
		return val:match(pattern)
	end, tbl))
end

local function force_inactive()
	return find_pattern_match({ '^help$', '^quickfix$', '^nofile$' }, vim.bo.buftype)
		or find_pattern_match(
			{ '^$', '^aerial$', '^neo%-tree$', '^NvimTree$', '^spectre_panel$', '^TelescopePrompt$', '^tsplayground$' },
			vim.bo.filetype
		)
end

local function generate_statusline(is_active)
	if is_active and not force_inactive() then
		return hunks() .. '%#StatusLineNC# ' .. gps() .. '%=' .. lsp_status() .. file_info() .. position()
	else
		return '%#StatusLineNC# %y '
	end
end

function M.setup()
	return generate_statusline(vim.api.nvim_get_current_win() == tonumber(vim.g.actual_curwin))
end

vim.g.qf_disable_statusline = true
vim.opt.statusline = '%{%v:lua.statusline.setup()%}'
_G.statusline = M
