require('spectre').setup {
	color_devicons = true,
	open_cmd = 'vnew',
	live_update = false, -- auto excute search again when you write any file in vim
	line_sep_start = '┌-----------------------------------------',
	result_padding = '¦  ',
	line_sep = '└-----------------------------------------',
	highlight = {
		ui = 'String',
		search = 'DiffChange',
		replace = 'DiffDelete',
	},
	replace_vim_cmd = 'cdo',
	is_open_target_win = true, --open file on opener window
	is_insert_mode = false, -- start open panel on is_insert_mode
}
