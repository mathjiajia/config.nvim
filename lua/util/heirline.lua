local api, fn = vim.api, vim.fn

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local devicons = require("nvim-web-devicons")
local Util = require("util")

local colors = {
	green = utils.get_highlight("String").fg,
	blue = utils.get_highlight("Function").fg,
	gray = utils.get_highlight("NonText").fg,
	orange = utils.get_highlight("Constant").fg,
	purple = utils.get_highlight("Statement").fg,
	cyan = utils.get_highlight("Special").fg,
}

require("heirline").load_colors(colors)

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
	},

	provider = function(self)
		return "  %2(" .. self.modes[self.mode] .. "%)"
	end,
	hl = { fg = "fg" },

	-- update = { "ModeChanged" },
}

local Snippets = {
	condition = function()
		return vim.tbl_contains({ "i", "s" }, fn.mode())
	end,
	provider = function()
		local ls = require("luasnip")
		local forward = ls.locally_jumpable(1) and "" or ""
		local backward = ls.locally_jumpable(-1) and " " or ""
		return backward .. forward
	end,
	hl = { fg = "purple" },
}

local WorkDir = {
	provider = function()
		local icon = (fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
		local cwd = fn.getcwd(0)
		cwd = fn.fnamemodify(cwd, ":~")
		if not conditions.width_percent_below(#cwd, 0.25) then
			cwd = fn.pathshorten(cwd)
		end
		local trail = cwd:sub(-1) == "/" and "" or "/"
		return icon .. cwd .. trail
	end,

	on_click = {
		callback = function()
			require("neo-tree.command").execute({ dir = Util.get_root() })
		end,
		name = "heirline_workdir",
	},
}

local Git = {
	condition = conditions.is_git_repo,

	static = require("config").icons.git,

	init = function(self)
		---@diagnostic disable-next-line: undefined-field
		self.status_dict = vim.b.gitsigns_status_dict
		self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
	end,

	{
		provider = function(self)
			return self.branch .. self.status_dict.head
		end,
	},

	{
		provider = function(self)
			local count = self.status_dict.added or 0
			return count > 0 and (self.added .. count)
		end,
		hl = "GitSignsAdd",
	},
	{
		provider = function(self)
			local count = self.status_dict.removed or 0
			return count > 0 and (self.removed .. count)
		end,
		hl = "GitSignsDelete",
	},
	{
		provider = function(self)
			local count = self.status_dict.changed or 0
			return count > 0 and (self.changed .. count)
		end,
		hl = "GitSignsChange",
	},

	on_click = {
		callback = function()
			Util.float_term({ "lazygit" }, { cwd = Util.get_root() })
		end,
		name = "heirline_git",
		update = false,
	},
}

local Diagnostics = {
	condition = conditions.has_diagnostics,

	static = require("config").icons.diagnostics,

	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,

	update = { "DiagnosticChanged", "BufEnter" },

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

	on_click = {
		callback = function()
			vim.diagnostic.setqflist()
		end,
		name = "heirline_diagnostics",
	},
}

local LSPActive = {
	condition = conditions.lsp_attached,
	update = { "LspAttach", "LspDetach" },

	provider = function()
		local names = {}
		for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			table.insert(names, server.name)
		end
		return " ◍ [" .. table.concat(names, ",") .. "]"
	end,

	on_click = {
		callback = function()
			vim.defer_fn(function()
				require("lspconfig.ui.lspinfo")()
			end, 100)
		end,
		name = "heirline_LSP",
	},
}

local Ruler = { provider = "%3l:%-3v 󰀹 %3p%%" }

local Spell = {
	condition = function()
		return vim.wo.spell
	end,
	provider = "󰓆 Spell",
}

local FileNameBlock = {
	init = function(self)
		self.filename = api.nvim_buf_get_name(0)
	end,
}

local FileIcon = {
	init = function(self)
		local filename = self.filename
		local extension = fn.fnamemodify(filename, ":e")
		self.icon, self.icon_color = devicons.get_icon_color(filename, extension, { default = true })
	end,
	provider = function(self)
		return self.icon and (self.icon .. " ")
	end,
	hl = function(self)
		return { fg = self.icon_color }
	end,
}

local FileName = {
	provider = function(self)
		local filename = fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]"
		end
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = fn.pathshorten(filename)
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

local FileType = {
	provider = function()
		return string.upper(vim.bo.filetype)
	end,
}

local TerminalName = {
	provider = function()
		local tname, _ = api.nvim_buf_get_name(0):gsub(".*:", "")
		return " " .. tname
	end,
	hl = { fg = "blue" },
}

local HelpFileName = {
	condition = function()
		return vim.bo.filetype == "help"
	end,
	provider = function()
		local filename = api.nvim_buf_get_name(0)
		return fn.fnamemodify(filename, ":t")
	end,
	hl = { fg = "blue" },
}

local Align = { provider = "%=" }
local Space = { provider = " " }

local DefaultStatusline = {
	VimMode,
	Snippets,
	Space,
	WorkDir,
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

	{ condition = conditions.is_active, VimMode, Space },
	FileType,
	Space,
	TerminalName,
	Align,
}

local StatusLine = {
	hl = function()
		if conditions.is_active() then
			return "StatusLine"
		else
			return "StatusLineNC"
		end
	end,

	fallthrough = false,

	SpecialStatusline,
	TerminalStatusline,
	InactiveStatusline,
	DefaultStatusline,
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
		filename = filename == "" and "[No Name]" or fn.fnamemodify(filename, ":t")
		return filename
	end,
	hl = function(self)
		return { bold = self.is_active or self.is_visible }
	end,
}

local TablineFileFlags = {
	{
		condition = function(self)
			return api.nvim_buf_get_option(self.bufnr, "modified")
		end,
		provider = "[+]",
		hl = { fg = "green" },
	},
	{
		condition = function(self)
			return not api.nvim_buf_get_option(self.bufnr, "modifiable") or api.nvim_buf_get_option(self.bufnr, "readonly")
		end,
		provider = function(self)
			if api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
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
		self.filename = api.nvim_buf_get_name(self.bufnr)
	end,
	hl = function(self)
		if self.is_active then
			return "TabLineSel"
		else
			return "TabLine"
		end
	end,
	TablineBufnr,
	FileIcon,
	TablineFileName,
	TablineFileFlags,

	on_click = {
		callback = function(_, minwid, _, button)
			if button == "m" then
				api.nvim_buf_delete(minwid, { force = false })
			else
				api.nvim_win_set_buf(0, minwid)
			end
		end,
		minwid = function(self)
			return self.bufnr
		end,
		name = "heirline_tabline_buffer_callback",
	},
}

local TablineCloseButton = {
	condition = function(self)
		return not api.nvim_buf_get_option(self.bufnr, "modified")
	end,
	{ provider = " " },
	{
		provider = "✗",
		hl = { fg = "gray" },
		on_click = {
			callback = function(_, minwid)
				api.nvim_buf_delete(minwid, { force = false })
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

local BufferLine = utils.make_buflist(
	TablineBufferBlock,
	{ provider = " ", hl = { fg = "gray" } },
	{ provider = " ", hl = { fg = "gray" } }
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

local TabpageClose = { provider = " %999X %X", hl = "TabLine" }

local TabPages = {
	condition = function()
		return #api.nvim_list_tabpages() >= 2
	end,
	{ provider = "%=" },
	utils.make_tablist(Tabpage),
	TabpageClose,
}

local TabLineOffset = {
	condition = function(self)
		local win = api.nvim_tabpage_list_wins(0)[1]
		-- local bufnr = api.nvim_win_get_buf(win)
		self.winid = win

		-- if vim.bo[bufnr].filetype == "neo-tree" then
		--   self.title = "neo-tree"
		--   return true
		-- elseif vim.bo[bufnr].filetype == "aerial" then
		--   self.title = "aerial"
		--   return true
		-- end
	end,

	provider = function(self)
		local title = self.title
		local width = api.nvim_win_get_width(self.winid)
		local pad = math.ceil((width - #title) / 2)
		return string.rep(" ", pad) .. title .. string.rep(" ", pad)
	end,

	hl = function(self)
		if api.nvim_get_current_win() == self.winid then
			return "TablineSel"
		else
			return "Tabline"
		end
	end,
}

local TabLine = { TabLineOffset, BufferLine, TabPages }

vim.opt.showtabline = 2

require("heirline").setup({
	statusline = StatusLine,
	-- winbar = WinBar,
	tabline = TabLine,
	-- statuscolumn = StatusColumn,
})

api.nvim_create_augroup("Heirline", {})
api.nvim_create_autocmd({ "FileType" }, {
	command = "if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif",
	group = "Heirline",
})
