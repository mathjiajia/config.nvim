local snips = {}

local tex = require('utils.latex')

snips = {
	s(
		{ trig = 'spaceseq', name = 'set a white space', dscr = 'Select from 3/4/5/normal/18/36/-3mu.' },
		{ c(1, { t('\\, '), t('\\: '), t('\\; '), t('\\  '), t('\\quad '), t('\\qquad '), t('\\! ') }) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s({
		trig = 'larrowseq',
		name = 'set a left arrow',
		dscr = 'leftarrow\nlongleftarrow\nLeftarrow\nLongleftarrow\nxleftarrow',
	}, {
		c(
			1,
			{ t('\\leftarrow '), t('\\longleftarrow '), t('\\Leftarrow '), t('\\Longleftarrow '), t('\\xleftarrow ') }
		),
		i(0),
	}, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),
	s({
		trig = 'rarrowseq',
		name = 'set a right arrow',
		dscr = 'rightarrow\nlongrightarrow\nRightarrow\nLongrightarrow\nxrightarrow',
	}, {
		c(1, {
			t('\\rightarrow '),
			t('\\longrightarrow '),
			t('\\Rightarrow '),
			t('\\Longrightarrow '),
			t('\\xrightarrow '),
		}),
		i(0),
	}, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),
	s({
		trig = 'ltrarrowseq',
		name = 'set a left to right arrow',
		dscr = '\nleftrightarrow\nlongleftrightarrow\nLeftrightarrow\nLongleftrightarrow\nxleftrightarrow',
	}, {
		c(1, {
			t('\\leftrightarrow '),
			t('\\longleftrightarrow '),
			t('\\Leftrightarrow '),
			t('\\Longleftrightarrow '),
			t('\\iff '),
		}),
		i(0),
	}, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),
	s({
		trig = 'fontseq',
		name = 'set a font size',
		dscr = 'tiny\nscriptsize\nfootnotesize\nsmall\nnormalsize\nlarge\nLarge\nLARGE\nhuge\nHuge',
	}, {
		c(1, {
			t('\\tiny '),
			t('\\scriptsize '),
			t('\\footnotesize '),
			t('\\small '),
			t('\\normalsize '),
			t('\\large '),
			t('\\Large '),
			t('\\LARGE '),
			t('\\huge '),
			t('\\Huge '),
		}),
		i(0),
	}, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),
}

return snips
