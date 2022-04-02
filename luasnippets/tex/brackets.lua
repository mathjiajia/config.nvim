local snips, autosnips = {}, {}

local tex = require('utils.latex')

snips = {
	s(
		{ trig = 'lr', name = 'left( right)' },
		{ t { '\\left( ' }, i(1), t { '\\right)' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr(', name = 'left( right)' },
		{ t { '\\left( ' }, i(1), t { '\\right)' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr|', name = 'leftvert rightvert' },
		{ t { '\\left\\lvert ' }, i(1), t { '\\right\\lvert' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr{', name = 'left\\{ right\\}' },
		{ t { '\\left\\{ ' }, i(1), t { '\\right\\}' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lrb', name = 'left\\{ right\\}' },
		{ t { '\\left\\{ ' }, i(1), t { '\\right\\}' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr[', name = 'left[ right]' },
		{ t { '\\left[ ' }, i(1), t { '\\right]' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
}

autosnips = {
	s(
		{ trig = 'bpm', name = 'pmatrix Environment' },
		{ t { '\\begin{pmatrix}', '\t' }, i(1), t { '', '\\end{pmatrix}' } },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'bbm', name = 'bmatrix Environment' },
		{ t { '\\begin{bmatrix}', '\t' }, i(1), t { '', '\\end{bmatrix}' } },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'cvec', name = 'column vector' }, {
		t { '\\begin{pmatrix}', '\t' },
		i(1, 'x'),
		t('}_'),
		i(2, '1'),
		t { '\\\\', '\\vdots \\\\', '' },
		rep(1),
		t('_'),
		i(3, 'n'),
		t { '', '\\end{pmatrix}' },
		i(0),
	}, { condition = tex.in_mathzone }),
	s(
		{ trig = 'lra', name = 'leftangle rightangle' },
		{ t { '\\left\\langle ' }, i(1), t { '\\right\\rangle' } },
		{ condition = tex.in_mathzone }
	),
}

return snips, autosnips
