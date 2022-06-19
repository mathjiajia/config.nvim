local snips, autosnips = {}, {}

local postfix = require('luasnip.extras.postfix').postfix
local tex = require 'utils.latex'

snips = {
	s(
		{ trig = 'bf', name = 'bold', dscr = 'Insert bold text.' },
		{ t '\\textbf{', i(1), t '}' },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = 'it', name = 'italic', dscr = 'Insert italic text.' },
		{ t '\\textit{', i(1), t '}' },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = 'em', name = 'emphasize', dscr = 'Insert emphasize text.' },
		{ t '\\emph{', i(1), t '}' },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
}

autosnips = {
	postfix(
		{ trig = 'bar', name = 'post overline', match_pattern = '%a' },
		{ l('\\overline{' .. l.POSTFIX_MATCH .. '}') },
		{ condition = tex.in_mathzone }),
	postfix(
		{ trig = 'hat', name = 'post widehat', match_pattern = '%a' },
		{ l('\\widehat{' .. l.POSTFIX_MATCH .. '}') },
		{ condition = tex.in_mathzone }),
	postfix(
		{ trig = 'td', name = 'post widetilde', match_pattern = '%a' },
		{ l('\\widetilde{' .. l.POSTFIX_MATCH .. '}') },
		{ condition = tex.in_mathzone }),
	s({ trig = 'bar', name = 'overline' }, { t '\\overline{', i(1), t '}' }, { condition = tex.in_mathzone }),
	s({ trig = 'hat', name = 'widehat' }, { t '\\widehat{', i(1), t '}' }, { condition = tex.in_mathzone }),
	s({ trig = 'td', name = 'widetilde' }, { t '\\widetilde{', i(1), t '}' }, {
		condition = tex.in_mathzone,
	}),
	s({ trig = 'quad', name = 'quad' }, { t '\\quad ' }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'tt', wordTrig = false, name = 'text' },
		{ t '\\text{', i(1), t '}' },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'tss', wordTrig = false, name = 'text subscript' },
		{ t '_{\\mathrm{', i(1), t '}}' },
		{ condition = tex.in_mathzone }
	),
	-- s({ trig = '[^\\]"', name = 'Quotation', regTrig = true }, { t '``', i(1), t "''" }, { condition = tex.in_text }),
}

return snips, autosnips
