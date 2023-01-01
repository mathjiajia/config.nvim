local M = {
	'rebelot/heirline.nvim',
	event = 'BufReadPre',
}

function M.config()
	local conditions = require('heirline.conditions')
	local utils = require('heirline.utils')
	local api, fn = vim.api, vim.fn

	local colors = {
		bright_bg  = utils.get_highlight('Folded').fg,
		-- bright_fg  = utils.get_highlight('Folded').fg,
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
		git_del    = utils.get_highlight('Error').fg,
		git_add    = utils.get_highlight('Comment').fg,
		git_change = utils.get_highlight('Function').fg,
		work_dir   = utils.get_highlight('Directory').fg,
	}

	require('heirline').load_colors(colors)

	local modes_table = {
		n         = { 'NORMAL', 'fg' },
		no        = { 'OPPEND', 'blue' },
		nov       = { 'N?', 'blue' },
		noV       = { 'N?', 'blue' },
		['no\22'] = { 'N?', 'blue' },
		niI       = { 'Ni', 'red' },
		niR       = { 'Nr', 'red' },
		niV       = { 'Nv', 'red' },
		nt        = { 'N-TERM', 'red' },
		v         = { 'VISUAL', 'cyan' },
		vs        = { 'Vs', 'cyan' },
		V         = { 'V-LINE', 'cyan' },
		Vs        = { 'Vs', 'cyan' },
		['\22']   = { 'V-BLCK', 'cyan' },
		['\22s']  = { '^V', 'cyan' },
		s         = { 'SELECT', 'purple' },
		S         = { 'S-LINE', 'purple' },
		['\19']   = { 'S-BLCK', 'purple' },
		i         = { 'INSERT', 'blue' },
		ic        = { 'ICOMPL', 'blue' },
		ix        = { 'Ix', 'blue' },
		R         = { 'RPLACE', 'orange' },
		Rc        = { 'Rc', 'orange' },
		Rx        = { 'Rx', 'orange' },
		Rv        = { 'VRPLCE', 'orange' },
		Rvc       = { 'Rv', 'orange' },
		Rvx       = { 'Rv', 'orange' },
		c         = { 'CMMAND', 'green' },
		cv        = { 'PROMPT', 'green' },
		r         = { '...', 'green' },
		rm        = { 'MORE', 'green' },
		['r?']    = { 'CNFIRM', 'green' },
		['!']     = { 'SHELL', 'red' },
		t         = { 'TERM', 'red' },
	}

	local mode_colors = setmetatable({
		n = { fg = 'fg' }
	}, {
		__index = function(_, mode)
			return {
				fg = 'bg',
				bg = modes_table[mode][2],
			}
		end
	})

	local LeftCap = {
		provider = '▌',
		hl = { fg = 'fg' }
	}

	local VimModeNormal = {
		condition = function(self)
			return self.mode == 'n'
		end,
		provider = ' ●',
		hl = { fg = 'fg' }
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
						return '● ' .. modes_table[self.mode][1]
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
			self.mode = fn.mode()
		end,

		VimModeNormal, VimModeOthers,

		update = { 'ModeChanged' }
	}

	local Snippets = {
		condition = function()
			return vim.tbl_contains({ 'i', 's' }, fn.mode())
		end,
		provider = function()
			local ls = require('luasnip')
			local forward = ls.locally_jumpable(1) and '' or ''
			local backward = ls.locally_jumpable(-1) and ' ' or ''
			return backward .. forward
		end,
		hl = { fg = 'red', bold = true },
	}

	local WorkDir = {
		init = function(self)
			self.icon = (fn.haslocaldir(0) == 1 and 'l' or 'g') .. ' ' .. ' '
			local cwd = fn.getcwd(0)
			self.cwd = fn.fnamemodify(cwd, ':~')
			if not conditions.width_percent_below(#self.cwd, 0.27) then
				self.cwd = fn.pathshorten(self.cwd)
			end
		end,
		hl = { fg = 'blue', bold = true },
		on_click = {
			callback = function()
				require('neo-tree.command')._command('toggle')
			end,
			name = 'heirline_workdir',
		},

		flexible = 1,
		{
			provider = function(self)
				local trail = self.cwd:sub(-1) == '/' and '' or '/'
				return self.icon .. self.cwd .. trail .. ' '
			end,
		},
		{
			provider = function(self)
				local cwd = fn.pathshorten(self.cwd)
				local trail = self.cwd:sub(-1) == '/' and '' or '/'
				return self.icon .. cwd .. trail .. ' '
			end,
		},
		{
			provider = '',
		},
	}

	local FileNameBlock = {
		init = function(self)
			self.filename = api.nvim_buf_get_name(0)
		end,
	}

	local FileIcon = {
		init = function(self)
			local filename = self.filename
			local extension = fn.fnamemodify(filename, ':e')
			self.icon, self.icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, {
				default = true
			})
		end,
		provider = function(self)
			return self.icon and (self.icon .. ' ')
		end,
		hl = function(self)
			return { fg = self.icon_color }
		end
	}

	local FileName = {
		init = function(self)
			self.lfilename = fn.fnamemodify(self.filename, ':.')
			if self.lfilename == '' then
				self.lfilename = '[No Name]'
			end
			if not conditions.width_percent_below(#self.lfilename, 0.27) then
				self.lfilename = fn.pathshorten(self.lfilename)
			end
		end,
		hl = 'Directory',
		flexible = 2,
		{
			provider = function(self)
				return self.lfilename
			end,
		},
		{
			provider = function(self)
				return fn.pathshorten(self.lfilename)
			end,
		},
	}

	local FileFlags = {
		{
			condition = function()
				return vim.bo.modified
			end,
			provider = '[+]',
			hl = { fg = 'green' },
		},
		{
			condition = function()
				return not vim.bo.modifiable or vim.bo.readonly
			end,
			provider = '',
			hl = { fg = 'orange' },
		},
	}

	local FileNameModifer = {
		hl = function()
			if vim.bo.modified then
				return { fg = 'cyan', bold = true, force = true }
			end
		end,
	}

	FileNameBlock = utils.insert(FileNameBlock,
		FileIcon,
		utils.insert(FileNameModifer, FileName),
		unpack(FileFlags),
		{ provider = '%<' }
	)

	local FileType = {
		provider = function()
			return string.upper(vim.bo.filetype)
		end,
		hl = { fg = utils.get_highlight('Type').fg, bold = true },
	}

	local Diagnostics = {
		condition = conditions.has_diagnostics,
		update = { 'DiagnosticChanged', 'BufEnter' },
		-- on_click = {
		-- 	callback = function()
		-- 		require('trouble').toggle({ mode = 'document_diagnostics' })
		-- 	end,
		-- 	name = 'heirline_diagnostics',
		-- },

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
			provider = '![',
		},
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

		on_click = {
			callback = function()
				vim.defer_fn(function()
					require('FTerm')
						:new({
							cmd = 'lazygit',
							dimensions = { height = 1, width = 1 }
						})
						:open()
				end, 100)
			end,
			name = 'heirline_git',
			update = false,
		},

		hl = { fg = 'work_dir' },

		{
			provider = function(self)
				return ' ' .. self.status_dict.head
			end,
			hl = { bold = true }
		},

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
					require('lspconfig.ui.lspinfo')()
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
		provider = ' %3p%% %2l(%02c)/%-3L'
	}

	local ScrollBar = {
		static = {
			sbar = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
			-- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
		},
		provider = function(self)
			local curr_line = api.nvim_win_get_cursor(0)[1]
			local lines = api.nvim_buf_line_count(0)
			local i
			if lines > 0 then
				i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
			else
				i = #self.sbar
			end
			return string.rep(self.sbar[i], 2)
		end,
		hl = { fg = 'blue', bg = 'bright_bg' },
	}

	local TerminalName = {
		provider = function()
			local tname, _ = api.nvim_buf_get_name(0):gsub('.*:', '')
			return ' ' .. tname
		end,
		hl = { fg = 'blue', bold = true },
	}

	local HelpFileName = {
		condition = function()
			return vim.bo.filetype == 'help'
		end,
		provider = function()
			local filename = api.nvim_buf_get_name(0)
			return fn.fnamemodify(filename, ':t')
		end,
		hl = { fg = 'blue' },
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

		fallthrough = false,

		SpecialStatusline, TerminalStatusline, InactiveStatusline, DefaultStatusline,
	}

	-- local WinBar = {
	-- 	fallthrough = false,
	-- 	{
	-- 		condition = function()
	-- 			return conditions.buffer_matches({
	-- 				buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
	-- 				filetype = { '^git.*' },
	-- 			})
	-- 		end,
	-- 		init = function()
	-- 			vim.opt_local.winbar = nil
	-- 		end
	-- 	},
	-- 	{
	-- 		condition = function()
	-- 			return conditions.buffer_matches({ buftype = { 'terminal' } })
	-- 		end,
	-- 		utils.surround({ '', '' }, 'dark_red', {
	-- 			FileType,
	-- 			Space,
	-- 			TerminalName,
	-- 		}),
	-- 	},
	-- 	{
	-- 		condition = function()
	-- 			return not conditions.is_active()
	-- 		end,
	-- 		utils.surround({ '', '' }, 'bright_bg', { hl = { fg = 'gray', force = true }, FileNameBlock }),
	-- 	},

	-- 	utils.surround({ '', '' }, 'bright_bg', FileNameBlock),
	-- }

	local TablineBufnr = {
		provider = function(self)
			return tostring(self.bufnr) .. '. '
		end,
		hl = 'String',
	}

	local TablineFileName = {
		provider = function(self)
			local filename = self.filename
			filename = filename == '' and '[No Name]' or fn.fnamemodify(filename, ':t')
			return filename
		end,
		hl = function(self)
			return { bold = self.is_active or self.is_visible, italic = true }
		end,
	}

	local TablineFileFlags = {
		{
			condition = function(self)
				return api.nvim_buf_get_option(self.bufnr, 'modified')
			end,
			provider = '[+]',
			hl = { fg = 'green' },
		},
		{
			condition = function(self)
				return not api.nvim_buf_get_option(self.bufnr, 'modifiable')
					or api.nvim_buf_get_option(self.bufnr, 'readonly')
			end,
			provider = function(self)
				if api.nvim_buf_get_option(self.bufnr, 'buftype') == 'terminal' then
					return '  '
				else
					return ''
				end
			end,
			hl = { fg = 'orange' },
		},
	}

	local TablineFileNameBlock = {
		init = function(self)
			self.filename = api.nvim_buf_get_name(self.bufnr)
		end,
		hl = function(self)
			if self.is_active then
				return 'TabLineSel'
				-- elseif not api.nvim_buf_is_loaded(self.bufnr) then
				-- 	return { fg = 'gray' }
			else
				return 'TabLine'
			end
		end,
		on_click = {
			callback = function(_, minwid, _, button)
				if (button == 'm') then
					api.nvim_buf_delete(minwid, { force = false })
				else
					api.nvim_win_set_buf(0, minwid)
				end
			end,
			minwid = function(self)
				return self.bufnr
			end,
			name = 'heirline_tabline_buffer_callback',
		},
		TablineBufnr,
		FileIcon,
		TablineFileName,
		TablineFileFlags,
	}

	local TablineCloseButton = {
		condition = function(self)
			return not api.nvim_buf_get_option(self.bufnr, 'modified')
		end,
		{ provider = ' ' },
		{ -- ✗    
			provider = '',
			hl = { fg = 'gray' },
			on_click = {
				callback = function(_, minwid)
					api.nvim_buf_delete(minwid, { force = false })
				end,
				minwid = function(self)
					return self.bufnr
				end,
				name = 'heirline_tabline_close_buffer_callback',
			},
		},
	}

	local TablineBufferBlock = utils.surround({ '', '' }, function(self)
		if self.is_active then
			return utils.get_highlight('TabLineSel').bg
		else
			return utils.get_highlight('TabLine').bg
		end
	end, { TablineFileNameBlock, TablineCloseButton })


	local BufferLine = utils.make_buflist(
		TablineBufferBlock,
		{ provider = ' ', hl = { fg = 'gray' } },
		{ provider = ' ', hl = { fg = 'gray' } }
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
		provider = ' %999X %X',
		hl = 'TabLine',
	}

	local TabPages = {
		condition = function()
			return #api.nvim_list_tabpages() >= 2
		end,
		{ provider = '%=' },
		utils.make_tablist(Tabpage),
		TabpageClose,
	}

	local TabLineOffset = {
		condition = function(self)
			local win = api.nvim_tabpage_list_wins(0)[1]
			-- local bufnr = api.nvim_win_get_buf(win)
			self.winid = win

			-- if vim.bo[bufnr].filetype == 'neo-tree' then
			-- 	self.title = 'neo-tree'
			-- 	return true
			-- elseif vim.bo[bufnr].filetype == 'aerial' then
			-- 	self.title = 'aerial'
			-- 	return true
			-- end
		end,

		provider = function(self)
			local title = self.title
			local width = api.nvim_win_get_width(self.winid)
			local pad = math.ceil((width - #title) / 2)
			return string.rep(' ', pad) .. title .. string.rep(' ', pad)
		end,

		hl = function(self)
			if api.nvim_get_current_win() == self.winid then
				return 'TablineSel'
			else
				return 'Tabline'
			end
		end,
	}

	local TabLine = { TabLineOffset, BufferLine, TabPages }

	require('heirline').setup(StatusLines, nil, TabLine)

	vim.o.showtabline = 2
	api.nvim_create_autocmd({ 'FileType' }, {
		pattern = '*',
		command = 'if index(["wipe", "delete"], &bufhidden) >= 0 | set nobuflisted | endif'
	})

end

return M
