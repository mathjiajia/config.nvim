local M = {}

local Input = require('nui.input')
local Text = require('nui.text')

local curr_wd = vim.fn.expand('<cword>')

local function popup_opts(top)
	return {
		-- position = '50%',
		-- size = { width = 30 },
		-- relative = 'editor',
		position = { row = 1, col = 0 },
		size = { width = 30, height = 2 },
		relative = 'cursor',
		border = {
			style = 'rounded',
			text = { top = Text(top, 'Special'), top_align = 'left' },
		},
		win_options = {
			winblend = 10,
			winhighlight = 'Normal:Normal,FloatBorder:DiagnosticInfo',
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

local lsp_rename_opts = {
	prompt = Text('> ', 'Error'),
	default_value = curr_wd,
	on_submit = function(new_name)
		if #new_name == 0 or new_name == curr_wd then
			return
		end
		local params = vim.lsp.util.make_position_params()
		params.newName = new_name
		vim.lsp.buf_request(0, 'textDocument/rename', params)
	end,
}

function M.certain_type()
	popup_input(popup_opts('File Type'), certain_type_opts)
end

function M.grep_string()
	popup_input(popup_opts('Grep String'), grep_string_opts)
end

function M.lsp_rename()
	popup_input(popup_opts('Rename'), lsp_rename_opts)
end

-- local function vim_input()
-- 	vim.ui.input({
-- 		prompt = 'prompt',
-- 	}, function(value)
-- 		return value
-- 	end)
-- end

return M
