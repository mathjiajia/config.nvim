return {
	{
		"mfussenegger/nvim-lint",
		ft = { "bash", "fish", "markdown", "zsh" },
		config = function()
			local lint = require("lint")
			local markdownlint = lint.linters.markdownlint
			markdownlint.args = {
				"--config",
				"~/.config/markdownlint/markdownlint.yaml",
				"--stdin",
			}

			lint.linters_by_ft = {
				bash = { "shellcheck" },
				fish = { "fish" },
				markdown = { "markdownlint" },
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
