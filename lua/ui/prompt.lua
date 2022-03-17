local M = {}

local Input = require('nui.input')
local Text = require('nui.text')

local function popup_opts(top)
	return {
		position = '50%',
		size = { width = 30 },
		relative = 'editor',
		-- position = { row = 1, col = 0 },
		-- size = { width = 30, height = 2 },
		-- relative = 'cursor',
		border = {
			style = 'rounded',
			text = { top = Text(top, 'Special'), top_align = 'left' },
		},
		win_options = {
			winblend = 10,
			winhighlight = 'FloatBorder:DiagnosticInfo',
		},
	}
end

local function popup_input(pop_opts, opts)
	local input = Input(pop_opts, opts)
	input:mount()

	input:map('i', '<ESC>', function()
		input:unmount()
	end, { noremap = true })

	vim.api.nvim_create_autocmd('BufLeave', {
		callback = function()
			input:unmount()
		end,
		buffer = 0,
		once = true,
		desc = 'Document Highlight',
	})
end

local certain_type_opts = {
	prompt = Text('> ', 'DiagnosticHint'),
	on_submit = function(value)
		require('telescope.builtin').find_files(
			require('telescope.themes').get_ivy { find_command = { 'rg', '--files', '--type', value } }
		)
	end,
}

local grep_string_opts = {
	prompt = Text('> ', 'DiagnosticHint'),
	on_submit = function(value)
		require('telescope.builtin').grep_string { path_display = { 'shorten' }, search = value }
	end,
}

function M.certain_type()
	popup_input(popup_opts('File Type'), certain_type_opts)
end

function M.grep_string()
	popup_input(popup_opts('Grep String'), grep_string_opts)
end

-- local function vim_input()
-- 	vim.ui.input({
-- 		prompt = 'prompt',
-- 	}, function(value)
-- 		return value
-- 	end)
-- end

return M
