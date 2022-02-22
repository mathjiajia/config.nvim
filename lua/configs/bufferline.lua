local bufferline = require('bufferline')

bufferline.setup {
	options = {
		numbers = 'none',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		close_command = 'bdelete! %d',
		left_mouse_command = 'buffer %d',
		right_mouse_command = 'bdelete! %d',
		middle_mouse_command = nil,
		indicator_icon = '▎',
		left_trunc_marker = '',
		right_trunc_marker = '',
		separator_style = 'thin',
		name_formatter = nil,
		tab_size = 18,
		max_name_length = 18,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		persist_buffer_sort = true,
		max_prefix_length = 15,
		sort_by = 'id',
		diagnostics = false,
		diagnostics_indicator = nil,
		diagnostics_update_in_insert = true,
		offsets = {
			{ filetype = 'NvimTree', text = 'File Explorer', highlight = 'Directory', text_align = 'center' },
			{ filetype = 'aerial', text = 'OUTLINE', highlight = 'Directory', text_align = 'center' },
			{ filetype = 'tsplayground', text = 'Playground', highlight = 'Directory', text_align = 'center' },
		},
		groups = {
			items = nil,
			options = {
				toggle_hidden_on_enter = true,
			},
		},
		debug = {
			logging = false,
		},
	},
}

-- buffer navigation
vim.keymap.set('n', '<leader>bp', '<Cmd>bprev<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>bn', '<Cmd>bnext<CR>', { desc = 'Next Buffer' })

-- close
vim.keymap.set('n', '<leader>bh', function()
	bufferline.close_in_direction('left')
end, { desc = 'Close Left Buffers' })
vim.keymap.set('n', '<leader>bl', function()
	bufferline.close_in_direction('right')
end, { desc = 'Close Right Buffers' })
-- jump
for i = 1, 9 do
	vim.keymap.set('n', string.format('<M-%s>', i), function()
		bufferline.go_to_buffer(i)
	end, { desc = string.format('Buffer %s', i) })
end
-- pick
vim.keymap.set('n', '<leader>bs', function()
	bufferline.pick_buffer()
end, { desc = 'Pick a buffer' })
-- sort
vim.keymap.set('n', '<leader>bd', function()
	bufferline.sort_buffers_by('directory')
end, { desc = 'Sort Buffers by Directory' })
vim.keymap.set('n', '<leader>be', function()
	bufferline.sort_buffers_by('extension')
end, { desc = 'Sort Buffers by Extension' })

local cp = require('colors')

vim.api.nvim_set_hl(0, 'BufferLineFill', { bg = cp.black0 })
vim.api.nvim_set_hl(0, 'BufferLineBackground', { fg = cp.white, bg = inactive_bg })
vim.api.nvim_set_hl(0, 'BufferLineBufferVisible', { fg = cp.black4, bg = inactive_bg })
vim.api.nvim_set_hl(0, 'BufferLineBufferSelected', { fg = cp.white, bg = cp.black2, bold = true, italic = true })
vim.api.nvim_set_hl(0, 'BufferLineTab', { fg = cp.black4, bg = cp.black2 })
vim.api.nvim_set_hl(0, 'BufferLineTabSelected', { fg = cp.red, bg = cp.blue })
vim.api.nvim_set_hl(0, 'BufferLineTabClose', { fg = cp.red, bg = inactive_bg })
vim.api.nvim_set_hl(0, 'BufferLineIndicatorSelected', { fg = cp.peach, bg = cp.black2 })
-- separators
vim.api.nvim_set_hl(0, 'BufferLineSeparator', { fg = inactive_bg, bg = inactive_bg })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorVisible', { fg = inactive_bg, bg = inactive_bg })
vim.api.nvim_set_hl(0, 'BufferLineSeparatorSelected', { fg = inactive_bg, bg = inactive_bg })
-- close buttons
vim.api.nvim_set_hl(0, 'BufferLineCloseButton', { fg = cp.black4, bg = inactive_bg })
vim.api.nvim_set_hl(0, 'BufferLineCloseButtonVisible', { fg = cp.black4, bg = inactive_bg })
vim.api.nvim_set_hl(0, 'BufferLineCloseButtonSelected', { fg = cp.red, bg = cp.black2 })
