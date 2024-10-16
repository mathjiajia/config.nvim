local filerunners = {
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

	lua = {
		name = "Lua",
		repl = "lua",
		filerunner = function()
			return { "nvim", "-l", vim.fn.expand("%:p") }
		end,
	},
	markdown = {
		name = "Glow",
		filerunner = function()
			return { "glow", vim.fn.expand("%:p") }
		end,
	},
	python = {
		name = "Python",
		repl = "ipython",
		filerunner = function()
			return { "python", vim.fn.expand("%:p") }
		end,
	},
	r = {
		name = "R",
		repl = "R",
		filerunner = function()
			return { "Rscript", vim.fn.expand("%:p") }
		end,
	},
	swift = {
		name = "swift",
		repl = "swift",
		filerunner = function()
			return { "swift", vim.fn.expand("%:p") }
		end,
	},

	sh = {
		name = "Shell",
		repl = "sh",
		filerunner = function()
			return { "sh", vim.fn.expand("%:p") }
		end,
	},
	bash = {
		name = "Bash",
		repl = "bash",
		filerunner = function()
			return { "bash", vim.fn.expand("%:p") }
		end,
	},
	zsh = {
		name = "Zsh",
		repl = "zsh",
		filerunner = function()
			return { "zsh", vim.fn.expand("%:p") }
		end,
	},
	fish = {
		name = "Fish",
		repl = "fish",
		filerunner = function()
			return { "fish", vim.fn.expand("%:p") }
		end,
	},
}

return {
	condition = { filetype = vim.tbl_keys(filerunners) },
	generator = function(_, cb)
		local ft = filerunners[vim.bo.filetype]
		local ret = {}
		if ft.filerunner then
			table.insert(ret, {
				name = "Run " .. ft.name .. " file (" .. vim.fn.expand("%:t") .. ")",
				builder = function()
					return {
						cmd = ft.filerunner(),
						name = "Running " .. vim.fn.expand("%:t:r"),
						components = { "default", "unique" },
					}
				end,
				priority = 4,
			})
		end
		if ft.repl then
			table.insert(ret, {
				name = "Open " .. ft.name .. " REPL",
				builder = function()
					if ft.num then
						ft.num = ft.num + 1
					else
						ft.num = 1
					end
					return {
						cmd = ft.repl,
						name = ft.name .. " REPL " .. ft.num,
						components = {
							"default",
						},
					}
				end,
				priority = 5,
			})
		end
		cb(ret)
	end,
}
