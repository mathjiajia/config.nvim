return {
	{
		"stevearc/conform.nvim",
		dependencies = { "mason.nvim" },
		cmd = "ConformInfo",
		-- stylua: ignore
		keys = {
			{ "<leader>cF", function() require("conform").format({ formatters = { "injected" }, timeout_ms = 2000 }) end, mode = { "n", "v" }, desc = "Format Injected Langs" },
		},
		opts = {
			formatters_by_ft = {
				bib = { "bibtex-tidy" },
				c = { "clang-format" },
				css = { "prettierd" },
				html = { "prettierd" },
				javascript = { "prettierd" },
				json = { "prettierd" },
				jsonc = { "prettierd" },
				markdown = { "prettierd" },
				["markdown.mdx"] = { "prettierd" },
				yaml = { "prettierd" },
				fish = { "fish_indent" },
				lua = { "stylua" },
				python = { "black" },
				sh = { "shfmt" },
				swift = { "swift_format" },
				tex = { "latexindent" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
}
