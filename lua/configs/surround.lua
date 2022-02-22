require('surround').setup {
	prefix = 's',
	pairs = {
		nestable = { b = { '(', ')' }, s = { '[', ']' }, B = { '{', '}' }, a = { '<', '>' } },
		linear = { q = { "'", "'" }, t = { '`', '`' }, d = { '"', '"' } },
	},
	context_offset = 100,
	prompt = true,
	load_autogroups = false,
	mappings_style = 'sandwich',
	load_keymaps = true,
	quotes = { "'", '"' },
	brackets = { '(', '{', '[' },
	map_insert_mode = false,
	space_on_closing_char = false,
	space_on_alias = false,
}
