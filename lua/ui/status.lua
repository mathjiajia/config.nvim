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
	fg = '#D9E0EE',
	diag_error = '#FB617E',
	diag_hint = '#9ed06c',
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
		'^aerial$',
		'^help$',
		'^NvimTree$',
		'^packer$',
		'^qf$',
		'^spectre_panel$',
		'^TelescopePrompt$',
		'^tsplayground$',
	},
	buftypes = { '^terminal$' },
}

local providers = {}

function providers.vi_mode()
	return vim_modes[vim.api.nvim_get_mode().mode][1]
end

local function get_mode_color()
	return vim_modes[vim.api.nvim_get_mode().mode][2]
end

function providers.git_branch()
	return vim.b.gitsigns_head or ''
end

local function git_diff(type) -- Common function used by the git providers
	local gsd = vim.b.gitsigns_status_dict
	if gsd and gsd[type] and gsd[type] > 0 then
		return tostring(gsd[type])
	end
	return ''
end

function providers.git_diff_added()
	return git_diff('added')
end
function providers.git_diff_removed()
	return git_diff('removed')
end
function providers.git_diff_changed()
	return git_diff('changed')
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
	return icon
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
	provider = '',
	enabled = function()
		return not vim.b.gitsigns_status_dict
	end,
	hl = function()
		return { fg = get_mode_color(), bg = 'black' }
	end,
}
components.active[1][3] = {
	provider = '',
	enabled = function()
		return vim.b.gitsigns_status_dict
	end,
	hl = function()
		return { fg = get_mode_color(), bg = 'sky' }
	end,
}
components.active[1][4] = {
	provider = 'git_branch',
	enabled = vim.b.gitsigns_status_dict,
	icon = '  ',
	hl = { fg = 'black', bg = 'sky' },
	right_sep = '█',
	truncate_hide = true,
	priority = 2,
}
components.active[1][5] = {
	provider = '',
	enabled = function()
		return vim.b.gitsigns_status_dict
	end,
	hl = { fg = 'sky', bg = 'black' },
}

components.active[1][6] = {
	provider = 'git_diff_added',
	enabled = function()
		return vim.b.gitsigns_status_dict
			and vim.b.gitsigns_status_dict['added']
			and vim.b.gitsigns_status_dict['added'] > 0
	end,
	icon = '  ',
	hl = { fg = 'green', bg = 'black' },
	truncate_hide = true,
	priority = 1,
}
components.active[1][7] = {
	provider = 'git_diff_changed',
	enabled = function()
		return vim.b.gitsigns_status_dict
			and vim.b.gitsigns_status_dict['changed']
			and vim.b.gitsigns_status_dict['changed'] > 0
	end,
	icon = '  ',
	hl = { fg = 'yellow', bg = 'black' },
	truncate_hide = true,
	priority = 1,
}
components.active[1][8] = {
	provider = 'git_diff_removed',
	enabled = function()
		return vim.b.gitsigns_status_dict
			and vim.b.gitsigns_status_dict['removed']
			and vim.b.gitsigns_status_dict['removed'] > 0
	end,
	icon = '  ',
	hl = { fg = 'maroon', bg = 'black' },
	truncate_hide = true,
	priority = 1,
}

components.active[2][1] = {
	provider = 'lsp_client_names',
	icon = ' ',
	hl = { fg = 'gray', bg = 'black' },
	truncate_hide = true,
}

components.active[2][2] = {
	provider = 'diagnostic_errors',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.ERROR)
	end,
	hl = { fg = 'diag_error', bg = 'black' },
	truncate_hide = true,
}
components.active[2][3] = {
	provider = 'diagnostic_warnings',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.WARN)
	end,
	hl = { fg = 'yellow', bg = 'black' },
	truncate_hide = true,
}
components.active[2][4] = {
	provider = 'diagnostic_info',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.INFO)
	end,
	hl = { fg = 'sky', bg = 'black' },
	truncate_hide = true,
}
components.active[2][5] = {
	provider = 'diagnostic_hints',
	icon = '  ',
	enabled = function()
		return diagnostics(vim.diagnostic.severity.HINT)
	end,
	hl = { fg = 'diag_hint', bg = 'black' },
	truncate_hide = true,
}

components.active[3][1] = {
	provider = '%3p%%',
	hl = { fg = 'gray', bg = 'black' },
	truncate_hide = true,
	priority = 1,
}
components.active[3][2] = {
	provider = ' %3l:%-3c ',
	hl = { fg = 'gray', bg = 'black' },
	truncate_hide = true,
	priority = 1,
}

components.active[3][3] = {
	provider = 'file_dict',
	icon = '  ',
	hl = { fg = 'black', bg = 'flamingo' },
	left_sep = { str = '', hl = { fg = 'flamingo', bg = 'black' } },
}

components.active[3][4] = {
	provider = 'file_icon',
	hl = { fg = 'black', bg = 'maroon' },
	left_sep = { str = '', hl = { fg = 'maroon', bg = 'flamingo' } },
	truncate_hide = true,
	priority = 3,
}
components.active[3][5] = {
	provider = ' %y ',
	hl = { fg = 'black', bg = 'maroon' },
	truncate_hide = true,
	priority = 3,
}
components.active[3][6] = {
	provider = 'treesitter',
	hl = { fg = 'black', bg = 'green' },
	left_sep = { str = '', hl = { fg = 'green', bg = 'maroon' } },
	truncate_hide = true,
	priority = 2,
}

components.inactive[1][1] = {
	provider = ' %y',
	hl = { fg = 'black', bg = 'maroon' },
	right_sep = { str = '', hl = { fg = 'maroon', bg = 'black' } },
}

local M = {}
local highlights = {}

local function find_pattern_match(tbl, val)
	return tbl and next(vim.tbl_filter(function(pattern)
		return val:match(pattern)
	end, tbl))
end

local function is_forced_inactive()
	-- local bufname = vim.api.nvim_buf_get_name(0)
	return find_pattern_match(force_inactive.filetypes, vim.bo.filetype)
		or find_pattern_match(force_inactive.buftypes, vim.bo.buftype)
	-- or find_pattern_match(force_inactive.bufnames, bufname)
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

local function parse_sep(sep, parent_bg)
	if sep == nil then
		return ''
	end

	if type(sep) == 'table' then
		return string.format('%%#%s#%s', get_hlname(sep.hl), sep.str)
	else
		return string.format('%%#%s#%s', get_hlname { fg = parent_bg, bg = colors.bg }, sep)
	end
end

local function parse_component(component)
	if component.enabled ~= nil and not component.enabled() then
		return ''
	end

	local hl
	if type(component.hl) == 'function' then
		hl = parse_hl(component.hl())
	else
		hl = parse_hl(component.hl)
	end

	local provider = component.provider
	if provider then
		local pd = providers[provider] and providers[provider]() or provider
		if pd ~= '' then
			local icon = component.icon == nil and '' or string.format('%%#%s#%s', get_hlname(hl, hl), component.icon)
			local left_str = parse_sep(component.left_sep, hl.bg)
			local right_str = parse_sep(component.right_sep, hl.bg)
			return string.format('%s%s%%#%s#%s%s', left_str, icon, get_hlname(hl), pd, right_str)
		end
	end
	return ''
end

local eval_statusline_opts = { maxwidth = 0 }
local function get_component_width(component_str)
	if not vim.api.nvim_eval_statusline then
		return 0
	end
	return vim.api.nvim_eval_statusline(component_str, eval_statusline_opts).width
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

	local component_strs, component_indices, component_widths = {}, {}, {}
	local statusline_width = 0

	for i, section in ipairs(sections) do
		component_strs[i] = {}
		component_widths[i] = {}

		for j, component in ipairs(section) do
			local component_str = parse_component(component)
			local component_width = get_component_width(component_str)

			component_strs[i][j] = component_str
			component_widths[i][j] = component_width
			statusline_width = statusline_width + component_width

			component_indices[#component_indices + 1] = { i, j }
		end
	end

	local window_width = vim.api.nvim_win_get_width(0)
	if statusline_width > window_width then
		-- First, sort the component indices in ascending order of the priority of the components that the indices refer to
		table.sort(component_indices, function(first, second)
			local first_priority = sections[first[1]][first[2]].priority or 0
			local second_priority = sections[second[1]][second[2]].priority or 0
			return first_priority < second_priority
		end)
		-- If statusline doesn't fit within window, remove components with truncate_hide set to true until it does
		for _, indices in ipairs(component_indices) do
			local section, number = indices[1], indices[2]
			local component = sections[section][number]

			if component.truncate_hide then
				statusline_width = statusline_width - component_widths[section][number]
				component_strs[section][number] = ''
				component_widths[section][number] = 0
			end
			if statusline_width <= window_width then
				break
			end
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
