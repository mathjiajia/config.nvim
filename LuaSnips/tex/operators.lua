local snips, autosnips = {}, {}

local context = require('snips.context')

autosnips = {
	s(
		{ trig = '([hH])_(%d)(%u)', name = 'cohomology-d', regTrig = true, hidden = true },
		{
			f(function(_, snip)
				return snip.captures[1] .. '^{' .. snip.captures[2] .. '}(' .. snip.captures[3] .. ','
			end, {}),
			i(1),
			t(')'),
			i(0),
		},
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = '(%a)p(%d)', name = 'x[n+1]', regTrig = true, hidden = true },
		{
			f(function(_, snip)
				return snip.captures[1] .. '_{n+' .. snip.captures[2] .. '}'
			end, {})
		},
		{ condition = context.in_mathzone }
	),

	s(
		{ trig = 'cod', name = 'codimension', hidden = true },
		{ t('\\codim') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'dint', name = 'integral', dscr = 'Insert integral notation.', hidden = true },
		{ t('\\int_{'), i(1, '-\\infty'), t('}^{'), i(2, '\\infty'), t('} ') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'coker', name = 'cokernel', hidden = true },
		{ t('\\coker') },
		{ condition = context.in_mathzone }
	),

	-- s(
	-- 	{ trig = 'arcsin', name = 'arcsin', hidden = true },
	-- 	{ t('\\arcsin') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'arccos', name = 'arccos', hidden = true },
	-- 	{ t('\\arccos') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'arctan', name = 'arctan', hidden = true },
	-- 	{ t('\\arctan') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'arccot', name = 'arccot', hidden = true },
	-- 	{ t('\\arccot') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'arccsc', name = 'arccsc', hidden = true },
	-- 	{ t('\\arccsc') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'arcsec', name = 'arcsec', hidden = true },
	-- 	{ t('\\arcsec') },
	-- 	{ condition = context.in_mathzone }
	-- ),

	s(
		{ trig = 'int', name = 'int', hidden = true },
		{ t('\\int') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'sin', name = 'sin', hidden = true },
		{ t('\\sin') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'cos', name = 'cos', hidden = true },
		{ t('\\cos') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'tan', name = 'tan', hidden = true },
		{ t('\\tan') },
		{ condition = context.in_mathzone }
	),
	-- s(
	-- 	{ trig = 'cot', name = 'cot', hidden = true },
	-- 	{ t('\\cot') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'csc', name = 'csc', hidden = true },
	-- 	{ t('\\csc') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'sec', name = 'sec', hidden = true },
	-- 	{ t('\\sec') },
	-- 	{ condition = context.in_mathzone }
	-- ),

	s(
		{ trig = 'abs', name = 'abs', hidden = true },
		{ t('\\abs{'), i(1), t('}') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'deg', name = 'deg', hidden = true },
		{ t('\\deg') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'det', name = 'det', hidden = true },
		{ t('\\det') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'dim', name = 'dim', hidden = true },
		{ t('\\dim') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'hom', name = 'hom', hidden = true },
		{ t('\\hom') },
		{ condition = context.in_mathzone }
	),
	-- s(
	-- 	{ trig = 'inf', name = 'inf', hidden = true },
	-- 	{ t ('\\inf') },
	-- 	{ condition = context.in_mathzone }
	-- ),
	s(
		{ trig = 'max', name = 'max', hidden = true },
		{ t('\\max') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'min', name = 'min', hidden = true },
		{ t('\\min') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'ker', name = 'ker', hidden = true },
		{ t('\\ker') },
		{ condition = context.in_mathzone }
	),
	-- s(
	-- 	{ trig = 'sup', name = 'sup', hidden = true },
	-- 	{ t('\\sup') },
	-- 	{ condition = context.in_mathzone }
	-- ),

	s(
		{ trig = '(%w)//', name = 'fraction with a single numerator', regTrig = true, hidden = true },
		{
			t('\\frac{'),
			f(function(_, snip)
				return snip.captures[1]
			end, {}),
			t('}{'),
			i(1),
			t('}')
		},
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = '//', name = 'fraction', hidden = true },
		{ t('\\frac{'), i(1), t('}{'), i(2), t('}') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'bin', name = 'binomial coefficient', hidden = true },
		{ t('\\binom{'), i(1), t('}{'), i(2), t('}') },
		{ condition = context.in_mathzone }
	),

	s(
		{ trig = 'ses', name = 'short exact sequence', hidden = true },
		{
			c(1, { t('0'), t('1') }),
			t('\\longrightarrow '),
			i(2),
			t('\\longrightarrow '),
			i(3),
			t('\\longrightarrow '),
			i(4),
			t('\\longrightarrow '),
			rep(1),
			i(0),
		},
		{ condition = context.in_mathzone }),

	s(
		{ trig = '([hH])([i-npq])(%u)', name = 'cohomology-a', regTrig = true, hidden = true },
		{
			f(function(_, snip)
				return snip.captures[1] .. '^{' .. snip.captures[2] .. '}(' .. snip.captures[3] .. ','
			end, {}),
			i(1),
			t(')'),
			i(0),
		},
		{ condition = context.in_mathzone }),

	s(
		{ trig = 'rij', name = '(x_n) n ∈ N', hidden = true },
		{ t('('), i(1, 'x'), t('_'), i(2, 'n'), t(')_{'), rep(2), t('\\in '), i(3, '\\mathbb{N}'), t('}') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'rg', name = 'i = 1, ..., n', hidden = true },
		{ i(1, 'i'), t(' = '), i(2, '1'), t(' \\dots, '), i(0, 'n') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = 'ls', name = 'a_1, ..., a_n', hidden = true },
		{ i(1, 'a'), t('_{'), i(2, '1'), t('}, \\dots, '), rep(1), t('_{'), i(3, 'n'), t('}') },
		{ condition = context.in_mathzone }
	),
}

return snips, autosnips
