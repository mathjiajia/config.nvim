return {

	-- session management
	{
		"glepnir/dbsession.nvim",
		config = true,
		cmd = { "SessionSave", "SessionDelete", "SessionLoad" },
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
