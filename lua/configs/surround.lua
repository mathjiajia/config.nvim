require('surround').setup {
	context_offset = 100,
	load_autogroups = false,
	mappings_style = 'sandwich',
	map_insert_mode = false,
	quotes = { "'", '"' },
	brackets = { '(', '{', '[' },
	space_on_closing_char = false,
	pairs = {
		nestable = {
			b = { '(', ')' },
			s = { '[', ']' },
			B = { '{', '}' },
			a = { '<', '>' },
		},
		linear = {
			q = { "'", "'" },
			t = { '`', '`' },
			d = { '"', '"' },
		},
	},
	prefix = 's',
}
