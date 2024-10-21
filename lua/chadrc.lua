-- stylua: ignore start
vim.keymap.set("n", "<RightMouse>", function()
	vim.cmd.exec('"normal! \\<RightMouse>"')
	local options = vim.bo.ft == "NvimTree" and "nvimtree" or "gitsigns"
	require("menu").open(options, { mouse = true })
end, { desc = "Menu" })

vim.keymap.set("n", "<C-t>", function() require("menu").open("default") end, { desc = "Menu" })
vim.keymap.set("n", "<leader>tm", function() require("nvchad.themes").open() end, { desc = "Themes Picker" })
-- stylua: ignore end

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
		-- buttons = {
		-- 	{ txt = "  Find File", keys = "ff", cmd = "FzfLua files" },
		-- 	{ txt = "  Recent Files", keys = "fo", cmd = "FzfLua oldfiles" },
		-- 	{ txt = "󰈭  Find Word", keys = "sg", cmd = "FzfLua live_grep" },
		-- 	{ txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
		-- 	{ txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
		--
		-- 	{ txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
		--
		-- 	{
		-- 		txt = function()
		-- 			local stats = require("lazy").stats()
		-- 			local ms = math.floor(stats.startuptime) .. " ms"
		-- 			return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
		-- 		end,
		-- 		hl = "NvDashLazy",
		-- 		no_gap = true,
		-- 	},
		--
		-- 	{ txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },
		-- },
	},

	term = {
		winopts = { number = false, relativenumber = false },
		float = { width = 1, height = 1, border = "rounded" },
	},

	lsp = { signature = true },
	cheatsheet = { excluded_groups = { ":help", "autopairs", "Opens" } },
}

return options
