local fn = vim.fn

local binary_path = fn.stdpath('data') .. '/lazy/nvim-texlabconfig/nvim-texlabconfig'
local cache_path = fn.stdpath('cache')

-- Add any servers here together with their settings
local servers = {
	pyright = {},
	sourcekit = {},
	sumneko_lua = {
		settings = {
			Lua = {
				workspace = { checkThirdParty = false },
			},
		},
	},
	texlab = {
		settings = {
			texlab = {
				build = {
					-- executable = 'tectonic',
					args = {
						-- NOTE: latexmk
						'-xelatex',
						-- '-verbose',
						'-synctex=1',
						'-interaction=nonstopmode',
						'%f',
						--  NOTE: tectonic
						-- 	'-X',
						-- 	'compile',
						-- 	'%f',
						-- 	'--synctex',
						-- 	'--keep-logs',
						-- 	'--keep-intermediates',
					},
					-- forwardSearchAfter = true,
					onSave = true,
				},
				forwardSearch = {
					executable = 'sioyek',
					-- executable = '/Applications/Skim.app/Contents/SharedSupport/displayline'
					args = {
						'--inverse-search',
						binary_path .. ' -file %1 -line %2 -cache_root ' .. cache_path,
						'--reuse-window',
						'--forward-search-file',
						'%f',
						'--forward-search-line',
						'%l',
						'%p',
					},
				},
				-- chktex = {
				-- onOpenAndSave = true,
				-- },
				diagnostics = {
					ignoredPatterns = {
						'^Overfull',
						'^Underfull',
					},
				},
			},
		},
	},
}

return servers
