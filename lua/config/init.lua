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
			Array = "",
			Boolean = "",
			Key = "",
			Namespace = "",
			Null = "󰟢",
			Number = "",
			Object = "",
			Package = "",
			String = "",
		}, kinds),
		cmp_kinds = vim.tbl_extend("force", { Copilot = "" }, kinds),
		dap = {
			Stopped = "󰁕 ",
			Breakpoint = " ",
			BreakpointCondition = " ",
			BreakpointRejected = " ",
			LogPoint = ".>",
		},
		diagnostics = { Error = " ", Warn = " ", Hint = " ", Info = " " },
		git = { branch = "  ", added = "  ", changed = "  ", removed = "  " },
	},
	-- exclude from indent lines
	ft_exclude = {
		"aerial",
		"chatgpt",
		"checkhealth",
		"conf",
		"crunner",
		"dashboard",
		"dap-repl",
		"help",
		"lazy",
		"lspinfo",
		"man",
		"markdown",
		"mason",
		"neo-tree",
		"norg",
		"notify",
		"qf",
		"query",
	},
}

setmetatable(M, {
	__index = function(_, key)
		return options[key]
	end,
})

return M
