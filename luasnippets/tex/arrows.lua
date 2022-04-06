local snips, autosnips = {}, {}

local tex = require('utils.latex')

autosnips = {
	s({ trig = 'rmap', name = 'rational map arrow' }, {
		d(1, function()
			if not tex.in_xymatrix() then
				return sn(nil, { t('\\dashrightarrow ') })
			else
				return sn(nil, { t { '\\ar@{-->}[' }, i(1), t { ']' } })
			end
		end),
	}, { condition = tex.in_mathzone }),
	s({ trig = 'emb', name = 'embeddeing map arrow' }, {
		d(1, function()
			if not tex.in_xymatrix() then
				return sn(nil, { t('\\hookrightarrow ') })
			else
				return sn(nil, { t { '\\ar@{^{(}->}[' }, i(1), t { ']' } })
			end
		end),
	}, { condition = tex.in_mathzone }),

	s(
		{ trig = '<->', wordTrig = false, name = 'leftrightarrow <->' },
		{ t('\\leftrightarrow ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '->', wordTrig = false, name = 'rightarrow -->' },
		{ t('\\longrightarrow ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '!>', wordTrig = false, name = 'mapsto |->' }, { t('\\mapsto ') }, { condition = tex.in_mathzone }),
	s({ trig = '=>', name = 'implies =>', wordTrig = false }, { t('\\implies ') }, { condition = tex.in_mathzone }),
	s({ trig = '=<', name = 'impliedby', wordTrig = false }, { t('\\impliedby ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'iff', name = 'if and only if <=>', wordTrig = false },
		{ t('\\iff ') },
		{ condition = tex.in_mathzone }
	),
}

return snips, autosnips
