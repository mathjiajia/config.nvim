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
			{
				filetype = 'NvimTree',
				text = 'File Explorer',
				highlight = 'Directory',
				text_align = 'center',
			},
			{
				filetype = 'aerial',
				text = 'OUTLINE',
				highlight = 'Directory',
				text_align = 'center',
			},
			{
				filetype = 'tsplayground',
				text = 'TS Playground',
				highlight = 'Directory',
				text_align = 'center',
			},
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

local map = function(key, fun, opts)
	opts = opts or {}
	opts.silent = true
	vim.keymap.set('n', key, fun, opts)
end

-- buffer navigation
map('<leader>bp', '<Cmd>bprev<CR>', { desc = 'Previous Buffer' })
map('<leader>bn', '<Cmd>bnext<CR>', { desc = 'Next Buffer' })
-- close
map('<leader>bh', function()
	bufferline.close_in_direction('left')
end, { desc = 'Close Left Buffers' })
map('<leader>bl', function()
	bufferline.close_in_direction('right')
end, { desc = 'Close Right Buffers' })

-- jump
map('<M-1>', function()
	bufferline.go_to_buffer(1)
end, { desc = 'Buffer 1' })
map('<M-2>', function()
	bufferline.go_to_buffer(2)
end, { desc = 'Buffer 2' })
map('<M-3>', function()
	bufferline.go_to_buffer(3)
end, { desc = 'Buffer 3' })
map('<M-4>', function()
	bufferline.go_to_buffer(4)
end, { desc = 'Buffer 4' })
map('<M-5>', function()
	bufferline.go_to_buffer(5)
end, { desc = 'Buffer 5' })
map('<M-6>', function()
	bufferline.go_to_buffer(6)
end, { desc = 'Buffer 6' })
map('<M-7>', function()
	bufferline.go_to_buffer(7)
end, { desc = 'Buffer 7' })
map('<M-8>', function()
	bufferline.go_to_buffer(8)
end, { desc = 'Buffer 8' })
map('<M-9>', function()
	bufferline.go_to_buffer(9)
end, { desc = 'Buffer 9' })

-- pick
map('<leader>bs', function()
	bufferline.pick_buffer()
end, { desc = 'Pick a buffer' })

-- sort
map('<leader>bd', function()
	bufferline.sort_buffers_by('directory')
end, { desc = 'Sort Buffers by Directory' })
map('<leader>be', function()
	bufferline.sort_buffers_by('extension')
end, { desc = 'Sort Buffers by Extension' })
