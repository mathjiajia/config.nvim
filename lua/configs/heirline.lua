local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local colors = {
	bright_bg = "#2f312c",
	bright_fg = "#f1e9d2",
	red = "#dc4f62",
	dark_red = "#893f45",
	green = "#8fb573",
	blue = "#57a5e5",
	gray = "#5b5e5a",
	orange = "#ff9966",
	purple = "#aaaaff",
	cyan = "#70c2be",
}

local VimMode = {
	init = function(self)
		self.mode = vim.fn.mode()
	end,
	static = {
		modes = {
			n = "NORMAL",
			v = "VISUAL",
			V = "V-LINE",
			["\22"] = "V-BLCK",
			s = "SELECT",
			S = "S-LINE",
			["\19"] = "S-BLCK",
			i = "INSERT",
			R = "RPLACE",
			c = "CMMAND",
			r = " ...  ",
			["!"] = "SHELL ",
			t = " TERM ",
		},
		mode_colors = {
			n = "red",
			i = "green",
			v = "cyan",
			V = "cyan",
			["\22"] = "cyan",
			c = "orange",
			s = "purple",
			S = "purple",
			["\19"] = "purple",
			R = "orange",
			r = "orange",
			["!"] = "red",
			t = "red",
		},
	},
	update = {
		"ModeChanged",
		pattern = "*:*",
		callback = vim.schedule_wrap(function()
			vim.cmd.redrawstatus()
		end),
	},
	provider = function(self)
		return "  %2(" .. self.modes[self.mode] .. "%)"
	end,
	hl = function(self)
		local mode = self.mode
		return { fg = self.mode_colors[mode], bold = true }
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
		self.icon, self.icon_color = require("mini.icons").get("file", filename)
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return self.icon_color
	end,
}

local FileName = {
	provider = function(self)
		local filename = vim.fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]"
		end
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
	hl = { fg = utils.get_highlight("Directory").fg },
}

local FileFlags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = "[+]",
		hl = { fg = "green" },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = "",
		hl = { fg = "orange" },
	},
}

local FileNameModifer = {
	hl = function()
		if vim.bo.modified then
			return { fg = "cyan", bold = true, force = true }
		end
	end,
}

FileNameBlock =
	utils.insert(FileNameBlock, FileIcon, utils.insert(FileNameModifer, FileName), FileFlags, { provider = "%<" })

local WorkDir = {
	provider = function()
		local icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. "  "
		local cwd = vim.fn.getcwd(0)
		cwd = vim.fn.fnamemodify(cwd, ":~")
		if not conditions.width_percent_below(#cwd, 0.25) then
			cwd = vim.fn.pathshorten(cwd)
		end
		local trail = cwd:sub(-1) == "/" and "" or "/"
		return icon .. cwd .. trail
	end,
	hl = { fg = "blue", bold = true },
	on_click = {
		callback = function()
			require("oil").toggle_float()
		end,
		name = "heirline_workdir",
	},
}

local Git = {
	condition = conditions.is_git_repo,
	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,
	hl = { fg = "orange" },

	{
		provider = function(self)
			return "  " .. self.status_dict.head
		end,
		hl = { bold = true },
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = " (",
	},
	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and (" " .. count .. " ")
		end,
		hl = "GitSignsAdd",
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and (" " .. count .. " ")
		end,
		hl = "GitSignsDelete",
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and (" " .. count)
		end,
		hl = "GitSignsChange",
	},
	{
		condition = function(self)
			return self.has_changes
		end,
		provider = ")",
	},
	on_click = {
		callback = function()
			require("toggleterm.terminal").Terminal
				:new({
					cmd = "lazygit",
					dir = "git_dir",
					hidden = true,
					direction = "float",
					float_opts = { width = vim.o.columns, height = vim.o.lines },
				})
				:open()
		end,
		name = "heirline_git",
		update = false,
	},
}

local Diagnostics = {
	condition = conditions.has_diagnostics,
	static = { Error = " ", Warn = " ", Hint = " ", Info = " " },
	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,
	update = { "DiagnosticChanged", "BufEnter" },
	{
		provider = "![",
	},
	{
		provider = function(self)
			return self.errors > 0 and (self.Error .. self.errors .. " ")
		end,
		hl = "DiagnosticError",
	},
	{
		provider = function(self)
			return self.warnings > 0 and (self.Warn .. self.warnings .. " ")
		end,
		hl = "DiagnosticWarn",
	},
	{
		provider = function(self)
			return self.info > 0 and (self.Info .. self.info .. " ")
		end,
		hl = "DiagnosticInfo",
	},
	{
		provider = function(self)
			return self.hints > 0 and (self.Hint .. self.hints)
		end,
		hl = "DiagnosticHint",
	},
	{
		provider = "]",
	},
	on_click = {
		callback = function()
			vim.diagnostic.setloclist()
		end,
		name = "heirline_diagnostics",
	},
}

local LSPActive = {
	condition = conditions.lsp_attached,
	update = { "LspAttach", "LspDetach" },
	provider = function()
		local names = {}
		for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
			table.insert(names, server.name)
		end
		return " ◍ [" .. table.concat(names, ",") .. "]"
	end,
	hl = { fg = "green", bold = true },
	on_click = {
		callback = function()
			vim.defer_fn(function()
				vim.cmd.checkhealth("lspconfig")
			end, 100)
		end,
		name = "heirline_LSP",
	},
}

local Ruler = {
	provider = "%3l:%-3v󰀹 %P",
}

local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
	hl = { fg = "yellow", bold = true },
}

local Spell = {
	condition = function()
		return vim.wo.spell
	end,
	provider = "󰓆 Spell",
	hl = { bold = true, fg = "orange" },
}

local TerminalName = {
	provider = function()
		local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
		return " " .. tname
	end,
	hl = { fg = "blue", bold = true },
}

local HelpFileName = {
	condition = function()
		return vim.bo.filetype == "help"
	end,
	provider = function()
		local filename = vim.api.nvim_buf_get_name(0)
		return vim.fn.fnamemodify(filename, ":t")
	end,
	hl = { fg = colors.blue },
}

local Align = { provider = "%=" }
local Space = { provider = " " }

local DefaultStatusline = {
	VimMode,
	Space,
	WorkDir,
	FileNameBlock,
	Git,
	Align,
	Diagnostics,
	LSPActive,
	Space,
	Ruler,
	Space,
	FileType,
	Space,
	Spell,
}

local InactiveStatusline = {
	condition = conditions.is_not_active,
	Space,
	FileType,
	Space,
	FileName,
	Align,
}

local SpecialStatusline = {
	condition = function()
		return conditions.buffer_matches({
			buftype = { "nofile", "prompt", "help", "quickfix" },
			filetype = { "^git.*", "fugitive" },
		})
	end,

	FileType,
	Space,
	HelpFileName,
	Align,
}

local TerminalStatusline = {
	condition = function()
		return conditions.buffer_matches({ buftype = { "terminal" } })
	end,

	hl = { bg = "dark_red" },

	-- Quickly add a condition to the ViMode to only show it when buffer is active!
	{ condition = conditions.is_active, VimMode, Space },
	FileType,
	Space,
	TerminalName,
	Align,
}

local StatusLine = {
	fallthrough = false,
	SpecialStatusline,
	TerminalStatusline,
	InactiveStatusline,
	DefaultStatusline,
	hl = "StatusLine",
}

-- Tabline
local TablineBufnr = {
	provider = function(self)
		return tostring(self.bufnr) .. ". "
	end,
	hl = "Comment",
}

local TablineFileName = {
	provider = function(self)
		local filename = self.filename
		filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
		return filename
	end,
	hl = function(self)
		return { bold = self.is_active or self.is_visible, italic = true }
	end,
}

local TablineFileFlags = {
	{
		condition = function(self)
			return vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
		end,
		provider = " ● ", --[+]",
		hl = { fg = "green" },
	},
	{
		condition = function(self)
			return not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
				or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
		end,
		provider = function(self)
			if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
				return "  "
			else
				return ""
			end
		end,
		hl = { fg = "orange" },
	},
}

local TablineFileNameBlock = {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(self.bufnr)
	end,

	hl = function(self)
		if self.is_active then
			return "TabLineSel"
		-- elseif not vim.api.nvim_buf_is_loaded(self.bufnr) then
		--     return { fg = "gray" }
		else
			return "TabLine"
		end
	end,
	on_click = {
		callback = function(_, minwid, _, button)
			if button == "m" then -- close on mouse middle click
				vim.schedule(function()
					vim.api.nvim_buf_delete(minwid, { force = false })
				end)
			else
				vim.api.nvim_win_set_buf(0, minwid)
			end
		end,
		minwid = function(self)
			return self.bufnr
		end,
		name = "heirline_tabline_buffer_callback",
	},
	TablineBufnr,
	FileIcon,
	TablineFileName,
	TablineFileFlags,
}

local TablineCloseButton = {
	condition = function(self)
		return not vim.api.nvim_get_option_value("modified", { buf = self.bufnr })
	end,
	{ provider = " " },
	{
		provider = "✗",
		hl = { fg = "gray" },
		on_click = {
			callback = function(_, minwid)
				vim.schedule(function()
					vim.api.nvim_buf_delete(minwid, { force = false })
					vim.cmd.redrawtabline()
				end)
			end,
			minwid = function(self)
				return self.bufnr
			end,
			name = "heirline_tabline_close_buffer_callback",
		},
	},
}

local TablineBufferBlock = utils.surround({ "", "" }, function(self)
	if self.is_active then
		return utils.get_highlight("TabLineSel").bg
	else
		return utils.get_highlight("TabLine").bg
	end
end, { TablineFileNameBlock, TablineCloseButton })

local get_bufs = function()
	return vim.tbl_filter(function(bufnr)
		return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
	end, vim.api.nvim_list_bufs())
end

local buflist_cache = {}

vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
	callback = function()
		vim.schedule(function()
			local buffers = get_bufs()
			for i, v in ipairs(buffers) do
				buflist_cache[i] = v
			end
			for i = #buffers + 1, #buflist_cache do
				buflist_cache[i] = nil
			end

			if #buflist_cache > 1 then
				vim.o.showtabline = 2
			elseif vim.o.showtabline ~= 1 then
				vim.o.showtabline = 1
			end
		end)
	end,
})

local BufferLine = utils.make_buflist(
	TablineBufferBlock,
	{ provider = " ", hl = { fg = "gray" } },
	{ provider = " ", hl = { fg = "gray" } },
	function()
		return buflist_cache
	end,
	false
)

local Tabpage = {
	provider = function(self)
		return "%" .. self.tabnr .. "T " .. self.tabpage .. " %T"
	end,
	hl = function(self)
		if not self.is_active then
			return "TabLine"
		else
			return "TabLineSel"
		end
	end,
}

local TabpageClose = { provider = " %999X %X", hl = "TabLine" }

local TabPages = {
	condition = function()
		return #vim.api.nvim_list_tabpages() >= 2
	end,
	{ provider = "%=" },
	utils.make_tablist(Tabpage),
	TabpageClose,
}

local TabLineOffset = {
	condition = function(self)
		local win = vim.api.nvim_tabpage_list_wins(0)[1]
		local bufnr = vim.api.nvim_win_get_buf(win)
		self.winid = win
		-- if vim.bo[bufnr].filetype == "neo-tree" then
		-- 	self.title = "neo-tree"
		-- 	return true
		if vim.bo[bufnr].filetype == "aerial" then
			self.title = "aerial"
			return true
		end
	end,

	provider = function(self)
		local title = self.title
		local width = vim.api.nvim_win_get_width(self.winid)
		local pad = math.ceil((width - #title) / 2)
		return string.rep(" ", pad) .. title .. string.rep(" ", pad)
	end,

	hl = function(self)
		if vim.api.nvim_get_current_win() == self.winid then
			return "TablineSel"
		else
			return "Tabline"
		end
	end,
}

local TabLine = { TabLineOffset, BufferLine, TabPages }

require("heirline").setup({
	statusline = StatusLine,
	tabline = TabLine,
	opts = { colors = colors },
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	callback = function()
		if vim.list_contains({ "wipe", "delete" }, vim.api.nvim_get_option_value("bufhidden", {})) then
			vim.opt_local.buflisted = false
		end
	end,
	group = vim.api.nvim_create_augroup("Heirline", {}),
})
