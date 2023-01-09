local fn = vim.fn

local binary_path = fn.stdpath("data") .. "/lazy/nvim-texlabconfig/nvim-texlabconfig"
local cache_path = fn.stdpath("cache")

-- Add any servers here together with their settings
local servers = {
	clangd = {},
	pyright = {},
	sumneko_lua = {
		settings = {
			Lua = { workspace = { checkThirdParty = false } },
		},
	},
	texlab = {
		settings = {
			texlab = {
				build = {
					executable = "tectonic",
					-- NOTE: latexmk
					-- args = {
					--   "-xelatex",
					--   -- '-verbose',
					--   "-synctex=1",
					--   "-interaction=nonstopmode",
					--   "%f",
					-- },
					-- NOTE: tectonic
					args = {
						"-X",
						"compile",
						"%f",
						"--synctex",
						"--keep-logs",
						"--keep-intermediates",
					},
					-- forwardSearchAfter = true,
					onSave = true,
				},
				forwardSearch = {
					executable = "sioyek",
					args = {
						"--inverse-search",
						binary_path .. " -file %1 -line %2 -cache_root " .. cache_path,
						"--reuse-window",
						"--forward-search-file",
						"%f",
						"--forward-search-line",
						"%l",
						"%p",
					},
					--  NOTE: skim
					-- executable = '/Applications/Skim.app/Contents/SharedSupport/displayline',
					-- args = {'%l', '%p', '%f'},
				},
				chktex = { onOpenAndSave = true },
				diagnostics = { ignoredPatterns = { "^Overfull", "^Underfull" } },
			},
		},
	},
}

return servers
