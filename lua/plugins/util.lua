return {

	-- code runner
	{
		"CRAG666/code_runner.nvim",
		opts = {
			filetype = {
				lua = "nvim -l",
				markdown = "glow",
				python = "python3 -u",
				swift = "swift",
			},
		},
		-- stylua: ignore
		keys = { { "<M-r>", function() require("code_runner.commands").run_filetype() end, desc = "Run file" } },
		cmd = { "RunCode", "RunFile", "RunProject" },
	},

	-- library used by other plugins
	{ "nvim-lua/plenary.nvim", lazy = true },
}
