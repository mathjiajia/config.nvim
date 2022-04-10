require('session_manager').setup {
	autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
	autosave_last_session = false,
}

local sc = require('session_manager.commands').run_command

vim.keymap.set('n', '<leader>sd', function()
	sc 'delete_session'
end, { desc = 'Select and delete session' })
vim.keymap.set('n', '<leader>sl', function()
	sc 'load_last_session'
end, { desc = 'Restore last session' })
vim.keymap.set('n', '<leader>sr', function()
	sc 'load_session'
end, { desc = 'Select and load session' })
vim.keymap.set('n', '<leader>ss', function()
	sc 'save_current_session'
	vim.notify('Current Session Saved', 'info', { title = 'Session Manager' })
end, { desc = 'Save current session' })
