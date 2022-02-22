require('surround').setup {
	context_offset = 100,
	space_on_alias = false,
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
}
