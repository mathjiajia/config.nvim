local windline = require('windline')
local helper = require('windline.helpers')
local sep = helper.separators
local b_components = require('windline.components.basic')
local state = _G.WindLine.state
local vim_components = require('windline.components.vim')
local HSL = require('wlanimation.utils')

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')
local line_col = function()
	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	return string.format(' Ln %s, Col %s ', row, col + 1)
end

local hl_list = {
	Black = { 'white', 'black' },
	White = { 'black', 'white' },
	Normal = { 'NormalFg', 'NormalBg' },
	Inactive = { 'InactiveFg', 'InactiveBg' },
	Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

local airline_colors = {}

airline_colors.a = {
	NormalSep = { 'magenta_a', 'magenta_b' },
	InsertSep = { 'green_a', 'green_b' },
	VisualSep = { 'yellow_a', 'yellow_b' },
	ReplaceSep = { 'blue_a', 'blue_b' },
	CommandSep = { 'red_a', 'red_b' },
	Normal = { 'black', 'magenta_a' },
	Insert = { 'black', 'green_a' },
	Visual = { 'black', 'yellow_a' },
	Replace = { 'black', 'blue_a' },
	Command = { 'black', 'red_a' },
}

airline_colors.b = {
	NormalSep = { 'magenta_b', 'magenta_c' },
	InsertSep = { 'green_b', 'green_c' },
	VisualSep = { 'yellow_b', 'yellow_c' },
	ReplaceSep = { 'blue_b', 'blue_c' },
	CommandSep = { 'red_b', 'red_c' },
	Normal = { 'white', 'magenta_b' },
	Insert = { 'white', 'green_b' },
	Visual = { 'white', 'yellow_b' },
	Replace = { 'white', 'blue_b' },
	Command = { 'white', 'red_b' },
}

airline_colors.c = {
	NormalSep = { 'magenta_c', 'NormalBg' },
	InsertSep = { 'green_c', 'NormalBg' },
	VisualSep = { 'yellow_c', 'NormalBg' },
	ReplaceSep = { 'blue_c', 'NormalBg' },
	CommandSep = { 'red_c', 'NormalBg' },
	Normal = { 'white', 'magenta_c' },
	Insert = { 'white', 'green_c' },
	Visual = { 'white', 'yellow_c' },
	Replace = { 'white', 'blue_c' },
	Command = { 'white', 'red_c' },
}

basic.divider = { b_components.divider, hl_list.Normal }

local width_breakpoint = 100

basic.section_a = {
	hl_colors = airline_colors.a,
	text = function(_, _, width)
		if width > width_breakpoint then
			return {
				{ ' ' .. state.mode[1] .. ' ', state.mode[2] },
				{ sep.right_filled, state.mode[2] .. 'Sep' },
			}
		end
		return {
			{ ' ' .. state.mode[1]:sub(1, 1) .. ' ', state.mode[2] },
			{ sep.right_filled, state.mode[2] .. 'Sep' },
		}
	end,
}

basic.section_b = {
	hl_colors = airline_colors.b,
	text = function(bufnr, _, width)
		if width > width_breakpoint and git_comps.is_git(bufnr) then
			return {
				{ git_comps.git_branch(), state.mode[2] },
				{ ' ', '' },
				{ sep.right_filled, state.mode[2] .. 'Sep' },
			}
		end
		return { { sep.right_filled, state.mode[2] .. 'Sep' } }
	end,
}

basic.section_c = {
	hl_colors = airline_colors.c,
	text = function()
		return {
			{ ' ', state.mode[2] },
			{ b_components.cache_file_type { icon = true } },
			{ ' ' },
			{ sep.right_filled, state.mode[2] .. 'Sep' },
		}
	end,
}

basic.section_x = {
	hl_colors = airline_colors.c,
	text = function(bufnr, _, width)
		if width > width_breakpoint and lsp_comps.check_lsp(bufnr) then
			return {
				{ sep.left_filled, state.mode[2] .. 'Sep' },
				{ ' ', state.mode[2] },
				{ lsp_comps.lsp_name { seprator = '|' } },
				{ ' ' },
			}
		end
		return {
			{ sep.left_filled, state.mode[2] .. 'Sep' },
		}
	end,
}

basic.section_y = {
	hl_colors = airline_colors.b,
	text = function(_, _, width)
		if width > width_breakpoint then
			return {
				{ sep.left_filled, state.mode[2] .. 'Sep' },
				{ b_components.progress_lua, state.mode[2] },
				{ ' ' },
			}
		end
		return { { sep.left_filled, state.mode[2] .. 'Sep' } }
	end,
}

basic.section_z = {
	hl_colors = airline_colors.a,
	text = function(_, _, width)
		if width > width_breakpoint then
			return {
				{ sep.left_filled, state.mode[2] .. 'Sep' },
				{ line_col, state.mode[2] },
			}
		end
		return {
			{ sep.left_filled, state.mode[2] .. 'Sep' },
			{ b_components.line_col_lua, state.mode[2] },
		}
	end,
}

basic.lsp_diagnos = {
	name = 'diagnostic',
	hl_colors = {
		diag_error = { 'diag_error', 'NormalBg' },
		diag_warning = { 'diag_warning', 'NormalBg' },
		diag_info = { 'diag_info', 'NormalBg' },
		diag_hint = { 'diag_hint', 'NormalBg' },
	},
	text = function(bufnr)
		if lsp_comps.check_lsp(bufnr) then
			return {
				{ lsp_comps.lsp_error { format = '  %s', show_zero = false }, 'diag_error' },
				{ lsp_comps.lsp_warning { format = '  %s', show_zero = false }, 'diag_warning' },
				{ lsp_comps.lsp_info { format = '  %s', show_zero = false }, 'diag_info' },
				{ lsp_comps.lsp_hint { format = '  %s', show_zero = false }, 'diag_hint' },
			}
		end
		return { ' ', 'red' }
	end,
}

basic.git = {
	name = 'git',
	width = width_breakpoint,
	hl_colors = {
		git_added = { 'git_added', 'NormalBg' },
		git_removed = { 'git_removed', 'NormalBg' },
		git_changed = { 'git_changed', 'NormalBg' },
	},
	text = function(bufnr)
		if git_comps.is_git(bufnr) then
			return {
				{ git_comps.diff_added { format = ' +%s' }, 'git_added' },
				{ git_comps.diff_removed { format = ' -%s' }, 'git_removed' },
				{ git_comps.diff_changed { format = ' ~%s' }, 'git_changed' },
			}
		end
		return ''
	end,
}

local quickfix = {
	filetypes = { 'qf' },
	active = {
		{ '🚦 Quickfix ', { 'white', 'black' } },
		{ helper.separators.slant_right, { 'black', 'black_light' } },
		{
			function()
				return vim.fn.getqflist({ title = 0 }).title
			end,
			{ 'cyan', 'black_light' },
		},
		{ ' Total : %L ', { 'cyan', 'black_light' } },
		{ helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
		{ ' ', { 'InactiveFg', 'InactiveBg' } },
		basic.divider,
		{ helper.separators.slant_right, { 'InactiveBg', 'black' } },
		{ ' ', { 'white', 'black' } },
	},
	always_active = true,
	show_last_status = true,
}

local explorer = {
	filetypes = { 'aerial', 'NvimTree', 'tsplayground' },
	active = {
		{ '  ', { 'white', 'magenta_b' } },
		{ helper.separators.slant_right, { 'magenta_b', 'NormalBg' } },
		{ b_components.divider, '' },
		{ b_components.file_name(''), { 'NormalFg', 'NormalBg' } },
	},
	always_active = true,
	show_last_status = true,
}

local default = {
	filetypes = { 'default' },
	active = {
		basic.section_a,
		basic.section_b,
		basic.section_c,
		basic.git,
		{ vim_components.search_count(), { 'cyan', 'NormalBg' } },
		basic.divider,
		basic.lsp_diagnos,
		basic.section_x,
		basic.section_y,
		basic.section_z,
	},
	inactive = {
		{ b_components.full_file_name, hl_list.Inactive },
		{ b_components.divider, hl_list.Inactive },
		{ b_components.line_col, hl_list.Inactive },
		{ b_components.progress, hl_list.Inactive },
	},
}

windline.setup {
	colors_name = function(colors)
		local mod = function(c, value)
			if vim.o.background == 'light' then
				return HSL.rgb_to_hsl(c):tint(value):to_rgb()
			end
			return HSL.rgb_to_hsl(c):shade(value):to_rgb()
		end

		local colors = {
			black = '#302D41',
			red = '#F28FAD',
			green = '#ABE9B3',
			yellow = '#FAE3B0',
			blue = '#96CDFB',
			magenta = '#E8A2AF',
			cyan = '#B5E8E0',
			white = '#D9E0EE',
			-- black_light = '',
			-- red_light = '',
			-- green_light = '',
			-- yellow_light = '',
			-- blue_light = '',
			-- magenta_light = '',
			-- cyan_light = '',
			-- white_light = '',
			NormalFg = '#D9E0EE',
			NormalBg = '#1A1826',
			ActiveFg = '#D9E0EE',
			ActiveBg = '#1E1E2E',
			InactiveFg = '#D9E0EE',
			InactiveBg = '#1E1E2E',

			git_added = '#ABE9B3',
			git_removed = '#F28FAD',
			git_changed = '#FAE3B0',

			diag_error = '#FB617E',
			diag_warning = '#FAE3B0',
			diag_info = '#B5E8E0',
			diag_hint = '#9ed06c',

			magenta_a = '#96CDFB',
			magenta_b = mod('#96CDFB', 0.5),
			magenta_c = mod('#96CDFB', 0.7),

			yellow_a = '#FAE3B0',
			yellow_b = mod('#FAE3B0', 0.5),
			yellow_c = mod('#FAE3B0', 0.7),

			blue_a = '#F8BD96',
			blue_b = mod('#F8BD96', 0.5),
			blue_c = mod('#F8BD96', 0.7),

			green_a = '#ABE9B3',
			green_b = mod('#ABE9B3', 0.5),
			green_c = mod('#ABE9B3', 0.7),

			red_a = '#F28FAD',
			red_b = mod('#F28FAD', 0.5),
			red_c = mod('#F28FAD', 0.7),
		}

		return colors
	end,
	statuslines = {
		default,
		quickfix,
		explorer,
	},
}

-- call it after you setup windline.
-- default config
require('wlfloatline').setup {
	interval = 300,
	ui = {
		active_char = '▁',
		active_color = 'blue',
		active_hl = nil,
	},
	skip_filetypes = {
		-- 'NvimTree',
		'lir',
	},
}
