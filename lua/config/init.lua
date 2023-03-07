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
		"chatgpt",
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
		"qf",
		"query",
		"norg",
		"Trouble",
	},
}

setmetatable(M, {
	__index = function(_, key)
		return options[key]
	end,
})

return M
