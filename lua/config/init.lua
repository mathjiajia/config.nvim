local M = {}

local fn = vim.fn

local builder = "latexmk"
local viewer = "sioyek"

local build, forwardSearch
if builder == "tectonic" then
	build = {
		executable = "executable",
		args = { "-X", "compile", "%f", "--synctex", "--keep-logs", "--keep-intermediates" },
	}
else
	build = { args = { "-xelatex", "-interaction=nonstopmode", "-synctex=1", "%f" } }
end

local binary_path = fn.stdpath("data") .. "/lazy/nvim-texlabconfig/nvim-texlabconfig"
local cache_path = fn.stdpath("cache")

if viewer == "sioyek" then
	forwardSearch = {
		executable = "sioyek",
		args = {
			-- "--execute-command",
			-- "turn_on_synctex",
			"--inverse-search",
			binary_path .. " -file %1 -line %2 -cache_root " .. cache_path,
			"--reuse-window",
			"--forward-search-file",
			"%f",
			"--forward-search-line",
			"%l",
			"%p",
		},
	}
else
	forwardSearch = {
		executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
		args = { "%l", "%p", "%f" },
	}
end

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
	colors = {
		--float window normal bakcground color
		normal_bg = "#1e2030",
		--title background color
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
	-- indent lines
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
	ms_install = {
		"black",
		"debugpy",
		"markdownlint",
		"prettierd",
		"stylua",
		"tectonic",
	},
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
	servers = {
		clangd = {},
		pyright = {},
		sumneko_lua = { settings = { Lua = { workspace = { checkThirdParty = false } } } },
		texlab = {
			settings = {
				texlab = {
					build = vim.tbl_extend("force", {
						-- forwardSearchAfter = true,
						onSave = true,
					}, build),
					forwardSearch = forwardSearch,
					chktex = { onOpenAndSave = false },
					diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
				},
			},
		},
	},
}

setmetatable(M, {
	__index = function(_, key)
		return options[key]
	end,
})

return M
