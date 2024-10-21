-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')

	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "gitsigns"
	require("menu").open(options, { mouse = true })
end, {})

local options = {
	base46 = {
		theme = "onedark",
		transparency = false,
		theme_toggle = { "onedark", "onedark" },
		integrations = {
			"cmp",
			"codeactionmenu",
			"dap",
			"defaults",
			"git",
			"lsp",
			"markview",
			"mason",
			"notify",
			"nvcheatsheet",
			"nvdash",
			"nvimtree",
			"nvshades",
			"rainbowdelimiters",
			"semantic_tokens",
			"statusline",
			"syntax",
			"telescope",
			"treesitter",
			"tbline",
		},
	},

	ui = { statusline = { order = { "mode", "file", "git", "%=", "diagnostics", "lsp", "cwd", "cursor" } } },

	nvdash = {
		load_on_startup = true,
		header = {
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
		},
	},

	term = {
		winopts = { number = false, relativenumber = false },
		float = { relative = "editor", width = 1, height = 1, border = "rounded" },
	},

	lsp = { signature = true },
	cheatsheet = { excluded_groups = { ":help", "autopairs", "Opens" } },
}

return options
