local snips, autosnips = {}, {}

local tex = require('utils.latex')

snips = {
	s(
		{ trig = 'c(%u)', name = 'mathcal', wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return '\\mathcal{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'f(%a)', name = 'mathfrak', wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return '\\mathfrak{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 's(%u)', name = 'mathscr', wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return '\\mathscr{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = '/', name = 'fraction', dscr = 'Insert a fraction notation.', wordTrig = false },
		{ t('\\frac{'), i(1), t('}{'), i(2), t('}') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = 'sum', name = 'sum', dscr = 'Insert a sum notation.' },
		{ t('\\sum_{'), i(1), t('}^{'), i(2), t('}'), i(3) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lim', name = 'limit', dscr = 'Insert a limit notation.' },
		{ t('\\lim_{'), i(1, 'n'), t('\\to '), i(2, '\\infty'), t('} ') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'limsup', name = 'limsup', dscr = 'Insert a limit superior notation.' },
		{ t('\\limsup_{'), i(1, 'n'), t('\\to '), i(2, '\\infty'), t('} ') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'prod', name = 'product', dscr = 'Insert a product notation.' },
		{ t('\\prod_{'), i(1, 'n'), t('='), i(2, '1'), t('}^{'), i(3, '\\infty'), t('}'), i(4), t(' ') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
}

autosnips = {
	s({ trig = '\\varpii', name = '\\varpi_i' }, { t('\\varpi_{i}') }, { condition = tex.in_mathzone }),
	s({ trig = '\\varphii', name = '\\varphi_i' }, { t('\\varphi_{i}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '\\([xX])ii', name = '\\xi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%si_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([pP])ii', name = '\\pi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%si_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([pP])hii', name = '\\phi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%shi_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([cC])hii', name = '\\chi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%shi_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([pP])sii', name = '\\psi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%ssi_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s({ trig = 'O([A-NP-Za-z])', name = 'local ring, structure sheaf', wordTrig = false, regTrig = true }, {
		f(function(_, snip)
			return '\\mathcal{O}_{' .. snip.captures[1] .. '}'
		end, {}),
	}, { condition = tex.in_mathzone }),

	s({
		trig = '([%a])(%d)',
		name = 'auto subscript 1',
		dscr = 'Subscript with a single number.',
		wordTrig = false,
		regTrig = true,
	}, {
		f(function(_, snip)
			return string.format('%s_%s', snip.captures[1], snip.captures[2])
		end, {}),
	}, { condition = tex.in_mathzone }),
	s({ trig = '(%a)_(%d%d)', name = 'auto subscript 2', dscr = 'Subscript with two numbers.', regTrig = true }, {
		f(function(_, snip)
			return string.format('%s_{%s}', snip.captures[1], snip.captures[2])
		end, {}),
	}, { condition = tex.in_mathzone }),

	s({ trig = 'inn', name = 'belongs to ∈', wordTrig = false }, { t('\\in ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '!in', name = 'does not belong to ∉', wordTrig = false },
		{ t('\\notin ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '!=', name = 'not equal ≠', wordTrig = false }, { t('\\neq ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '<=', name = 'less than or equal to ≤', wordTrig = false },
		{ t('\\leq ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '>=', name = 'greater than or equal to ≥', wordTrig = false },
		{ t('\\geq ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '<<', name = 'much less than ≪', wordTrig = false }, { t('\\ll ') }, {
		condition = tex.in_mathzone,
	}),
	s(
		{ trig = '>>', name = 'much greater than ≫', wordTrig = false },
		{ t('\\gg ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '~~', name = 'similar ~', wordTrig = false }, { t('\\sim ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '~=', name = 'is isomorphic to ≃', wordTrig = false },
		{ t('\\simeq ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'nvs', name = 'inverse', wordTrig = false }, { t('^{-1}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '^-', name = 'negative exponents', wordTrig = false },
		{ t('^{-'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'sq', name = 'square root' }, { t('\\sqrt{'), i(1), t('}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '__', name = 'subscript', wordTrig = false },
		{ t('_{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '^^', name = 'supscript', wordTrig = false },
		{ t('^{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '**', name = 'upper star *', wordTrig = false }, { t('^{*}') }, { condition = tex.in_mathzone }),
	s({ trig = '...', name = 'dots ...', wordTrig = false }, { t('\\dots') }, { condition = tex.in_mathzone }),
	s({ trig = '||', name = 'mid |', wordTrig = false }, { t('\\mid ') }, { condition = tex.in_mathzone }),
	s({ trig = '::', name = 'colon :', wordTrig = false }, { t('\\colon ') }, { condition = tex.in_mathzone }),
	s({ trig = ':=', name = 'coloneqq :=', wordTrig = false }, { t('\\coloneqq ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'rup', name = 'round up', wordTrig = false },
		{ t('\\rup{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'rwn', name = 'round down', wordTrig = false },
		{ t('\\rdown{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),

	s({ trig = 'lll', wordTrig = false, name = 'ell ℓ' }, { t('\\ell') }, { condition = tex.in_mathzone }),
	s({ trig = 'xx', wordTrig = false, name = 'times ×' }, { t('\\times') }, { condition = tex.in_mathzone }),
	s({ trig = 'nabl', wordTrig = false, name = 'nabla ∇' }, { t('\\nabla') }, { condition = tex.in_mathzone }),
	s({ trig = 'AA', wordTrig = false, name = 'affine 𝔸' }, { t('\\mathbb{A}') }, { condition = tex.in_mathzone }),
	s({ trig = 'CC', wordTrig = false, name = 'complex ℂ' }, { t('\\mathbb{C}') }, { condition = tex.in_mathzone }),
	s({ trig = 'DD', wordTrig = false, name = 'disc 𝔻' }, { t('\\mathbb{D}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'FF', wordTrig = false, name = 'Hirzebruch 𝔽' },
		{ t('\\mathbb{F}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'HH', wordTrig = false, name = 'half plane ℍ' },
		{ t('\\mathbb{H}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'NN', wordTrig = false, name = 'natural ℕ' }, { t('\\mathbb{N}') }, { condition = tex.in_mathzone }),
	s({ trig = 'OO', wordTrig = false, name = 'mathcal{O}' }, { t('\\mathcal{O}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'PP', wordTrig = false, name = 'projective ℙ' },
		{ t('\\mathbb{P}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'QQ', wordTrig = false, name = 'rational ℚ' }, { t('\\mathbb{Q}') }, {
		condition = tex.in_mathzone,
	}),
	s({ trig = 'RR', wordTrig = false, name = 'real ℝ' }, { t('\\mathbb{R}') }, { condition = tex.in_mathzone }),
	s({ trig = 'ZZ', wordTrig = false, name = 'integer ℤ' }, { t('\\mathbb{Z}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'srt', wordTrig = false, name = 'square root' },
		{ t('\\sqrt{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'set', name = 'set' }, { t('\\{'), i(1), t('\\}') }, { condition = tex.in_mathzone }),
	s({ trig = 'o+', wordTrig = false, name = 'oplus' }, { t('\\oplus') }, { condition = tex.in_mathzone }),
	s({ trig = 'ox', wordTrig = false, name = 'otimes' }, { t('\\otimes') }, { condition = tex.in_mathzone }),
	s({ trig = 'cap', wordTrig = false, name = 'cap' }, { t('\\cap ') }, { condition = tex.in_mathzone }),
	s({ trig = 'cup', wordTrig = false, name = 'cup' }, { t('\\cup ') }, { condition = tex.in_mathzone }),
	s({ trig = 'nnn', wordTrig = false, name = 'bigcup' }, { t('\\bigcup') }, { condition = tex.in_mathzone }),
	s({ trig = 'uuu', wordTrig = false, name = 'bigcap' }, { t('\\bigcap') }, { condition = tex.in_mathzone }),

	s(
		{ trig = 'MK', name = 'Mori-Kleiman cone' },
		{ t('\\cNE('), i(1), t(')') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '([QRZ])P', name = 'positive', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\mathbb{' .. snip.captures[1] .. '}^{>0}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '([QRZ])N', name = 'negative', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\mathbb{' .. snip.captures[1] .. '}^{<0}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '([qr])le', name = 'linearly equivalent', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\sim_{\\mathbb{' .. string.upper(snip.captures[1]) .. '}} '
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = '==', name = 'align equls', wordTrig = false },
		{ t { '&= ' }, i(1), t { ' \\\\', '' } },
		{ condition = tex.in_align }
	),

	s(
		{ trig = '(%a)ii', name = 'alph i', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. '_{i}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '(%a)jj', name = 'alph j', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. '_{j}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s({ trig = 'xmm', wordTrig = false, name = 'x_m' }, { t('x_{m}') }, { condition = tex.in_mathzone }),
	s({ trig = 'xnn', wordTrig = false, name = 'x_n' }, { t('x_{n}') }, { condition = tex.in_mathzone }),
	s({ trig = 'ymm', wordTrig = false, name = 'y_m' }, { t('y_{m}') }, { condition = tex.in_mathzone }),
	s({ trig = 'ynn', wordTrig = false, name = 'y_n' }, { t('y_{n}') }, { condition = tex.in_mathzone }),
}

return snips, autosnips
