local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'

local colors = {
	bright_bg  = '#2A2A37',
	red        = '#C14A4A',
	dark_red   = '#362627',
	green      = utils.get_highlight('String').fg,
	blue       = utils.get_highlight('Function').fg,
	gray       = utils.get_highlight('NonText').fg,
	orange     = utils.get_highlight('Constant').fg,
	purple     = utils.get_highlight('Statement').fg,
	cyan       = utils.get_highlight('Special').fg,
	diag_warn  = '#D8A657',
	diag_error = '#C14A4A',
	diag_hint  = '#89B482',
	diag_info  = '#7DAEA3',
	git_branch = '#D3869B',
	git_del    = '#B0B846',
	git_add    = '#F2594B',
	git_change = '#E9B143',
	mode_fg    = '#242424',
}

require('heirline').load_colors(colors)

local mode_lable = {
	n         = 'NORMAL',
	no        = 'OPPEND',
	nov       = 'N?',
	noV       = 'N?',
	['no\22'] = 'N?',
	niI       = 'Ni',
	niR       = 'Nr',
	niV       = 'Nv',
	nt        = 'N-TERM',
	v         = 'VISUAL',
	vs        = 'Vs',
	V         = 'V-LINE',
	Vs        = 'Vs',
	['\22']   = 'V-BLCK',
	['\22s']  = '^V',
	s         = 'SELECT',
	S         = 'S-LINE',
	['\19']   = 'S-BLCK',
	i         = 'INSERT',
	ic        = 'ICOMPL',
	ix        = 'Ix',
	R         = 'RPLACE',
	Rc        = 'Rc',
	Rx        = 'Rx',
	Rv        = 'VRPLCE',
	Rvc       = 'Rv',
	Rvx       = 'Rv',
	c         = 'CMMAND',
	cv        = 'PROMPT',
	r         = '...',
	rm        = 'MORE',
	['r?']    = 'CNFIRM',
	['!']     = 'SHELL',
	t         = 'TERM',
}

local mode_colors_table = {
	n        = 'red',
	no       = 'blue',
	nov      = 'blue',
	noV      = 'blue',
	niI      = 'red',
	niR      = 'red',
	niV      = 'red',
	nt       = 'red',
	v        = 'cyan',
	vs       = 'cyan',
	V        = 'cyan',
	Vs       = 'cyan',
	['\22']  = 'cyan',
	['\22s'] = 'cyan',
	s        = 'purple',
	S        = 'purple',
	['\19']  = 'purple',
	i        = 'blue',
	ic       = 'blue',
	ix       = 'blue',
	R        = 'orange',
	Rc       = 'orange',
	Rx       = 'orange',
	Rv       = 'orange',
	Rvc      = 'orange',
	Rvx      = 'orange',
	c        = 'green',
	cv       = 'green',
	r        = 'green',
	rm       = 'green',
	['r?']   = 'green',
	['!']    = 'red',
	t        = 'red',
}

local mode_colors = setmetatable({
	n = { fg = 'red' }
}, {
	__index = function(_, mode)
		return {
			fg = 'mode_fg',
			bg = mode_colors_table[mode],
		}
	end
})

local LeftCap = {
	provider = '▌',
	hl = { fg = 'git_branch' }
}

local VimModeNormal = {
	condition = function(self)
		return self.mode == 'n'
	end,
	provider = ' ●',
	hl = { fg = 'git_branch' }
}

local VimModeOthers = {
	condition = function(self)
		return self.mode ~= 'n'
	end,

	utils.surround({ '', '' },
		function(self)
			return mode_colors[self.mode].bg
		end,
		{
			{
				provider = function(self)
					return '● ' .. mode_lable[self.mode]
				end,
			},
			hl = function(self)
				return mode_colors[self.mode]
			end
		}
	),
}

local VimMode = {
	init = function(self)
		self.mode = vim.fn.mode(1) -- :h mode()

		-- execute this only once, this is required if you want the VimMode
		-- component to be updated on operator pending mode
		if not self.once then
			vim.api.nvim_create_autocmd('ModeChanged', { command = 'redrawstatus' })
			self.once = true
		end
	end,

	VimModeNormal, VimModeOthers,
	update = 'ModeChanged'
}

local Snippets = {
	-- check that we are in insert or select mode
	condition = function()
		return vim.tbl_contains({ 'i', 's' }, vim.fn.mode())
	end,
	provider = function()
		local ls = require 'luasnip'
		local forward = ls.jumpable(1) and ' ' or ''
		local backward = ls.jumpable(-1) and ' ' or ''
		return backward .. forward
	end,
	hl = { fg = 'red', bold = true },
}

local WorkDir = {
	provider = function(self)
		self.icon = ' '
		local cwd = vim.fn.getcwd(0)
		self.cwd = vim.fn.fnamemodify(cwd, ':~')
	end,
	hl = { fg = 'blue', bold = true },

	utils.make_flexible_component(1, {
		-- evaluates to the full-lenth path
		provider = function(self)
			local trail = self.cwd:sub(-1) == '/' and '' or '/'
			return self.icon .. self.cwd .. trail .. ' '
		end,
	}, {
		-- evaluates to the shortened path
		provider = function(self)
			local cwd = vim.fn.pathshorten(self.cwd)
			local trail = self.cwd:sub(-1) == '/' and '' or '/'
			return self.icon .. cwd .. trail .. ' '
		end,
	}, {
		-- evaluates to empty string, hiding the component
		provider = '',
	}),
}

local FileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ':e')
		self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(
			filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. ' ')
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local FileName = {
	init = function(self)
		self.lfilename = vim.fn.fnamemodify(self.filename, ':.')
		if self.lfilename == '' then
			self.lfilename = '[No Name]'
		end
		if not conditions.width_percent_below(#self.lfilename, 0.27) then
			self.lfilename = vim.fn.pathshorten(self.lfilename)
		end
	end,
	hl = 'Directory',

	utils.make_flexible_component(2, {
		provider = function(self)
			return self.lfilename
		end,
	}, {
		provider = function(self)
			return vim.fn.pathshorten(self.lfilename)
		end,
	}),
}

local FileFlags = {
	{
		provider = function() if vim.bo.modified then return '[+]' end end,
		hl = { fg = 'green' },
	},
	{
		provider = function() if (not vim.bo.modifiable) or vim.bo.readonly then return '' end end,
		hl = 'Constant',
	},
}

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			-- use `force` because we need to override the child's hl foreground
			return { fg = 'cyan', bold = true, force = true }
		end
	end,
}

FileNameBlock = utils.insert(FileNameBlock,
	FileIcon,
	utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
	unpack(FileFlags), -- A small optimisation, since their parent does nothing
	{ provider = '%<' }-- this means that the statusline is cut here when there's not enough space
)

local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
	hl = 'Type',
}

local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = {
		error_icon = ' ',
		warn_icon = ' ',
		info_icon = ' ',
		hint_icon = ' ',
	},

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { 'DiagnosticChanged', 'BufEnter' },

	{
		provider = function(self)
			return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
		end,
		hl = { fg = 'diag_error' },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
		end,
		hl = { fg = 'diag_warn' },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. self.info .. ' ')
		end,
		hl = { fg = 'diag_info' },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. self.hints)
		end,
		hl = { fg = 'diag_hint' },
	}
}

local Git = {
	condition = conditions.is_git_repo,
	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
	end,

	hl = { fg = 'git_branch' },

	{ -- git branch name
		provider = function(self)
			return table.concat { ' ', self.status_dict.head, ' ' }
		end,
		hl = { bold = true },
	},

	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and table.concat { '+', count, ' ' }
		end,
		hl = { fg = 'git_add' },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and table.concat { '~', count, ' ' }
		end,
		hl = { fg = 'git_change' },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and table.concat { '-', count, ' ' }
		end,
		hl = { fg = 'git_del' },
	},

	on_click = {
		callback = function()
			vim.defer_fn(function()
				require('FTerm'):new({ cmd = 'lazygit', dimensions = { height = 1, width = 1 } }):open()
			end, 100)
		end,
		name = 'LazyGit',
	},
}

local LSPActive = {
	condition = conditions.lsp_attached,
	update = { 'LspAttach', 'LspDetach' },

	provider = '◍ LSP ',
	hl = { fg = 'green' },

	on_click = {
		callback = function()
			vim.defer_fn(function()
				require 'lspconfig.ui.lspinfo' ()
			end, 100)
		end,
		name = 'heirline_LSP'
	}
}

local Ruler = {
	-- %l = current line number
	-- %L = number of lines in the buffer
	-- %c = column number
	-- %P = percentage through file of displayed window
	provider = '%7(%l/%3L%):%2c %P',
}

local ScrollBar = {
	static = {
		sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' },
	},
	provider = function(self)
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor(curr_line / lines * (#self.sbar - 1)) + 1
		return string.rep(self.sbar[i], 2)
	end,
	hl = { fg = 'blue', bg = 'bright_bg' },
}

local Align = { provider = '%=' }
local Space = { provider = ' ' }

local DefaultStatusline = {
	LeftCap, VimMode,
	Snippets, Space,
	WorkDir, Align,
	Diagnostics, Space,
	Git,
	LSPActive,
	Ruler, Space, ScrollBar
}

local InactiveStatusline = {
	condition = function()
		return not conditions.is_active()
	end,

	Space, FileType, Space, FileName, Align,
}

local HelpFileName = {
	condition = function()
		return vim.bo.filetype == 'help'
	end,
	provider = function()
		local filename = vim.api.nvim_buf_get_name(0)
		return vim.fn.fnamemodify(filename, ':t')
	end,
	hl = 'Directory',
}

local SpecialStatusline = {
	condition = function()
		return conditions.buffer_matches({
			buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
			filetype = { '^git.*' },
		})
	end,

	Space, FileType, Space, HelpFileName, Align
}

local TerminalName = {
	provider = function()
		local tname, _ = vim.api.nvim_buf_get_name(0):gsub('.*:', '')
		return ' ' .. tname
	end,
	hl = { fg = 'blue', bold = true },
}

local TerminalStatusline = {
	condition = function()
		return conditions.buffer_matches({ buftype = { 'terminal' } })
	end,
	hl = { bg = 'dark_red' },

	{ condition = conditions.is_active, LeftCap, VimMode, Space }, FileType, Space, TerminalName, Align,
}

local StatusLines = {
	hl = function()
		if conditions.is_active() then
			return 'StatusLine'
		else
			return 'StatusLineNC'
		end
	end,

	init = utils.pick_child_on_condition,

	SpecialStatusline, TerminalStatusline, InactiveStatusline, DefaultStatusline,
}

local WinBars = {
	init = utils.pick_child_on_condition,
	{ -- Hide the winbar for special buffers
		condition = function()
			return conditions.buffer_matches({
				buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
				filetype = { '^git.*' },
			})
		end,
		init = function()
			vim.opt_local.winbar = nil
		end
	},
	{ -- A special winbar for terminals
		condition = function()
			return conditions.buffer_matches({ buftype = { 'terminal' } })
		end,
		utils.surround({ '', '' }, 'dark_red', {
			FileType,
			Space,
			TerminalName,
		}),
	},
	{ -- An inactive winbar for regular files
		condition = function()
			return not conditions.is_active()
		end,
		utils.surround({ '', '' }, 'bright_bg', { hl = { fg = 'gray', force = true }, FileNameBlock }),
	},
	-- A winbar for regular files
	utils.surround({ '', '' }, 'bright_bg', FileNameBlock),
}

require('heirline').setup(StatusLines, WinBars)
