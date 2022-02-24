require('surround').setup {
	pairs = {
		nestable = { b = { '(', ')' }, s = { '[', ']' }, B = { '{', '}' }, a = { '<', '>' } },
		linear = { q = { "'", "'" }, t = { '`', '`' }, d = { '"', '"' } },
	},
	mappings_style = 'sandwich',
	load_keymaps = true,
	map_insert_mode = false,
}
