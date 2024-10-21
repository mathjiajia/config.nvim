-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
	require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')
	require("menu").open("gitsigns", { mouse = true })
end, {})

return {
	base46 = {
		theme = "onedark", -- default theme
		hl_add = {},
		hl_override = {},
		integrations = {
			"blankline",
			"cmp",
			"dap",
			"defaults",
			"git",
			"lsp",
			"markview",
			"notify",
			"nvcheatsheet",
			"nvdash",
			"semantic_tokens",
			"statusline",
			"syntax",
			"treesitter",
			"tbline",
		},
		changed_themes = {},
		transparency = false,
		theme_toggle = { "onedark", "one_light" },
	},

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

		buttons = {
			{ txt = "  Find File", keys = "ff", cmd = "FzfLua files" },
			{ txt = "  Recent Files", keys = "fo", cmd = "FzfLua oldfiles" },
			{ txt = "󰈭  Find Word", keys = "fw", cmd = "FzfLua live_grep" },
			{ txt = "󱥚  Themes", keys = "kt", cmd = ":lua require('nvchad.themes').open()" },
			{ txt = "  Mappings", keys = "cs", cmd = "NvCheatsheet" },

			{ txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

			{
				txt = function()
					local stats = require("lazy").stats()
					local ms = math.floor(stats.startuptime) .. " ms"
					return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
				end,
				hl = "NvDashLazy",
				no_gap = true,
			},

			{ txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
		},
	},

	term = {
		winopts = { number = false, relativenumber = false },
		sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
		float = {
			relative = "editor",
			width = 1,
			height = 1,
			border = "rounded",
		},
	},

	lsp = { signature = true },

	cheatsheet = {
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},
}
