local M = {}

local options = {
	-- icons used by other plugins
	icons = {
		cmp_kinds = {
			Class = "",
			Color = "",
			Constant = "",
			Constructor = "",
			Copilot = "",
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
		},
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
