local colors = {
	flamingo = '#F2CDCD',
	red = '#F28FAD',
	maroon = '#E8A2AF',
	peach = '#F8BD96',
	yellow = '#FAE3B0',
	green = '#ABE9B3',
	sky = '#89DCEB',
	teal = '#B5E8E0',
	gray = '#3E4452',
	bg = '#1A1826',
	fg = '#C3BAC6',
	diag_error = '#FB617E',
	diag_hint = '#9ED06C',
}
local vim_modes = {
	['n'] = { '  normal ', 'green' },
	['no'] = { '  n-oppd ', 'green' },
	['i'] = { '  insert ', 'sky' },
	['ic'] = { '  icompl ', 'sky' },
	['v'] = { '  visual ', 'flamingo' },
	['V'] = { '  v-Line ', 'flamingo' },
	[''] = { '  v-Blck ', 'flamingo' },
	['s'] = { '  select ', 'maroon' },
	['S'] = { '  s-Line ', 'maroon' },
	[''] = { '  s-Blck ', 'flamingo' },
	['R'] = { '  Rplace ', 'yellow' },
	['Rv'] = { '  VRplce ', 'yellow' },
	['c'] = { '  cmmand ', 'peach' },
	['cv'] = { '  vim ex ', 'peach' },
	['ce'] = { '  ex (r) ', 'peach' },
	['r'] = { '  prompt ', 'teal' },
	['rm'] = { '   more  ', 'teal' },
	['r?'] = { '  cnfirm ', 'teal' },
	['t'] = { '   term  ', 'red' },
	['!'] = { '  shell  ', 'red' },
}

local providers = {}

function providers.vi_mode()
	return vim_modes[vim.fn.mode()][1]
end
local function get_mode_color()
	return vim_modes[vim.fn.mode()][2]
end

function providers.git_branch()
	return vim.b.gitsigns_head .. ' '
end

local function git_status(type)
	local gsd = vim.b.gitsigns_status_dict
	return gsd and gsd[type] and gsd[type] > 0
end

function providers.git_diff_added()
	return tostring(vim.b.gitsigns_status_dict['added'])
end
function providers.git_diff_changed()
	return tostring(vim.b.gitsigns_status_dict['changed'])
end
function providers.git_diff_removed()
	return tostring(vim.b.gitsigns_status_dict['removed'])
end

function providers.file_info()
	local fname = vim.api.nvim_buf_get_name(0)
	local extn = vim.fn.fnamemodify(fname, ':e')
	local icon = require('nvim-web-devicons').get_icon(fname, extn, { default = true })

	fname = vim.fn.pathshorten(fname):gsub('^/U/%w+', '~')
	return string.format('%s %s %%m', icon, fname)
end

local function diag_count(ty)
	return vim.tbl_count(vim.diagnostic.get(0, { severity = ty }))
end
function providers.diag_error()
	return tostring(diag_count(vim.diagnostic.severity.ERROR)) .. ' '
end
function providers.diag_warn()
	return tostring(diag_count(vim.diagnostic.severity.WARN)) .. ' '
end
function providers.diag_info()
	return tostring(diag_count(vim.diagnostic.severity.INFO)) .. ' '
end
function providers.diag_hint()
	return tostring(diag_count(vim.diagnostic.severity.HINT)) .. ' '
end

local function pad(c, m)
	local padch = '·'
	return string.rep(padch, string.len(tostring(m)) - string.len(tostring(c)))
end

function providers.percent()
	local nb_lines = vim.fn.line('$')
	local line = vim.fn.line('.')
	local percent = math.floor(line * 100 / nb_lines)
	return string.format(' %s%d%%%% ', pad(percent, 100), percent)
end
function providers.ln_col()
	local nbline = vim.fn.line('$')
	local line = vim.fn.line('.')
	local col = vim.fn.col('.')
	return string.format('%s%d %s%d ', pad(line, nbline), line, pad(col, 100), col)
end

local components = { active = { {}, {}, {} }, inactive = { {} }, exclude = { {}, {} } }

components.active[1][1] = {
	provider = 'vi_mode',
	hl = function()
		return { fg = 'bg', bg = get_mode_color() }
	end,
}
components.active[1][2] = {
	provider = 'git_branch',
	enabled = function()
		return vim.b.gitsigns_status_dict
	end,
	icon = '  ',
	hl = { fg = 'yellow', bg = 'gray' },
}
components.active[1][3] = {
	provider = '',
	hl = { fg = '', bg = 'bg' },
}

components.active[1][4] = {
	provider = 'git_diff_added',
	enabled = function()
		return git_status('added')
	end,
	icon = '  ',
	hl = { fg = 'green', bg = 'bg' },
}
components.active[1][5] = {
	provider = 'git_diff_changed',
	enabled = function()
		return git_status('changed')
	end,
	icon = '  ',
	hl = { fg = 'yellow', bg = 'bg' },
}
components.active[1][6] = {
	provider = 'git_diff_removed',
	enabled = function()
		return git_status('removed')
	end,
	icon = '  ',
	hl = { fg = 'maroon', bg = 'bg' },
}

components.active[2][1] = {
	provider = 'file_info',
	hl = { fg = 'red', bg = 'bg' },
}

components.active[3][1] = {
	provider = 'diag_error',
	icon = ' ',
	enabled = function()
		return diag_count(vim.diagnostic.severity.ERROR) ~= 0
	end,
	hl = { fg = 'diag_error', bg = 'bg' },
}
components.active[3][2] = {
	provider = 'diag_warn',
	icon = ' ',
	enabled = function()
		return diag_count(vim.diagnostic.severity.WARN) ~= 0
	end,
	hl = { fg = 'yellow', bg = 'bg' },
}
components.active[3][3] = {
	provider = 'diag_info',
	icon = ' ',
	enabled = function()
		return diag_count(vim.diagnostic.severity.INFO) ~= 0
	end,
	hl = { fg = 'sky', bg = 'bg' },
}
components.active[3][4] = {
	provider = 'diag_hint',
	icon = ' ',
	enabled = function()
		return diag_count(vim.diagnostic.severity.HINT) ~= 0
	end,
	hl = { fg = 'diag_hint', bg = 'bg' },
}

components.active[3][5] = {
	provider = '  LSP ',
	enabled = function()
		return next(vim.lsp.buf_get_clients(0)) ~= nil
	end,
	hl = { fg = 'yellow', bg = 'gray' },
}

components.active[3][6] = {
	provider = 'percent',
	hl = { fg = 'bg', bg = 'green' },
}
components.active[3][7] = {
	provider = 'ln_col',
	hl = { fg = 'bg', bg = 'green' },
}

components.inactive[1][1] = {
	provider = ' %y ',
	hl = { fg = 'yellow', bg = 'gray' },
}
components.inactive[1][2] = {
	provider = '',
	hl = { fg = '', bg = 'bg' },
}

components.exclude[1][1] = {
	provider = 'vi_mode',
	hl = function()
		return { fg = 'bg', bg = get_mode_color() }
	end,
}
components.exclude[1][2] = {
	provider = '',
	hl = { fg = 'fg', bg = 'bg' },
}

components.exclude[2][1] = {
	provider = ' %y ',
	hl = { fg = 'yellow', bg = 'gray' },
}

local M, highlights = {}, {}

local function find_pattern_match(tbl, val)
	return tbl and next(vim.tbl_filter(function(pattern)
		return val:match(pattern)
	end, tbl))
end

local function force_inactive()
	return find_pattern_match({ '^NvimTree$', '^spectre_panel$', '^Outline$', '^tsplayground$' }, vim.bo.filetype)
		or find_pattern_match({ '^help$', '^quickfix$' }, vim.bo.buftype)
end

local function excluded()
	return find_pattern_match({ '^prompt$', '^terminal$' }, vim.bo.buftype)
end

local function parse_hl(hl, parent_hl)
	parent_hl = parent_hl or {}
	local fg = hl.fg or parent_hl.fg or colors.fg
	local bg = hl.bg or parent_hl.bg or colors.bg

	if colors[fg] then
		fg = colors[fg]
	end
	if colors[bg] then
		bg = colors[bg]
	end
	return { fg = fg, bg = bg }
end
local function get_hlname(hl, parent_hl)
	hl = parse_hl(hl, parent_hl)
	local fg_str, bg_str = hl.fg:sub(2), hl.bg:sub(2)

	local hlname = string.format('StatusComponent_%s_%s', fg_str, bg_str)
	if not highlights[hlname] then
		vim.api.nvim_set_hl(0, hlname, { fg = hl.fg, bg = hl.bg })
		highlights[hlname] = true
	end
	return hlname
end

local function parse_component(component)
	if component.enabled ~= nil and not component.enabled() then
		return ''
	end

	local hl = type(component.hl) == 'function' and parse_hl(component.hl()) or parse_hl(component.hl)
	local provider = component.provider
	if not providers[provider] then
		return string.format('%%#%s#%s', get_hlname(hl), provider)
	end
	local pd = providers[provider]()
	if pd ~= '' then
		local icon = component.icon == nil and '' or string.format('%%#%s#%s', get_hlname(hl), component.icon)
		return string.format('%s%%#%s#%s', icon, get_hlname(hl), pd)
	end
	return ''
end

function M.generate_statusline(is_active)
	local statusline_type
	if is_active and not force_inactive() then
		statusline_type = 'active'
	elseif force_inactive() then
		statusline_type = 'inactive'
	else
		statusline_type = 'exclude'
	end

	local sections, component_strs = components[statusline_type], {}

	for i, section in ipairs(sections) do
		component_strs[i] = {}
		for j, component in ipairs(section) do
			component_strs[i][j] = parse_component(component)
		end
	end

	local section_strs = {}
	for _, section_component_strs in ipairs(component_strs) do
		section_strs[#section_strs + 1] = table.concat(section_component_strs)
	end
	return table.concat(section_strs, '%=')
end

function M.setup()
	return M.generate_statusline(vim.api.nvim_get_current_win() == tonumber(vim.g.actual_curwin))
end

vim.opt.showmode = false
vim.g.qf_disable_statusline = true
vim.opt.statusline = '%{%v:lua.statusline.setup()%}'
_G.statusline = M
