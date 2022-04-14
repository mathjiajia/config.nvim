local snips, autosnips = {}, {}

local tex = require 'utils.latex'

autosnips = {
	s({ trig = '([hH])_(%d)(%u)', name = 'cohomology-d', regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1] .. '^{' .. snip.captures[2] .. '}(' .. snip.captures[3] .. ','
		end, {}),
		i(1),
		t ')',
		i(0),
	}, { condition = tex.in_mathzone }),
	s(
		{ trig = '(%a)p(%d)', name = 'x[n+1]', regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. '_{n+' .. snip.captures[2] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s({ trig = 'cod', name = 'codimension' }, { t '\\codim' }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'dint', name = 'integral', dscr = 'Insert integral notation.' },
		{ t '\\int_{', i(1, '-\\infty'), t '}^{', i(2, '\\infty'), t '} ' },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'coker', name = 'cokernel' }, { t '\\coker' }, { condition = tex.in_mathzone }),

	-- s({ trig = 'arcsin', name = 'arcsin' }, { t('\\arcsin') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arccos', name = 'arccos' }, { t('\\arccos') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arctan', name = 'arctan' }, { t('\\arctan') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arccot', name = 'arccot' }, { t('\\arccot') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arccsc', name = 'arccsc' }, { t('\\arccsc') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arcsec', name = 'arcsec' }, { t('\\arcsec') }, { condition = tex.in_mathzone }),

	s({ trig = 'int', name = 'int' }, { t '\\int' }, { condition = tex.in_mathzone }),
	s({ trig = 'sin', name = 'sin' }, { t '\\sin' }, { condition = tex.in_mathzone }),
	s({ trig = 'cos', name = 'cos' }, { t '\\cos' }, { condition = tex.in_mathzone }),
	s({ trig = 'tan', name = 'tan' }, { t '\\tan' }, { condition = tex.in_mathzone }),
	-- s({ trig = 'cot', name = 'cot' }, { t('\\cot') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'csc', name = 'csc' }, { t('\\csc') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'sec', name = 'sec' }, { t('\\sec') }, { condition = tex.in_mathzone }),

	s({ trig = 'abs', name = 'abs' }, { t '\\abs{', i(1), t '}' }, { condition = tex.in_mathzone }),
	s({ trig = 'deg', name = 'deg' }, { t '\\deg' }, { condition = tex.in_mathzone }),
	s({ trig = 'det', name = 'det' }, { t '\\det' }, { condition = tex.in_mathzone }),
	s({ trig = 'dim', name = 'dim' }, { t '\\dim' }, { condition = tex.in_mathzone }),
	s({ trig = 'hom', name = 'hom' }, { t '\\hom' }, { condition = tex.in_mathzone }),
	-- s({ trig = 'inf', name = 'inf' }, { t '\\inf' }, { condition = tex.in_mathzone }),
	s({ trig = 'max', name = 'max' }, { t '\\max' }, { condition = tex.in_mathzone }),
	s({ trig = 'min', name = 'min' }, { t '\\min' }, { condition = tex.in_mathzone }),
	s({ trig = 'ker', name = 'ker' }, { t '\\ker' }, { condition = tex.in_mathzone }),
	-- s({ trig = 'sup', name = 'sup' }, { t '\\sup' }, { condition = tex.in_mathzone }),

	s(
		{ trig = '(%w)//', name = 'fraction with a single numerator', regTrig = true },
		{ t '\\frac{', f(function(_, snip)
			return snip.captures[1]
		end, {}), t '}{', i(1), t '}' },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '//', name = 'fraction' },
		{ t '\\frac{', i(1), t '}{', i(2), t '}' },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'bin', name = 'binomial coefficient' },
		{ t '\\binom{', i(1), t '}{', i(2), t '}' },
		{ condition = tex.in_mathzone }
	),

	s({ trig = 'ses', name = 'short exact sequence' }, {
		c(1, { t '0', t '1' }),
		t '\\longrightarrow ',
		i(2),
		t '\\longrightarrow ',
		i(3),
		t '\\longrightarrow ',
		i(4),
		t '\\longrightarrow ',
		rep(1),
		i(0),
	}, { condition = tex.in_mathzone }),

	s({ trig = '([hH])([i-npq])(%u)', name = 'cohomology-a', regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1] .. '^{' .. snip.captures[2] .. '}(' .. snip.captures[3] .. ','
		end, {}),
		i(1),
		t ')',
		i(0),
	}, { condition = tex.in_mathzone }),

	s(
		{ trig = 'rij', name = '(x_n) n ∈ N' },
		{ t '(', i(1, 'x'), t '_', i(2, 'n'), t ')_{', rep(2), t '\\in ', i(3, '\\mathbb{N}'), t '}' },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'rg', name = 'i = 1, ..., n' },
		{ i(1, 'i'), t ' = ', i(2, '1'), t ' \\dots, ', i(0, 'n') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'ls', name = 'a_1, ..., a_n' },
		{ i(1, 'a'), t '_{', i(2, '1'), t '}, \\dots, ', rep(1), t '_{', i(3, 'n'), t '}' },
		{ condition = tex.in_mathzone }
	),
}

return snips, autosnips
