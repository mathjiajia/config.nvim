local autosnips = {}

local tex = require('util.latex')

autosnips = {
	s(
		{ trig = 'rmap', name = 'rational map arrow', wordTrig = false, hidden = true },
		{
			d(1, function()
				if tex.in_xymatrix() then
					return sn(nil, { t({ '\\ar@{-->}[' }), i(1), t({ ']' }) })
				else
					return sn(nil, { t('\\dashrightarrow ') })
				end
			end)
		},
		{ condition = tex.in_mathzone }),
	s(
		{ trig = 'emb', name = 'embeddeing map arrow', wordTrig = false, hidden = true },
		{
			d(1, function()
				if tex.in_xymatrix() then
					return sn(nil, { t({ '\\ar@{^{(}->}[' }), i(1), t({ ']' }) })
				else
					return sn(nil, { t('\\hookrightarrow ') })
				end
			end)
		},
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = '<->', wordTrig = false, name = 'leftrightarrow <->', hidden = true },
		{ t('\\leftrightarrow ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '->', wordTrig = false, name = 'rightarrow ->', hidden = true },
		{ t('\\to ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '!>', wordTrig = false, name = 'mapsto |->', hidden = true },
		{ t('\\mapsto ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '=>', name = 'implies =>', wordTrig = false, hidden = true },
		{ t('\\implies ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '=<', name = 'impliedby', wordTrig = false, hidden = true },
		{ t('\\impliedby ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'iff', name = 'if and only if <=>', wordTrig = false, hidden = true },
		{ t('\\iff ') },
		{ condition = tex.in_mathzone }
	),
}

return nil, autosnips
