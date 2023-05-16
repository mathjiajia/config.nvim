return {

	-- session management
	{
		"glepnir/dbsession.nvim",
		config = true,
		cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
	},

	-- ccode runner
	{
		"CRAG666/code_runner.nvim",
		opts = {
			filetype = {
				lua = "lua",
				markdown = "glow",
				python = "python3 -u",
				swift = "swift",
			},
		},
		cmd = { "RunCode", "RunFile", "RunProject" },
	},

	-- chatGPT
	{
		"jackMort/ChatGPT.nvim",
		config = true,
		cmd = { "ChatGPT", "ChatGPTActAs", "ChatGPTEditWithInstructions", "ChatGPTRun" },
	},

	-- library used by other plugins
	"nvim-lua/plenary.nvim",
	"kkharji/sqlite.lua",
}
