local M = {}

local kinds = {
	Class = "",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "",
	Function = "",
	Interface = "",
	Keyword = "",
	Method = "",
	Module = "",
	Operator = "",
	Property = "",
	Reference = "",
	Snippet = "",
	Struct = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "",
}

local options = {
	-- icons used by other plugins
	icons = {
		aerial = vim.tbl_extend("force", {
			Array = " ",
			Boolean = " ",
			Key = " ",
			Namespace = " ",
			Null = "ﳠ ",
			Number = " ",
			Object = " ",
			Package = " ",
			String = " ",
		}, kinds),
		cmp_kinds = kinds,
		dap = {
			Breakpoint = "● ",
			BreakpointRejected = " ",
			BreakpointCondition = " ",
			BreakpointLog = "● ",
			Stopped = " ",
		},
		diagnostics = { Error = " ", Warn = " ", Hint = " ", Info = " " },
		git = { added = " ", changed = " ", removed = " " },
	},
	-- colors for Lspsaga
	colors = {
		normal_bg = "#1e2030",
		title_bg = "#c3e88d",
		red = "#ff757f",
		magenta = "#c099ff",
		orange = "#ff966c",
		yellow = "#ffc777",
		green = "#c3e88d",
		cyan = "#86e1fc",
		blue = "#82aaff",
		purple = "#fca7ea",
		white = "#d1d4cf",
		black = "#1e2030",
	},
	-- exclude from indent lines
	ft_exclude = {
		"aerial",
		"alpha",
		"checkhealth",
		"conf",
		"dap-repl",
		"help",
		"lazy",
		"lspinfo",
		"lspsagafinder",
		"lspsagaoutline",
		"markdown",
		"mason",
		"neo-tree",
		"norg",
		"Trouble",
	},
	-- cli tools
	ms_install = { "black", "debugpy", "markdownlint", "prettierd", "stylua", "tectonic" },
	-- treesitter parsers
	ts_install = {
		"bash",
		"bibtex",
		"c",
		"diff",
		"fish",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"help",
		"latex",
		"lua",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"regex",
		"swift",
		"vim",
	},
}

setmetatable(M, {
	__index = function(_, key)
		return options[key]
	end,
})

return M
