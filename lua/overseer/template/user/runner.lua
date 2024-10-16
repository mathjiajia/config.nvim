local filerunners = {
	sh = { name = "Shell", cmd = "sh", repl = "sh" },
	bash = { name = "Bash", cmd = "bash", repl = "bash" },
	zsh = { name = "Zsh", cmd = "zsh", repl = "zsh" },
	fish = { name = "Fish", cmd = "fish", repl = "fish" },
	python = { name = "Python", cmd = "python", repl = "ipython" },
	r = { name = "R", cmd = "Rscript", repl = "R" },
	lua = { name = "Lua", cmd = { "nvim", "-l" }, repl = "lua" },
	swift = { name = "Swift", cmd = "swift", repl = { "swift", "repl" } },
}

return {
	condition = { filetype = vim.tbl_keys(filerunners) },
	generator = function(_, cb)
		local ft = filerunners[vim.bo.filetype]
		local file = vim.fn.expand("%:p")
		local ret = {}

		table.insert(ret, {
			name = "RunFile",
			builder = function()
				return {
					cmd = ft.cmd,
					args = { file },
					name = "Running " .. vim.fn.expand("%:t:r"),
					components = { "default", "unique" },
				}
			end,
			priority = 4,
		})

		table.insert(ret, {
			name = "OpenREPL",
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

		cb(ret)
	end,
}
