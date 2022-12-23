return {
	{
		'dstein64/vim-startuptime',
		config = function()
			vim.g.startuptime_tries = 10
		end,
		cmd = 'StartupTime',
	}
}
