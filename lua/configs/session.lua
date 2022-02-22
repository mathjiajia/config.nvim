local Path = require('plenary.path')

require('session_manager').setup {
	sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
	path_replacer = '__', -- The character to which the path separator will be replaced for session files.
	colon_replacer = '++', -- The character to which the colon symbol will be replaced for session files.
	autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
	-- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
	autosave_last_session = true, -- Automatically save last session on exit and on session switch.
	autosave_ignore_not_normal = true,
	-- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
	autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
		'gitcommit',
	},
	autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
}

-- session
vim.keymap.set('n', '<leader>sd', function()
	require('session_manager.commands').run_command('delete_session')
end, { desc = 'Select and Delete a Session' })
vim.keymap.set('n', '<leader>sl', function()
	require('session_manager.commands').run_command('load_last_session')
end, { desc = 'Restore last session' })
vim.keymap.set('n', '<leader>sr', function()
	require('session_manager.commands').run_command('load_session')
end, { desc = 'Select and load session' })
vim.keymap.set('n', '<leader>ss', function()
	require('session_manager.commands').run_command('save_current_session')
	vim.notify('Current Session Saved', 'info', { title = 'Session Manager' })
end, { desc = 'Save current session' })
