local lsp = require('feline.providers.lsp')
local lsp_severity = vim.diagnostic.severity
local vi_mode_utils = require('feline.providers.vi_mode')

local force_inactive = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}
local disable = {
	filetypes = {},
	buftypes = {},
	bufnames = {},
}

local custom_providers = {}
local components = {
	active = { {}, {}, {} },
	inactive = { {}, {} },
}
local conditional_components = {}

local colors = {
	flamingo = '#F2CDCD', -- Flamingo
	mauve = '#DDB6F2', -- Mauve
	red = '#F28FAD', -- Red
	maroon = '#E8A2AF', -- Maroon
	peach = '#F8BD96', -- Peach
	yellow = '#FAE3B0', -- Yellow
	green = '#ABE9B3', -- Green
	sky = '#89DCEB', -- Sky
	teal = '#B5E8E0', -- Teal
	lavender = '#C9CBFF', -- Lavender
	gray = '#988BA2', -- Gray
	black = '#302D41', -- Black

	bg = '#1A1826',
	fg = '#D9E0EE',

	-- Diagnostic Colors
	diag_error = '#FB617E',
	diag_hint = '#9ed06c',
}

local vi_mode_colors = {
	['NORMAL'] = 'green',
	['OP'] = 'green',
	['INSERT'] = 'red',
	['VISUAL'] = 'flamingo',
	['LINES'] = 'flamingo',
	['BLOCK'] = 'flamingo',
	['REPLACE'] = 'maroon',
	['V-REPLACE'] = 'maroon',
	['ENTER'] = 'teal',
	['MORE'] = 'teal',
	['SELECT'] = 'maroon',
	['COMMAND'] = 'peach',
	['SHELL'] = 'red',
	['TERM'] = 'red',
	['NONE'] = 'yellow',
}

-- local mode_alias = {
-- 	['n'] = 'Normal',
-- 	['no'] = 'OP',
-- 	['nov'] = 'OP',
-- 	['noV'] = 'OP',
-- 	['no'] = 'OP',
-- 	['niI'] = 'Normal',
-- 	['niR'] = 'Normal',
-- 	['niV'] = 'Normal',
-- 	['v'] = 'Visual',
-- 	['V'] = 'Line',
-- 	[''] = 'Bolck',
-- 	['s'] = 'Select',
-- 	['S'] = 'Select',
-- 	[''] = 'Bolck',
-- 	['i'] = 'Insert',
-- 	['ic'] = 'Insert',
-- 	['ix'] = 'Insert',
-- 	['R'] = 'Replace',
-- 	['Rc'] = 'Replace',
-- 	['Rv'] = 'V-Replace',
-- 	['Rx'] = 'Replace',
-- 	['c'] = 'Command',
-- 	['cv'] = 'Command',
-- 	['ce'] = 'Command',
-- 	['r'] = 'Enter',
-- 	['rm'] = 'More',
-- 	['r?'] = 'Confirm',
-- 	['!'] = 'Shell',
-- 	['t'] = 'Terminal',
-- 	['nt'] = 'Terminal',
-- 	['null'] = 'None',
-- }

local function any_git_changes()
	local gst = vim.b.gitsigns_status_dict -- git stats
	if gst then
		if
			gst['added'] and gst['added'] > 0
			or gst['removed'] and gst['removed'] > 0
			or gst['changed'] and gst['changed'] > 0
		then
			return true
		end
	end
	return false
end

force_inactive.filetypes = {
	'^aerial$',
	'^help$',
	'^NvimTree$',
	'^packer$',
	'^qf$',
	'^TelescopePrompt$',
	'^tsplayground$',
}

force_inactive.buftypes = {
	'^terminal$',
}

disable.filetypes = {
	'^alpha$',
}

custom_providers = {
	-- vim_mode = function()
	-- 	local mode = mode_alias[vim.api.nvim_get_mode().mode]
	-- 	local icon = ' '

	-- 	return mode, icon
	-- end,
	lsp_status = function()
		if next(vim.lsp.buf_get_clients(0)) ~= nil then
			return ' '
		else
			return ''
		end
	end,
	file_dict = function()
		local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
		local icon = '  '

		dir_name = dir_name .. ' '
		return dir_name, icon
	end,
}

-- LEFT
components.active[1][1] = {
	provider = { name = 'vi_mode', opts = { show_mode_name = true } },
	icon = ' ',
	hl = function()
		return {
			fg = 'black',
			bg = vi_mode_utils.get_mode_color(),
		}
	end,
	left_sep = 'block',
}

-- there is a dilema: we need to hide Diffs if ther is no git info. We can do that, but this will
-- leave the right_semicircle colored with purple, and since we can't change the color conditonally
-- then the solution is to create two right_semicircles: one with a mauve bkg and the other one normal
-- bkg; both have the same fg (vi mode). The mauve one appears if there is git info, else the one with
-- the normal bkg appears. Fixed :)

-- enable if git diffs are not available
components.active[1][2] = {
	provider = '',
	enabled = function()
		return not any_git_changes()
	end,
	hl = function()
		return {
			fg = vi_mode_utils.get_mode_color(),
			bg = 'black',
		}
	end,
}

-- enable if git diffs are available
components.active[1][3] = {
	provider = '',
	enabled = function()
		return any_git_changes()
	end,
	hl = function()
		return {
			fg = vi_mode_utils.get_mode_color(),
			bg = 'sky',
		}
	end,
}
-- Current vi mode ------>

-- Diffs ------>
components.active[1][4] = {
	provider = 'git_diff_added',
	icon = '  ',
	hl = {
		fg = 'black',
		bg = 'sky',
	},
}

components.active[1][5] = {
	provider = 'git_diff_changed',
	icon = '  ',
	hl = {
		fg = 'black',
		bg = 'sky',
	},
}

components.active[1][6] = {
	provider = 'git_diff_removed',
	icon = '  ',
	hl = {
		fg = 'black',
		bg = 'sky',
	},
}

components.active[1][7] = {
	provider = '',
	enabled = function()
		return any_git_changes()
	end,
	hl = {
		fg = 'sky',
		bg = 'black',
	},
}
-- Diffs ------>

-- Extras ------>

-- file progess
components.active[1][8] = {
	provider = 'line_percentage',

	hl = {
		fg = 'gray',
		bg = 'black',
	},
	left_sep = 'block',
	truncate_hide = true,
	priority = 2,
}

-- position
components.active[1][9] = {
	provider = 'position',
	hl = {
		fg = 'gray',
		bg = 'black',
	},
	left_sep = 'block',
	truncate_hide = true,
	priority = 2,
}
-- Extras ------>

-- ######## Left

-- ######## Center

-- Diagnostics ------>
-- workspace loader
components.active[2][1] = {
	provider = 'lsp_client_names',
	icon = ' ',
	hl = {
		fg = 'gray',
		bg = 'black',
	},
	truncate_hide = true,
	priority = 3,
}

-- genral diagnostics (errors, warnings. info and hints)
components.active[2][2] = {
	provider = 'diagnostic_errors',
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.ERROR)
	end,
	icon = '  ',
	hl = {
		fg = 'diag_error',
		bg = 'black',
	},
}

components.active[2][3] = {
	provider = 'diagnostic_warnings',
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.WARN)
	end,
	hl = {
		fg = 'yellow',
		bg = 'black',
	},
}

components.active[2][4] = {
	provider = 'diagnostic_info',
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.INFO)
	end,
	hl = {
		fg = 'sky',
		bg = 'black',
	},
}

components.active[2][5] = {
	provider = 'diagnostic_hints',
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.HINT)
	end,
	icon = '  ',
	hl = {
		fg = 'diag_hint',
		bg = 'black',
	},
}
-- Diagnostics ------>

-- ######## Center

-- ######## Right

components.active[3][1] = {
	provider = 'git_branch',
	icon = ' ',
	hl = {
		fg = 'gray',
		bg = 'black',
	},
	left_sep = 'block',
	right_sep = 'block',
	truncate_hide = true,
	priority = 1,
}

components.active[3][2] = {
	provider = 'lsp_status',
	hl = {
		fg = 'gray',
		bg = 'black',
	},
	right_sep = 'block',
	truncate_hide = true,
	priority = 1,
}

components.active[3][3] = {
	provider = { name = 'file_type', opts = { filetype_icon = true, colored_icon = false, case = 'lowercase' } },
	hl = {
		fg = 'black',
		bg = 'maroon',
	},
	left_sep = {
		str = 'left_rounded',
		hl = {
			fg = 'maroon',
			bg = 'black',
		},
	},
	right_sep = 'block',
	truncate_hide = true,
	priority = 1,
}

components.active[3][4] = {
	provider = 'file_dict',
	hl = {
		fg = 'black',
		bg = 'flamingo',
	},
	left_sep = {
		str = 'left_rounded',
		hl = {
			fg = 'flamingo',
			bg = 'maroon',
		},
	},
}
-- ######## Right

-- INACTIVE
components.inactive[1][1] = {
	provider = 'file_type',
	hl = {
		fg = 'black',
		bg = 'maroon',
	},
	left_sep = 'block',
	right_sep = {
		str = 'right_rounded',
		hl = {
			fg = 'maroon',
			bg = 'black',
		},
	},
}

components.inactive[1][2] = {}

require('feline').setup {
	theme = colors,
	vi_mode_colors = vi_mode_colors,
	force_inactive = force_inactive,
	disable = disable,
	custom_providers = custom_providers,
	components = components,
	conditional_components = conditional_components,
}
