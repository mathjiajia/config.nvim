local npairs = require('nvim-autopairs')

npairs.setup {
	map_bs = true,
	map_c_h = false,
	map_c_w = false,
	map_cr = true,
	disable_filetype = { 'TelescopePrompt', 'spectre_panel' },
	disable_in_macro = false, -- disable when recording or executing a macro
	disable_in_visualblock = false, -- disable when insert after visual block mode
	ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], '%s+', ''),
	check_ts = false,
	enable_moveright = true,
	enable_afterquote = true, -- add bracket pairs after quote
	enable_check_bracket_line = true, --- check bracket in same line
	ts_config = {
		lua = { 'string', 'source' },
		javascript = { 'string', 'template_string' },
	},
}

npairs.get_rule('"')[1]:with_pair(function()
	if vim.bo.filetype == 'tex' then
		return false
	end
end)

npairs.get_rule("'")[1]:with_pair(function()
	if vim.bo.filetype == 'tex' then
		return false
	end
end)
