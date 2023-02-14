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
		cmp_kinds = vim.tbl_extend("force", { Copilot = "" }, kinds),
		dap = {
			Breakpoint = "● ",
			BreakpointRejected = " ",
			BreakpointCondition = " ",
			BreakpointLog = "● ",
			Stopped = " ",
		},
		diagnostics = { Error = " ", Warn = " ", Hint = " ", Info = " " },
		git = { branch = "  ", added = "  ", changed = "  ", removed = "  " },
	},
	-- exclude from indent lines
	ft_exclude = {
		"aerial",
		"checkhealth",
		"conf",
		"dashboard",
		"dap-repl",
		"help",
		"lazy",
		"lspinfo",
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
		-- "norg",
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
