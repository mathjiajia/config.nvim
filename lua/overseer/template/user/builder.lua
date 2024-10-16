local builders = {
	c = {
		name = "C",
		filerunner = function()
			return "cd "
				.. vim.fn.expand("%:p:h")
				.. "&& gcc "
				.. vim.fn.expand("%:p")
				.. " -o "
				.. vim.fn.expand("%:p:r")
				.. " && "
				.. vim.fn.expand("%:p:r")
		end,
	},
	cpp = {
		name = "C++",
		filerunner = function()
			return "cd "
				.. vim.fn.expand("%:p:h")
				.. "&& g++ "
				.. vim.fn.expand("%:p")
				.. " -o "
				.. vim.fn.expand("%:p:r")
				.. " && "
				.. vim.fn.expand("%:p:r")
		end,
	},
}

return {
	condition = { filetype = vim.tbl_keys(builders) },
	generator = function(_, cb)
		local ft = builders[vim.bo.filetype]

		local ret = {
			{
				name = "Run " .. ft.name .. " file (" .. vim.fn.expand("%:t") .. ")",
				builder = function()
					return {
						cmd = ft.filerunner(),
						name = "Running " .. vim.fn.expand("%:t:r"),
						components = { "default", "unique" },
					}
				end,
				priority = 4,
			},
		}

		cb(ret)
	end,
}
