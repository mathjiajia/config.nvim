local colors = {
	flamingo = '#F2CDCD',
	red = '#F28FAD',
	maroon = '#E8A2AF',
	peach = '#F8BD96',
	yellow = '#FAE3B0',
	green = '#ABE9B3',
	sky = '#89DCEB',
	teal = '#B5E8E0',
	gray = '#988BA2',
	black = '#302D41',
	bg = '#1A1826',
	fg = '#C3BAC6',
	diag_error = '#FB617E',
	diag_hint = '#9ED06C',
}
local vim_modes = {
	['n'] = { 'Normal', 'green' },
	['no'] = { 'OP', 'green' },
	['nov'] = { 'OP', 'green' },
	['noV'] = { 'OP', 'green' },
	['no'] = { 'OP', 'green' },
	['niI'] = { 'Normal', 'green' },
	['niR'] = { 'Normal', 'green' },
	['niV'] = { 'Normal', 'green' },
	['nt'] = { 'Normal', 'green' },
	['v'] = { 'Visual', 'flamingo' },
	['vs'] = { 'Visual', 'flamingo' },
	['V'] = { 'Lines', 'flamingo' },
	['Vs'] = { 'Lines', 'flamingo' },
	[''] = { 'Block', 'flamingo' },
	['s'] = { 'Block', 'flamingo' },
	['s'] = { 'Select', 'maroon' },
	['S'] = { 'Select', 'maroon' },
	[''] = { 'Block', 'flamingo' },
	['i'] = { 'Insert', 'red' },
	['ic'] = { 'Insert', 'red' },
	['ix'] = { 'Insert', 'red' },
	['R'] = { 'Replace', 'maroon' },
	['Rc'] = { 'Replace', 'maroon' },
	['Rx'] = { 'Replace', 'maroon' },
	['Rv'] = { 'V-Replace', 'maroon' },
	['Rvc'] = { 'V-Replace', 'maroon' },
	['Rvx'] = { 'V-Replace', 'maroon' },
	['c'] = { 'Command', 'peach' },
	['cv'] = { 'Command', 'peach' },
	['r'] = { 'Enter', 'teal' },
	['rm'] = { 'More', 'teal' },
	['r?'] = { 'Confirm', 'teal' },
	['!'] = { 'Shell', 'red' },
	['t'] = { 'Terminal', 'red' },
	['null'] = { 'None', 'yellow' },
}

local force_inactive = {
	filetypes = {
		-- '^aerial$',
		'^help$',
		'^NvimTree$',
		'^packer$',
		'^qf$',
		'^spectre_panel$',
		'^Outline$',
		'^TelescopePrompt$',
		'^tsplayground$',
	},
	buftypes = { '^terminal$' },
}

local providers = {}

function providers.vi_mode()
	return vim_modes[vim.api.nvim_get_mode().mode][1] .. ' '
end

local function get_mode_color()
	return vim_modes[vim.api.nvim_get_mode().mode][2]
end

function providers.git_branch()
	return vim.b.gitsigns_head .. ' ' or ''
end

local function git_status(type)
	local gsd = vim.b.gitsigns_status_dict
	return gsd and gsd[type] and gsd[type] > 0
end

function providers.git_diff_added()
	return git_status('added') and tostring(vim.b.gitsigns_status_dict['added']) or ''
end
function providers.git_diff_changed()
	return git_status('changed') and tostring(vim.b.gitsigns_status_dict['changed']) or ''
end
function providers.git_diff_removed()
	return git_status('removed') and tostring(vim.b.gitsigns_status_dict['removed']) or ''
end

function providers.lsp_client_names()
	local clients = {}
	for _, client in ipairs(vim.lsp.buf_get_clients(0)) do
		clients[#clients + 1] = client.name
	end
	return table.concat(clients, ' • ')
end

local function diagnostics(ty) -- Common function used by the diagnostics providers
	local count = vim.tbl_count(vim.diagnostic.get(0, { severity = ty }))
	return count ~= 0 and tostring(count) or ''
end

function providers.diagnostic_errors()
	return diagnostics(vim.diagnostic.severity.ERROR)
end
function providers.diagnostic_warnings()
	return diagnostics(vim.diagnostic.severity.WARN)
end
function providers.diagnostic_info()
	return diagnostics(vim.diagnostic.severity.INFO)
end
function providers.diagnostic_hints()
	return diagnostics(vim.diagnostic.severity.HINT)
end

function providers.file_icon()
	local name = vim.api.nvim_buf_get_name(0)
	local ext = vim.fn.fnamemodify(name, ':e')
	local icon = require('nvim-web-devicons').get_icon(name, ext, { default = true })
	return ' ' .. icon
end
function providers.treesitter()
	local bufnr = vim.api.nvim_get_current_buf()
	return vim.treesitter.highlighter.active[bufnr] and ' 侮' or ''
end

function providers.file_dict()
	return vim.fn.fnamemodify(vim.fn.getcwd(), ':t') .. ' '
end

local components = { active = { {}, {}, {} }, inactive = { {}, {} } }

components.active[1][1] = {
	provider = 'vi_mode',
	icon = '  ',
	hl = function()
		return { fg = 'black', bg = get_mode_color() }
	end,
}
components.active[1][2] = {
	provider = 'git_branch',
	enabled = function()
		return vim.b.gitsigns_status_dict
	end,
	icon = '  ',
	hl = { fg = 'black', bg = 'sky' },
}
components.active[1][3] = {
	provider = '',
	hl = { fg = 'sky', bg = 'black' },
}

components.active[1][4] = {
	provider = 'git_diff_added',
	enabled = function()
		return git_status('added')
	end,
	icon = '  ',
	hl = { fg = 'green', bg = 'black' },
}
components.active[1][5] = {
	provider = 'git_diff_changed',
	enabled = function()
		return git_status('changed')
	end,
	icon = '  ',
	hl = { fg = 'yellow', bg = 'black' },
}
components.active[1][6] = {
	provider = 'git_diff_removed',
	enabled = function()
		return git_status('removed')
	end,
	icon = '  ',
	hl = { fg = 'maroon', bg = 'black' },
}

components.active[2][1] = {
	provider = 'lsp_client_names',
	icon = ' ',
	hl = { fg = 'gray', bg = 'black' },
}

components.active[2][2] = {
	provider = 'diagnostic_errors',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.ERROR)
	end,
	hl = { fg = 'diag_error', bg = 'black' },
}
components.active[2][3] = {
	provider = 'diagnostic_warnings',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.WARN)
	end,
	hl = { fg = 'yellow', bg = 'black' },
}
components.active[2][4] = {
	provider = 'diagnostic_info',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.INFO)
	end,
	hl = { fg = 'sky', bg = 'black' },
}
components.active[2][5] = {
	provider = 'diagnostic_hints',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.HINT)
	end,
	hl = { fg = 'diag_hint', bg = 'black' },
}

components.active[3][1] = {
	provider = '[%3p%%]',
	hl = { fg = 'fg', bg = 'black' },
}
components.active[3][2] = {
	provider = ' %3l:%-3c ',
	hl = { fg = 'fg', bg = 'black' },
}

components.active[3][3] = {
	provider = 'file_dict',
	icon = '  ',
	hl = { fg = 'black', bg = 'flamingo' },
}

components.active[3][4] = {
	provider = 'file_icon',
	hl = { fg = 'black', bg = 'maroon' },
}
components.active[3][5] = {
	provider = ' %t%m ',
	hl = { fg = 'black', bg = 'maroon' },
}
components.active[3][6] = {
	provider = 'treesitter',
	hl = { fg = 'black', bg = 'green' },
}

components.inactive[1][1] = {
	provider = ' %y ',
	hl = { fg = 'black', bg = 'maroon' },
}
components.inactive[1][2] = {
	provider = '',
	hl = { fg = '', bg = 'black' },
}

local M = {}
local highlights = {}

local function find_pattern_match(tbl, val)
	return tbl and next(vim.tbl_filter(function(pattern)
		return val:match(pattern)
	end, tbl))
end

local function is_forced_inactive()
	return find_pattern_match(force_inactive.filetypes, vim.bo.filetype)
		or find_pattern_match(force_inactive.buftypes, vim.bo.buftype)
end

local function parse_hl(hl, parent_hl)
	parent_hl = parent_hl or {}
	local fg = hl.fg or parent_hl.fg
	local bg = hl.bg or parent_hl.bg

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
	if is_active and not is_forced_inactive() then
		statusline_type = 'active'
	else
		statusline_type = 'inactive'
	end

	local sections = components[statusline_type]
	if not sections then
		return ''
	end

	local component_strs, component_indices = {}, {}

	for i, section in ipairs(sections) do
		component_strs[i] = {}

		for j, component in ipairs(section) do
			local component_str = parse_component(component)

			component_strs[i][j] = component_str
			component_indices[#component_indices + 1] = { i, j }
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

vim.g.qf_disable_statusline = true
vim.opt.statusline = '%{%v:lua.statusline.setup()%}'
_G.statusline = M

return M
