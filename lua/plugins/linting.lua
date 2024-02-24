return {
	{
		"mfussenegger/nvim-lint",
		ft = { "bash", "fish", "gitcommit", "markdown", "zsh" },
		config = function()
			local lint = require("lint")
			lint.linters.markdownlint_cli2 = {
				name = "markdownlint-cli2",
				cmd = "markdownlint-cli2",
				stream = "stderr",
				ignore_exitcode = true,
				parser = require("lint.parser").from_errorformat("%f:%l:%c %m,%f:%l %m", {
					source = "markdownlint-cli2",
					severity = vim.diagnostic.severity.WARN,
				}),
			}

			lint.linters_by_ft = {
				bash = { "shellcheck" },
				fish = { "fish" },
				gitcommit = { "commitlint" },
				markdown = { "markdownlint_cli2" },
				zsh = { "shellcheck" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
