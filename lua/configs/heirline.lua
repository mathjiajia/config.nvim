local conditions = require 'heirline.conditions'
local utils = require 'heirline.utils'

local M = {}

function M.setup()
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
		diag = {
			warn = utils.get_highlight('DiagnosticWarn').fg,
			error = utils.get_highlight('DiagnosticError').fg,
			hint = utils.get_highlight('DiagnosticHint').fg,
			info = utils.get_highlight('DiagnosticInfo').fg,
		},
		git = {
			del = utils.get_highlight('diffRemoved').fg,
			add = utils.get_highlight('diffAdded').fg,
			change = utils.get_highlight('diffChanged').fg,
		},
	}

	local ViMode = {
		init = function(self)
			self.mode = vim.fn.mode(1)
		end,

		static = {
			mode_names = {
				n = 'N',
				no = 'N?',
				nov = 'N?',
				noV = 'N?',
				['no\22'] = 'N?',
				niI = 'Ni',
				niR = 'Nr',
				niV = 'Nv',
				nt = 'Nt',
				v = 'V',
				vs = 'Vs',
				V = 'V_',
				Vs = 'Vs',
				['\22'] = '^V',
				['\22s'] = '^V',
				s = 'S',
				S = 'S_',
				['\19'] = '^S',
				i = 'I',
				ic = 'Ic',
				ix = 'Ix',
				R = 'R',
				Rc = 'Rc',
				Rx = 'Rx',
				Rv = 'Rv',
				Rvc = 'Rv',
				Rvx = 'Rv',
				c = 'C',
				cv = 'Ex',
				r = '...',
				rm = 'M',
				['r?'] = '?',
				['!'] = '!',
				t = 'T',
			},
		},

		provider = function(self)
			return '%2(' .. self.mode_names[self.mode] .. '%)'
		end,

		hl = function(self)
			local color = self:mode_color()
			return { fg = color, bold = true }
		end,
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
				filename,
				extension,
				{ default = true }
			)
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
				return { fg = colors.cyan, bold = true, force = true }
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
		hl = { fg = colors.blue, bg = colors.bright_bg },
	}

	local LSPActive = {
		condition = conditions.lsp_attached,
		provider = '◍ LSP',
		hl = { fg = colors.green, bold = true },
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

	local Git = {
		condition = conditions.is_git_repo,

		init = function(self)
			self.status_dict = vim.b.gitsigns_status_dict
			self.has_changes = self.status_dict.added ~= 0
				or self.status_dict.removed ~= 0
				or self.status_dict.changed ~= 0
		end,

		hl = { fg = colors.orange },

		{
			provider = function(self)
				return ' ' .. self.status_dict.head
			end,
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = ' (',
		},
		{
			provider = function(self)
				local count = self.status_dict.added or 0
				return count > 0 and ('+' .. count)
			end,
			hl = { fg = colors.git.add },
		},
		{
			provider = function(self)
				local count = self.status_dict.removed or 0
				return count > 0 and ('-' .. count)
			end,
			hl = { fg = colors.git.del },
		},
		{
			provider = function(self)
				local count = self.status_dict.changed or 0
				return count > 0 and ('~' .. count)
			end,
			hl = { fg = colors.git.change },
		},
		{
			condition = function(self)
				return self.has_changes
			end,
			provider = ')',
		},
	}

	local Snippets = {
		condition = function()
			return vim.tbl_contains({ 's', 'i' }, vim.fn.mode())
		end,
		provider = function()
			local forward = (require 'luasnip'.jumpable(1)) and '' or ''
			local backward = (require 'luasnip'.jumpable(-1)) and ' ' or ''
			return backward .. forward
		end,
		hl = { fg = colors.red, bold = true },
	}

	local WorkDir = {
		provider = function(self)
			self.icon = (vim.fn.haslocaldir(0) == 1 and 'l' or 'g') .. ' ' .. ' '
			local cwd = vim.fn.getcwd(0)
			self.cwd = vim.fn.fnamemodify(cwd, ':~')
			if not conditions.width_percent_below(#self.cwd, 0.27) then
				self.cwd = vim.fn.pathshorten(self.cwd)
			end
		end,
		hl = { fg = colors.blue, bold = true },

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

	local HelpFilename = {
		condition = function()
			return vim.bo.filetype == 'help'
		end,
		provider = function()
			local filename = vim.api.nvim_buf_get_name(0)
			return vim.fn.fnamemodify(filename, ':t')
		end,
		hl = { fg = colors.blue },
	}

	local TerminalName = {
		{
			provider = function()
				local tname, _ = vim.api.nvim_buf_get_name(0):gsub('.*:', '')
				return ' ' .. tname
			end,
			hl = { fg = colors.blue, bold = true },
		},
		{ provider = ' - ' },
		{
			provider = function()
				return vim.b.term_title
			end,
		},
		{
			provider = function()
				-- todo: make this a provider
				-- local id = require('terminal'):current_term_index()
				local id = nil
				return ' ' .. (id or 'Exited')
			end,
			hl = { bold = true, fg = colors.blue },
		},
	}

	ViMode = utils.surround({ '', '' }, colors.bright_bg, { ViMode, Snippets })

	local Align = { provider = '%=' }
	local Space = { provider = ' ' }

	local DefaultStatusline = {
		ViMode,
		Space,
		WorkDir,
		{ provider = '%<' },
		Space,
		Git,
		Space,
		Diagnostics,
		Align,
		LSPActive,
		Space,
		Ruler,
		Space,
		ScrollBar,
	}

	local InactiveStatusline = {
		condition = function()
			return not conditions.is_active()
		end,
		{ hl = { fg = colors.gray, force = true }, WorkDir },
		FileNameBlock,
		{ provider = '%<' },
		Align,
	}

	local SpecialStatusline = {
		condition = function()
			return conditions.buffer_matches({
				buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
				filetype = { '^git.*' },
			})
		end,
		FileType,
		{ provider = '%q' },
		Space,
		HelpFilename,
		Align,
	}

	local TerminalStatusline = {
		condition = function()
			return conditions.buffer_matches({ buftype = { 'terminal' } })
		end,
		hl = { bg = colors.dark_red },
		{ condition = conditions.is_active, ViMode, Space },
		FileType,
		Space,
		TerminalName,
		Align,
	}

	local StatusLines = {
		hl = function()
			if conditions.is_active() then
				return {
					fg = utils.get_highlight('StatusLine').fg,
					bg = utils.get_highlight('StatusLine').bg,
				}
			else
				return {
					fg = utils.get_highlight('StatusLineNC').fg,
					bg = utils.get_highlight('StatusLineNC').bg,
				}
			end
		end,

		static = {
			mode_colors = {
				n = colors.red,
				i = colors.green,
				v = colors.cyan,
				V = colors.cyan,
				['\22'] = colors.cyan,
				c = colors.orange,
				s = colors.purple,
				S = colors.purple,
				['\19'] = colors.purple,
				R = colors.orange,
				r = colors.orange,
				['!'] = colors.red,
				t = colors.green,
			},
			mode_color = function(self)
				local mode = conditions.is_active() and vim.fn.mode() or 'n'
				return self.mode_colors[mode]
			end,
		},

		init = utils.pick_child_on_condition,

		SpecialStatusline,
		TerminalStatusline,
		InactiveStatusline,
		DefaultStatusline,
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
end

M.setup()

return M
