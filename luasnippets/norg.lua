local snips, autosnips = {}, {}

snips = {
	s(
		{ trig = '*([2-6])', name = 'Heading', dscr = 'Add Heading', regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.rep('*', tonumber(snip.captures[1])) .. ' '
		end, {}) },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'q([2-6])', name = 'Quote', dscr = 'Add Quote', regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.rep('>', tonumber(snip.captures[1])) .. ' '
		end, {}) },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = '-([2-6])', name = 'Unordered lists', dscr = 'Add Unordered lists', regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.rep('-', tonumber(snip.captures[1])) .. ' '
		end, {}) },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = '~([2-6])', name = 'Ordered lists', dscr = 'Add Ordered lists', regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.rep('~', tonumber(snip.captures[1])) .. ' '
		end, {}) },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'link', name = 'Neorg Links', dscr = 'Insert a Link' },
		{ t '{', i(1, 'url'), t '}[', i(2, 'title'), t ']' }
	),
	s(
		{ trig = 'code', name = 'code block' },
		{ t '@code ', i(1, 'lang'), t { '', '\t' }, i(0), t { '', '@end' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'date', name = 'date block' },
		{ t { '@date', '\t' }, i(0), t { '', '@end' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'table', name = 'table block' },
		{ t { '@table', '\t' }, i(0), t { '', '@end' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'image', name = 'image block' },
		{ t { '@image png svg jpeg jfif exif', '\t' }, i(0), t { '', '@end' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'embed', name = 'embed block' },
		{ t { '@embed', '\t' }, i(0), t { '', '@end' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'math', name = 'math block' },
		{ t { '@math', '\t' }, i(0), t { '', '@end' } },
		{ condition = conds.line_begin }
	),
}

autosnips = {
	s({ trig = ',b', name = 'bold' }, { t '*', i(1), t '*' }),
	s({ trig = ',i', name = 'italic' }, { t '/', i(1), t '/' }),
	s({ trig = ',u', name = 'underline' }, { t '_', i(1), t '_' }),
	s({ trig = ',s', name = 'strikethrough' }, { t '-', i(1), t '-' }),
	s({ trig = ',|', name = 'spoiler' }, { t '|', i(1), t '|' }),
	s({ trig = ',c', name = 'inline code' }, { t '`', i(1), t '`' }),
	s({ trig = ',^', name = 'subscript' }, { t '^', i(1), t '^' }),
	s({ trig = ',_', name = 'subscript' }, { t ',', i(1), t ',' }),
	s({ trig = 'mk', name = 'inline math' }, { t '$', i(1), t '$' }),
	s({ trig = ',v', name = 'variable' }, { t '=', i(1), t '=' }),
	s({ trig = ',+', name = 'comment' }, { t '+', i(1), t '+' }),
}

return snips, autosnips
