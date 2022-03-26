local M = {}

local Input = require('nui.input')
local Text = require('nui.text')

local function editor_popup_opts(top)
	return {
		position = '50%',
		size = { width = 25 },
		border = {
			style = 'single',
			text = { top = Text(top, 'Special'), top_align = 'left' },
		},
		win_options = { winhighlight = 'Normal:Normal,FloatBorder:DiagnosticInfo' },
	}
end

local function cursor_popup_opts(top)
	return {
		position = { row = 1, col = 0 },
		size = { width = 25 },
		relative = 'cursor',
		border = {
			style = 'single',
			text = { top = Text(top, 'Special'), top_align = 'left' },
		},
		win_options = { winhighlight = 'Normal:Normal,FloatBorder:DiagnosticInfo' },
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
	})
end

local certain_type_opts = {
	prompt = Text('➤ ', 'DiagnosticHint'),
	on_submit = function(value)
		require('telescope.builtin').find_files(
			require('telescope.themes').get_ivy { find_command = { 'rg', '--files', '--type', value } }
		)
	end,
}

local grep_string_opts = {
	prompt = Text('➤ ', 'DiagnosticHint'),
	on_submit = function(value)
		require('telescope.builtin').grep_string { path_display = { 'shorten' }, search = value }
	end,
}

function M.certain_type()
	popup_input(editor_popup_opts('Type'), certain_type_opts)
end

function M.grep_string()
	popup_input(editor_popup_opts('Grep String'), grep_string_opts)
end

function M.lsp_rename()
	local function on_confirm(input)
		if not (input and #input > 0) then
			return
		end
		local params = vim.lsp.util.make_position_params()
		params.newName = input
		vim.lsp.buf_request(0, 'textDocument/rename', params)
	end

	local popup_opts = cursor_popup_opts('New Name')

	local opts = {
		prompt = '➤ ',
		default_value = vim.fn.expand('<cword>'),
		on_submit = on_confirm,
	}

	local function prepare_rename(err, result)
		if err == nil and result == nil then
			vim.notify('nothing to rename', 'info', { title = 'LSP Rename' })
			return
		end
		if result and result.placeholder then
			opts.default_value = result.placeholder
			popup_input(popup_opts, opts)
		elseif result and result.start and result['end'] and result.start.line == result['end'].line then
			local line = vim.fn.getline(result.start.line + 1)
			local start_char = result.start.character + 1
			local end_char = result['end'].character
			opts.default_value = string.sub(line, start_char, end_char)
			popup_input(popup_opts, opts)
		else
			opts.default_value = vim.fn.expand('<cword>')
			popup_input(popup_opts, opts)
		end
	end
	vim.lsp.buf_request(0, 'textDocument/prepareRename', vim.lsp.util.make_position_params(), prepare_rename)
end

return M
