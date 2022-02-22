local lsp = require('feline.providers.lsp')
local vi_mode_utils = require('feline.providers.vi_mode')

local components = {
	active = { {}, {}, {} },
	inactive = { {}, {} },
}

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

local colors = {
	bg = '#1A1826',
	black = '#161320',
	yellow = '#FAE3B0',
	cyan = '#B5E8E0',
	oceanblue = '#96CDFB',
	green = '#ABE9B3',
	orange = '#F8BD96',
	violet = '#DDB6F2',
	magenta = '#E8A2AF',
	white = '#D9E0EE',
	fg = '#D9E0EE',
	skyblue = '#89DCEB',
	red = '#F28FAD',
}

local vi_mode_colors = {
	NORMAL = 'green',
	OP = 'green',
	INSERT = 'red',
	VISUAL = 'skyblue',
	LINES = 'skyblue',
	BLOCK = 'skyblue',
	REPLACE = 'violet',
	['V-REPLACE'] = 'violet',
	ENTER = 'cyan',
	MORE = 'cyan',
	SELECT = 'orange',
	COMMAND = 'magenta',
	SHELL = 'magenta',
	TERM = 'magenta',
	NONE = 'yellow',
}

local vi_mode_text = {
	NORMAL = '<|',
	OP = '<|',
	INSERT = '|>',
	VISUAL = '<>',
	LINES = '<>',
	BLOCK = '<>',
	REPLACE = '<>',
	['V-REPLACE'] = '<>',
	ENTER = '<>',
	MORE = '<>',
	SELECT = '<>',
	COMMAND = '<|',
	SHELL = '<|',
	TERM = '<|',
	NONE = '<>',
}

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
	file_type_2 = function()
		local filename = vim.api.nvim_buf_get_name(0)
		local extension = vim.fn.fnamemodify(filename, ':e')
		local filetype = vim.bo.filetype
		local icon

		local icon_str, icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })

		icon = { str = icon_str }
		icon.hl = { fg = icon_color }
		filetype = ' ' .. filetype:gsub('^%l', string.upper)

		return filetype, icon
	end,
	lsp_client_names_2 = function()
		local clients = {}

		for _, client in ipairs(vim.lsp.buf_get_clients(0)) do
			clients[#clients + 1] = client.name
		end

		return table.concat(clients, '|'), ' '
	end,
	-- position = function()
	-- 	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	--
	-- 	-- Turn col from byteindex to column number and make it start from 1
	-- 	col = vim.str_utfindex(vim.api.nvim_get_current_line(), col) + 1
	--
	-- 	return string.format('Ln %d, Col %d', row, col)
	-- end,
}

-- LEFT
components.active[1] = {
	{ -- vi-mode
		provider = vi_mode_utils.get_vim_mode,
		hl = function()
			local val = {}
			val.bg = vi_mode_utils.get_mode_color()
			val.fg = 'black'
			val.style = 'bold'
			return val
		end,
		left_sep = 'block',
		right_sep = 'block',
	},
	{ -- vi-symbol
		provider = function()
			return vi_mode_text[vi_mode_utils.get_vim_mode()]
		end,
		hl = function()
			local val = {}
			val.fg = vi_mode_utils.get_mode_color()
			val.bg = 'bg'
			val.style = 'bold'
			return val
		end,
		left_sep = ' ',
		right_sep = ' ',
	},
	{ -- gitBranch
		provider = 'git_branch',
		enabled = function()
			return vim.b.gitsigns_status_dict
		end,
		icon = ' ',
		hl = {
			fg = 'white',
			bg = 'bg',
		},
		right_sep = {
			str = ' >',
			hl = {
				fg = 'white',
				bg = 'bg',
				style = 'bold',
			},
		},
	},
	{ -- diffAdd
		provider = 'git_diff_added',
		icon = ' +',
		hl = {
			fg = 'green',
			bg = 'bg',
		},
		truncate_hide = true,
		priority = 3,
	},
	{ -- diffModfified
		provider = 'git_diff_changed',
		icon = ' ~',
		hl = {
			fg = 'yellow',
			bg = 'bg',
		},
		truncate_hide = true,
		priority = 3,
	},
	{ -- diffRemove
		provider = 'git_diff_removed',
		icon = ' -',
		hl = {
			fg = 'red',
			bg = 'bg',
		},
		truncate_hide = true,
		priority = 3,
	},
}

-- MID
components.active[2] = {
	{ -- fileType
		provider = 'file_type_2',
		hl = {
			fg = 'white',
		},
		truncate_hide = true,
		priority = 1,
	},
}

-- RIGHT
components.active[3] = {
	{ -- diagnosticErrors
		provider = 'diagnostic_errors',
		icon = '  ',
		enabled = function()
			return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
		end,
		hl = {
			fg = 'red',
		},
		truncate_hide = true,
		priority = 2,
	},
	{ -- diagnosticWarn
		provider = 'diagnostic_warnings',
		icon = '  ',
		enabled = function()
			return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
		end,
		hl = {
			fg = 'yellow',
		},
		truncate_hide = true,
		priority = 2,
	},
	{ -- diagnosticHint
		provider = 'diagnostic_hints',
		icon = '  ',
		enabled = function()
			return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
		end,
		hl = {
			fg = 'cyan',
		},
		truncate_hide = true,
		priority = 2,
	},
	{ -- diagnosticInfo
		provider = 'diagnostic_info',
		icon = '  ',
		enabled = function()
			return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
		end,
		hl = {
			fg = 'skyblue',
		},
		truncate_hide = true,
		priority = 2,
	},
	{ -- LspName
		provider = 'lsp_client_names_2',
		hl = {
			fg = 'violet',
			bg = 'bg',
		},
		left_sep = ' ',
		truncate_hide = true,
		priority = 2,
	},
	{ -- linePercent
		provider = 'line_percentage',
		hl = {
			fg = 'white',
			bg = 'bg',
		},
		left_sep = ' ',
		right_sep = ' ',
	},
	{ -- lineInfo
		provider = 'position',
		hl = function()
			return {
				fg = 'black',
				bg = vi_mode_utils.get_mode_color(),
			}
		end,
		left_sep = 'block',
		right_sep = 'block',
	},
}

-- INACTIVE
components.inactive[1] = {
	{ -- fileType
		provider = 'file_type',
		hl = {
			fg = 'black',
			bg = 'cyan',
			style = 'bold',
		},
		left_sep = {
			str = ' ',
			hl = {
				fg = 'NONE',
				bg = 'cyan',
			},
		},
		right_sep = {
			{
				str = ' ',
				hl = {
					fg = 'NONE',
					bg = 'cyan',
				},
			},
			' ',
		},
	},
}

require('feline').setup {
	theme = colors,
	vi_mode_colors = vi_mode_colors,
	force_inactive = force_inactive,
	disable = disable,
	custom_providers = custom_providers,
	components = components,
}
