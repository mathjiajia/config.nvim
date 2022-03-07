local M = {}

local vim_modes = {
	['n'] = '%#MatchParen# Normal %#Statusline#',
	['no'] = ' N-OpPd ',
	['i'] = '%#Function# Insert %#Statusline#',
	['ic'] = '%#Function# ICompl %#Statusline#',
	['v'] = ' Visual ',
	['V'] = ' V-Line ',
	[''] = ' V-Blck ',
	['R'] = ' Rplace ',
	['Rv'] = ' V-Rplce ',
	['s'] = ' Select ',
	['S'] = ' S-Line ',
	[''] = ' S-Blck ',
	['c'] = '%#Constant# Cmmand %#Statusline#',
	['cv'] = ' Vim Ex ',
	['ce'] = ' Ex (r) ',
	['r'] = ' Prompt ',
	['rm'] = '  More  ',
	['r?'] = ' Cnfirm ',
	['t'] = '  Term  ',
	['!'] = ' Shell  ',
}

local force_inactive = {
	filetypes = {
		'^help$',
		'^NvimTree$',
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
	return vim_modes[vim.api.nvim_get_mode().mode]
end

function providers.git_branch()
	if vim.b.gitsigns_head then
		return '  ' .. vim.b.gitsigns_head
	end
	return ''
end

local function git_status(type)
	local gsd = vim.b.gitsigns_status_dict
	return gsd and gsd[type] and gsd[type] > 0
end
function providers.git_diff_added()
	return '  ' .. tostring(vim.b.gitsigns_status_dict['added'])
end
function providers.git_diff_changed()
	return ' 柳' .. tostring(vim.b.gitsigns_status_dict['changed'])
end
function providers.git_diff_removed()
	return '  ' .. tostring(vim.b.gitsigns_status_dict['removed'])
end

local function diag_count(ty)
	return vim.tbl_count(vim.diagnostic.get(0, { severity = ty }))
end
function providers.diag_error()
	return '  ' .. tostring(diag_count(vim.diagnostic.severity.ERROR))
end
function providers.diag_warn()
	return '  ' .. tostring(diag_count(vim.diagnostic.severity.WARN))
end
function providers.diag_info()
	return '  ' .. tostring(diag_count(vim.diagnostic.severity.INFO))
end
function providers.diag_hint()
	return '  ' .. tostring(diag_count(vim.diagnostic.severity.HINT))
end

local components = { active = { {}, {}, {} }, inactive = { {} } }

components.active[1][1] = { provider = 'vi_mode' }
components.active[1][2] = {
	provider = 'git_branch',
	enabled = function()
		return vim.b.gitsigns_status_dict
	end,
}
components.active[1][3] = {
	provider = 'git_diff_added',
	enabled = function()
		return git_status('added')
	end,
}
components.active[1][4] = {
	provider = 'git_diff_changed',
	enabled = function()
		return git_status('changed')
	end,
}
components.active[1][5] = {
	provider = 'git_diff_removed',
	enabled = function()
		return git_status('removed')
	end,
}

components.active[2][1] = { provider = '%F%m ' }

components.active[3][1] = {
	provider = 'diag_error',
	enabled = function()
		return diag_count(vim.diagnostic.severity.ERROR) ~= 0
	end,
}
components.active[3][2] = {
	provider = 'diag_warn',
	enabled = function()
		return diag_count(vim.diagnostic.severity.WARN) ~= 0
	end,
}
components.active[3][3] = {
	provider = 'diag_info',
	enabled = function()
		return diag_count(vim.diagnostic.severity.INFO) ~= 0
	end,
}
components.active[3][4] = {
	provider = 'diag_hint',
	enabled = function()
		return diag_count(vim.diagnostic.severity.HINT) ~= 0
	end,
}
components.active[3][5] = { provider = ' [%3p%%] Ln %-3l Col %-3c ' }

components.inactive[1][1] = { provider = ' %y ' }

local function find_pattern_match(tbl, val)
	return tbl and next(vim.tbl_filter(function(pattern)
		return val:match(pattern)
	end, tbl))
end
local function is_forced_inactive()
	return find_pattern_match(force_inactive.filetypes, vim.bo.filetype)
		or find_pattern_match(force_inactive.buftypes, vim.bo.buftype)
end

local function parse_component(component)
	if component.enabled ~= nil and not component.enabled() then
		return ''
	end

	local provider = component.provider
	if not providers[provider] then
		return provider
	end
	local pd = providers[provider]()
	return pd ~= '' and pd or ''
end

function M.generate_statusline(is_active)
	local statusline_type
	if is_active and not is_forced_inactive() then
		statusline_type = 'active'
	else
		statusline_type = 'inactive'
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
