local snips, autosnips = {}, {}

local tex = require('utils.latex')

snips = {
	s(
		{ trig = 'bf', name = 'bold', dscr = 'Insert bold text.' },
		{ t('\\textbf{'), i(1), t('}') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = 'it', name = 'italic', dscr = 'Insert italic text.' },
		{ t('\\textit{'), i(1), t('}') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = 'em', name = 'emphasize', dscr = 'Insert emphasize text.' },
		{ t('\\emph{'), i(1), t('}') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
}

autosnips = {
	s(
		{ trig = '(%a)bar', name = 'post overline', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\overline{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '(%a)hat', name = 'post widehat', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\widehat{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '(%a)td', name = 'post widetilde', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\widetilde{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'bar', name = 'overline' }, { t('\\overline{'), i(1), t('}') }, { condition = tex.in_mathzone }),
	s({ trig = 'hat', name = 'widehat' }, { t('\\widehat{'), i(1), t('}') }, { condition = tex.in_mathzone }),
	s({ trig = 'td', name = 'widetilde' }, { t('\\widetilde{'), i(1), t('}') }, {
		condition = tex.in_mathzone,
	}),
	s({ trig = 'quad', name = 'quad' }, { t('\\quad ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'tt', wordTrig = false, name = 'text' },
		{ t('\\text{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'tss', wordTrig = false, name = 'text subscript' },
		{ t('_{\\mathrm{'), i(1), t('}}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '"', name = 'Quotation' }, { t('``'), i(1), t("''") }, { condition = tex.in_text }),
}

return snips, autosnips
