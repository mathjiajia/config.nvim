local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'
local devicons = require 'nvim-web-devicons'

local colors = {
	bright_bg = utils.get_highlight('Folded').bg,
	red = utils.get_highlight('DiagnosticError').fg,
	dark_red = utils.get_highlight('DiffDelete').bg,
	green = utils.get_highlight('String').fg,
	blue = utils.get_highlight('Function').fg,
	gray = utils.get_highlight('NonText').fg,
	orange = utils.get_highlight('Constant').fg,
	purple = utils.get_highlight('Statement').fg,
	cyan = utils.get_highlight('Special').fg,
	statusline_fg = utils.get_highlight('StatusLine').fg,
	statusline_bg = utils.get_highlight('StatusLine').bg,
	statuslinenc_fg = utils.get_highlight('StatusLineNC').fg,
	statuslinenc_bg = utils.get_highlight('StatusLineNC').bg,
	diag = {
		warn = utils.get_highlight('DiagnosticWarn').fg,
		error = utils.get_highlight('DiagnosticError').fg,
		hint = utils.get_highlight('DiagnosticHint').fg,
		info = utils.get_highlight('DiagnosticInfo').fg,
	},
	git = {
		branch = '#d3869b',
		add = utils.get_highlight('diffAdded').fg,
		change = utils.get_highlight('diffChanged').fg,
		del = utils.get_highlight('diffRemoved').fg,
	},

	shine  = '#db4740',
	aqua   = '#8bba7f',
	lsp    = '#43BF6C',
	yellow = '#e9b143',
}

local mode_lable = {
	n       = 'NORMAL',
	no      = 'OPPEND',
	v       = 'VISUAL',
	V       = 'V-LINE',
	['\22'] = 'V-BLCK',
	s       = 'SELECT',
	S       = 'S-LINE',
	['\19'] = 'S-BLCK',
	i       = 'INSERT',
	ic      = 'ICOMPL',
	R       = 'RPLACE',
	Rv      = 'VRPLCE',
	c       = 'CMMAND',
	ce      = 'EX(R)',
	cv      = 'PROMPT',
	rm      = 'MORE',
	['r?']  = 'CNFIRM',
	['!']   = 'SHELL',
	t       = 'TERM',
	nt      = 'TERM',
}

local vim_mode_colors = {
	n       = colors.shine,
	no      = colors.blue,
	v       = colors.yellow,
	V       = colors.yellow,
	['\22'] = colors.yellow,
	s       = colors.purple,
	S       = colors.purple,
	['\19'] = colors.purple,
	i       = colors.blue,
	ic      = colors.blue,
	R       = colors.red,
	Rv      = colors.red,
	c       = colors.aqua,
	ce      = colors.aqua,
	cv      = colors.aqua,
	rm      = colors.aqua,
	['r?']  = colors.aqua,
	['!']   = colors.orange,
	t       = colors.orange,
	nt      = colors.orange,
}

local mode_colors = setmetatable({
	n = { fg = vim_mode_colors.n }
}, {
	__index = function(_, mode)
		return {
			fg = colors.statusline_bg,
			bg = vim_mode_colors[mode],
		}
	end
})

local Align = { provider = '%=' }
local Space = { provider = ' ' }

local LeftCap = {
	provider = '▌',
	hl = mode_colors.n
}

local VimModeNormal = {
	condition = function(self)
		return self.mode == 'n'
	end,
	provider = ' ●',
	hl = { fg = colors.shine }
}

local VimModeOthers = {
	condition = function(self)
		return self.mode ~= 'n'
	end,

	utils.surround(
		{ '', '' },

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
	)
}

local VimMode = {
	init = function(self)
		self.mode = vim.fn.mode(1)
	end,
	VimModeNormal, VimModeOthers
}

local Snippets = {
	condition = function()
		return vim.tbl_contains({ 'i', 's' }, vim.fn.mode())
	end,
	provider = function()
		local ls = require 'luasnip'
		local forward = ls.jumpable(1) and ' ' or ''
		local backward = ls.jumpable(-1) and ' ' or ''
		return backward .. forward
	end,
	hl = { fg = colors.red, bold = true },
}

local WorkDir = {
	provider = function(self)
		self.icon = ' '
		local cwd = vim.fn.getcwd(0)
		self.cwd = vim.fn.fnamemodify(cwd, ':~')
		if not conditions.width_percent_below(#self.cwd, 0.27) then
			self.cwd = vim.fn.pathshorten(self.cwd)
		end
	end,
	hl = { fg = colors.blue },

	utils.make_flexible_component(1, {
		provider = function(self)
			local trail = self.cwd:sub(-1) == '/' and '' or '/'
			return self.icon .. self.cwd .. trail .. ' '
		end,
	}, {
		provider = function(self)
			local cwd = vim.fn.pathshorten(self.cwd)
			local trail = self.cwd:sub(-1) == '/' and '' or '/'
			return self.icon .. cwd .. trail .. ' '
		end,
	}, {
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
		self.icon, self.icon_color = devicons.get_icon_color(filename, extension, { default = true })
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
	hl = { fg = utils.get_highlight('Directory').fg },

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
		provider = function()
			if vim.bo.modified then
				return '[+]'
			end
		end,
		hl = { fg = colors.green },
	},
	{
		provider = function()
			if not vim.bo.modifiable or vim.bo.readonly then
				return ''
			end
		end,
		hl = { fg = colors.orange },
	},
}

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			return { fg = colors.cyan, force = true }
		end
	end,
}

FileNameBlock = utils.insert(
	FileNameBlock,
	FileIcon,
	utils.insert(FileNameModifer, FileName),
	unpack(FileFlags)
)

local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
	hl = { fg = utils.get_highlight('Type').fg },
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

	{
		provider = function(self)
			return self.errors > 0 and (self.error_icon .. self.errors .. ' ')
		end,
		hl = { fg = colors.diag.error },
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.warn_icon .. self.warnings .. ' ')
		end,
		hl = { fg = colors.diag.warn },
	},
	{
		provider = function(self)
			return self.info > 0 and (self.info_icon .. self.info .. ' ')
		end,
		hl = { fg = colors.diag.info },
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.hint_icon .. self.hints)
		end,
		hl = { fg = colors.diag.hint },
	}
}

local GitBranch = {
	condition = conditions.is_git_repo,
	init = function(self)
		self.git_status = vim.b.gitsigns_status_dict
	end,

	hl = { fg = colors.git.branch },
	provider = function(self)
		return table.concat { ' ', self.git_status.head, ' ' }
	end,
}

local GitDiffs = {
	condition = function(self)
		if conditions.is_git_repo() then
			self.git_status = vim.b.gitsigns_status_dict
			local has_changes = self.git_status.added ~= 0 or
				self.git_status.removed ~= 0 or
				self.git_status.changed ~= 0
			return has_changes
		end
	end,
	{
		provider = function(self)
			local count = self.git_status.added or 0
			return count > 0 and table.concat { '+', count, ' ' }
			-- return count > 0 and table.concat{'● ', count, ' '}
		end,
		hl = { fg = colors.git.add },
	},
	{
		provider = function(self)
			local count = self.git_status.changed or 0
			return count > 0 and table.concat { '~', count, ' ' }
		end,
		hl = { fg = colors.git.change },
	},
	{
		provider = function(self)
			local count = self.git_status.removed or 0
			return count > 0 and table.concat { '-', count, ' ' }
			-- return count > 0 and table.concat{'● ', count, ' '}
		end,
		hl = { fg = colors.git.del },
	},
}

local LSPActive = {
	condition = conditions.lsp_attached,
	provider = '◍ LSP ',
	hl = { fg = colors.lsp },
}

local Ruler = {
	provider = '%7(%l/%3L%):%2c %P ',
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
	hl = { fg = colors.blue, bg = colors.bright_bg },
}

local DefaultStatusline = {
	LeftCap, VimMode,
	Snippets, Space,
	WorkDir, Align,
	Diagnostics, Space,
	GitBranch, GitDiffs,
	LSPActive,
	Ruler, ScrollBar
}

local InactiveStatusline = {
	condition = function()
		return not conditions.is_active()
	end,

	FileType, Space, FileName, Align,
}

local HelpFileName = {
	condition = function()
		return vim.bo.filetype == 'help'
	end,
	provider = function()
		local filename = vim.api.nvim_buf_get_name(0)
		return vim.fn.fnamemodify(filename, ':t')
	end,
	hl = { fg = colors.blue },
}

local SpecialStatusline = {
	condition = function()
		return conditions.buffer_matches({
			buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
			filetype = { '^git.*' },
		})
	end,
	Space,
	FileType,
	{ provider = '%q' },
	Space,
	HelpFileName,
	Align,
}

local TerminalName = {
	provider = function()
		local tname, _ = vim.api.nvim_buf_get_name(0):gsub('.*:', '')
		return ' ' .. tname
	end,
	hl = { fg = colors.blue },
}

local TerminalStatusline = {
	condition = function()
		return conditions.buffer_matches({ buftype = { 'terminal' } })
	end,
	hl = { bg = colors.dark_red },

	{ condition = conditions.is_active, LeftCap, VimMode, Space }, FileType, Space, TerminalName, Align,
}

local StatusLines = {
	init = utils.pick_child_on_condition,

	hl = function()
		if conditions.is_active() then
			return { fg = colors.statusline_fg, bg = colors.statusline_bg }
		else
			return { fg = colors.statuslinenc_fg, bg = colors.statuslinenc_bg }
		end
	end,

	SpecialStatusline, TerminalStatusline, InactiveStatusline, DefaultStatusline,
}

local WinBar = {
	init = utils.pick_child_on_condition,
	{
		condition = function()
			return conditions.buffer_matches({
				buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
				filetype = { '^git.*' },
			})
		end,
		provider = '',
	},
	{
		condition = function()
			return conditions.buffer_matches({ buftype = { 'terminal' } })
		end,
		utils.surround({ '', '' }, colors.dark_red, {
			FileType,
			Space,
			TerminalName,
		}),
	},
	{
		condition = function()
			return not conditions.is_active()
		end,
		utils.surround({ '', '' }, colors.bright_bg, { hl = { fg = 'gray', force = true }, FileNameBlock }),
	},
	utils.surround({ '', '' }, colors.bright_bg, FileNameBlock),
}

require('heirline').setup(StatusLines, WinBar)
