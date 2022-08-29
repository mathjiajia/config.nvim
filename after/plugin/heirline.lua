local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'

local colors = {
	bright_bg  = utils.get_highlight('Folded').bg,
	red        = utils.get_highlight('DiagnosticError').fg,
	dark_red   = utils.get_highlight('DiffDelete').bg,
	green      = utils.get_highlight('String').fg,
	blue       = utils.get_highlight('Function').fg,
	gray       = utils.get_highlight('NonText').fg,
	orange     = utils.get_highlight('Constant').fg,
	purple     = utils.get_highlight('Statement').fg,
	cyan       = utils.get_highlight('Special').fg,
	diag_warn  = utils.get_highlight('DiagnosticWarn').fg,
	diag_error = utils.get_highlight('DiagnosticError').fg,
	diag_hint  = utils.get_highlight('DiagnosticHint').fg,
	diag_info  = utils.get_highlight('DiagnosticInfo').fg,
	git_del    = utils.get_highlight('GitSignsDelete').fg,
	git_add    = utils.get_highlight('GitSignsAdd').fg,
	git_change = utils.get_highlight('GitSignsChange').fg,
	-- red        = '#C14A4A',
	-- diag_warn  = '#D8A657',
	-- diag_error = '#C14A4A',
	-- diag_hint  = '#89B482',
	-- diag_info  = '#7DAEA3',
	git_branch = '#D3869B',
	-- git_del    = '#B0B846',
	-- git_add    = '#F2594B',
	-- git_change = '#E9B143',
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
		self.mode = vim.fn.mode(1)
	end,

	VimModeNormal, VimModeOthers,

	update = { 'ModeChanged' }
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
	provider = function()
		local icon = (vim.fn.haslocaldir(0) == 1 and 'l' or 'g') .. ' ' .. ' '
		local cwd = vim.fn.getcwd(0)
		cwd = vim.fn.fnamemodify(cwd, ':~')
		if not conditions.width_percent_below(#cwd, 0.25) then
			cwd = vim.fn.pathshorten(cwd)
		end
		local trail = cwd:sub(-1) == '/' and '' or '/'
		return icon .. cwd .. trail
	end,
	hl = { fg = 'blue', bold = true },
}

local FileNameBlock = {
	-- let's first set up some attributes needed by this component and it's children
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
}
-- We can now define some children separately and add them later

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = vim.fn.fnamemodify(filename, ':e')
		self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. ' ')
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end
}

local FileName = {
	provider = function(self)
		-- first, trim the pattern relative to the current directory. For other
		-- options, see :h filename-modifers
		local filename = vim.fn.fnamemodify(self.filename, ':.')
		if filename == '' then return '[No Name]' end
		-- now, if the filename would occupy more than 1/4th of the available
		-- space, we trim the file path to its initials
		-- See Flexible Components section below for dynamic truncation
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
	hl = { fg = utils.get_highlight('Directory').fg },
}

local FileFlags = {
	{
		provider = function() if vim.bo.modified then return '[+]' end end,
		hl = { fg = 'green' }

	}, {
		provider = function() if (not vim.bo.modifiable) or vim.bo.readonly then return '' end end,
		hl = { fg = 'orange' }
	}
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			-- use `force` because we need to override the child's hl foreground
			return { fg = 'cyan', bold = true, force = true }
		end
	end,
}

-- let's add the children to our FileNameBlock component
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
	hl = { fg = utils.get_highlight('Type').fg, bold = true },
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
		provider = '![',
	},
	{
		provider = function(self)
			-- 0 is just another output, we can decide to print it or not!
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
	},
	{
		provider = ']',
	},
}

local Git = {
	condition = conditions.is_git_repo,

	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,

	hl = { fg = 'git_branch' },


	{ -- git branch name
		provider = function(self)
			return ' ' .. self.status_dict.head
		end,
		hl = { bold = true }
	},
	-- You could handle delimiters, icons and counts similar to Diagnostics
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = '('
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and ('+' .. count)
		end,
		hl = { fg = 'git_add' },
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and ('-' .. count)
		end,
		hl = { fg = 'git_del' },
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and ('~' .. count)
		end,
		hl = { fg = 'git_change' },
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = ')',
	},
}

local LSPActive = {
	condition = conditions.lsp_attached,
	update = { 'LspAttach', 'LspDetach' },

	provider = ' ◍ LSP ',
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

-- I take no credits for this! :lion:
local ScrollBar = {
	static = {
		sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
		-- Another variant, because the more choice the better.
		-- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
	},
	provider = function(self)
		local curr_line = vim.api.nvim_win_get_cursor(0)[1]
		local lines = vim.api.nvim_buf_line_count(0)
		local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
		return string.rep(self.sbar[i], 2)
	end,
	hl = { fg = 'blue', bg = 'bright_bg' },
}

local TerminalName = {
	-- we could add a condition to check that buftype == 'terminal'
	-- or we could do that later (see #conditional-statuslines below)
	provider = function()
		local tname, _ = vim.api.nvim_buf_get_name(0):gsub('.*:', '')
		return ' ' .. tname
	end,
	hl = { fg = 'blue', bold = true },
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
	condition = conditions.is_not_active,
	Space, FileType, Space, FileName, Align,
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

	-- the first statusline with no condition, or which condition returns true is used
	-- think of it as a switch case without fallthrough.
	init = utils.pick_child_on_condition,

	SpecialStatusline, TerminalStatusline, InactiveStatusline, DefaultStatusline,
}

local WinBar = {
	init = utils.pick_child_on_condition,
	{ -- Hide the winbar for special buffers
		condition = function()
			return conditions.buffer_matches({
				buftype = { 'nofile', 'prompt', 'help', 'quickfix', 'terminal' },
				filetype = { '^git.*' },
			})
		end,
		init = function()
			vim.opt_local.winbar = nil
		end
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

local TablineBufnr = {
	provider = function(self)
		return tostring(self.bufnr) .. '. '
	end,
	hl = 'Comment',
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
local TablineFileName = {
	provider = function(self)
		-- self.filename will be defined later, just keep looking at the example!
		local filename = self.filename
		filename = filename == '' and '[No Name]' or vim.fn.fnamemodify(filename, ':t')
		return filename
	end,
	hl = function(self)
		return { bold = self.is_active or self.is_visible, italic = true }
	end,
}

-- this looks exactly like the FileFlags component that we saw in
-- #crash-course-part-ii-filename-and-friends, but we are indexing the bufnr explicitly
local TablineFileFlags = {
	{
		provider = function(self)
			if vim.bo[self.bufnr].modified then
				return '[+]'
			end
		end,
		hl = { fg = 'green' },
	},
	{
		provider = function(self)
			if not vim.bo[self.bufnr].modifiable or vim.bo[self.bufnr].readonly then
				return ''
			end
		end,
		hl = { fg = 'orange' },
	},
}

-- Here the filename block finally comes together
local TablineFileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(self.bufnr)
	end,
	hl = function(self)
		if self.is_active then
			return 'TabLineSel'
		else
			return 'TabLine'
		end
	end,
	on_click = {
		callback = function(_, minwid)
			vim.api.nvim_win_set_buf(0, minwid)
		end,
		minwid = function(self)
			return self.bufnr
		end,
		name = 'heirline_tabline_buffer_callback',
	},
	TablineBufnr,
	FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
	TablineFileName,
	TablineFileFlags,
}

-- a nice "x" button to close the buffer
local TablineCloseButton = {
	condition = function(self)
		return not vim.bo[self.bufnr].modified
	end,
	{ provider = ' ' },
	{
		provider = '',
		hl = { fg = 'gray' },
		on_click = {
			callback = function(_, minwid)
				vim.api.nvim_buf_delete(minwid, { force = false })
			end,
			minwid = function(self)
				return self.bufnr
			end,
			name = 'heirline_tabline_close_buffer_callback',
		},
	},
}

-- The final touch!
local TablineBufferBlock = utils.surround({ '', '' }, function(self)
	if self.is_active then
		return utils.get_highlight('TabLineSel').bg
	else
		return utils.get_highlight('TabLine').bg
	end
end, { TablineFileNameBlock, TablineCloseButton })

-- and here we go
local BufferLine = utils.make_buflist(
	TablineBufferBlock,
	{ provider = '', hl = { fg = 'gray' } }, -- left truncation, optional (defaults to "<")
	{ provider = '', hl = { fg = 'gray' } }-- right trunctation, also optional (defaults to ...... yep, ">")
-- by the way, open a lot of buffers and try clicking them ;)
)

local Tabpage = {
	provider = function(self)
		return '%' .. self.tabnr .. 'T ' .. self.tabnr .. ' %T'
	end,
	hl = function(self)
		if not self.is_active then
			return 'TabLine'
		else
			return 'TabLineSel'
		end
	end,
}

local TabpageClose = {
	provider = '%999X  %X',
	hl = 'TabLine',
}

local TabPages = {
	-- only show this component if there's 2 or more tabpages
	condition = function()
		return #vim.api.nvim_list_tabpages() >= 2
	end,
	{ provider = '%=' },
	utils.make_tablist(Tabpage),
	TabpageClose,
}

local TabLineOffset = {
	condition = function(self)
		local win = vim.api.nvim_tabpage_list_wins(0)[1]
		local bufnr = vim.api.nvim_win_get_buf(win)
		self.winid = win

		if vim.bo[bufnr].filetype == 'NvimTree' then
			self.title = 'NvimTree'
			return true
			-- elseif vim.bo[bufnr].filetype == "TagBar" then
			--     ...
		end
	end,

	provider = function(self)
		local title = self.title
		local width = vim.api.nvim_win_get_width(self.winid)
		local pad = math.ceil((width - #title) / 2)
		return string.rep(' ', pad) .. title .. string.rep(' ', pad)
	end,

	hl = function(self)
		if vim.api.nvim_get_current_win() == self.winid then
			return 'TablineSel'
		else
			return 'Tabline'
		end
	end,
}

local TabLine = { TabLineOffset, BufferLine, TabPages }

require('heirline').setup(StatusLines, WinBar, TabLine)

-- Yep, with heirline we're driving manual!
vim.api.nvim_create_autocmd({ 'FileType' }, {
	pattern = '*',
	command = 'if index(["wipe", "delete", "unload"], &bufhidden) >= 0 | set nobuflisted | endif'
})
