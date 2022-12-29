local autosnips = {}

local conds_expand = require('luasnip.extras.conditions.expand')
local tex = require('snips.latex')
local position = require('snips.position')

autosnips = {
	s(
		{ trig = 'bfr', name = 'Beamer Frame Environment' },
		{
			t({ '\\begin{frame}', '\t\\frametitle{' }),
			i(1, 'frame title'),
			t({ '}', '\t' }),
			i(0),
			t({ '', '\\end{frame}' }),
		},
		{
			condition = conds_expand.line_begin * position.in_beamer * tex.in_text,
			show_condition = position.line_begin * position.in_beamer * tex.in_text,
		}
	),
	s(
		{ trig = 'bcor', name = 'Beamer Corollary Environment' },
		{ t({ '\\begin{block}{Corollary}', '\t' }), i(0), t({ '', '\\end{block}' }) },
		{
			condition = conds_expand.line_begin * position.in_beamer * tex.in_text,
			show_condition = position.line_begin * position.in_beamer * tex.in_text,
		}
	),
	s(
		{ trig = 'bdef', name = 'Beamer Definition Environment' },
		{ t({ '\\begin{block}{Definition}', '\t' }), i(0), t({ '', '\\end{block}' }) },
		{
			condition = conds_expand.line_begin * position.in_beamer * tex.in_text,
			show_condition = position.line_begin * position.in_beamer * tex.in_text,
		}
	),
	s(
		{ trig = 'brem', name = 'Beamer Remark Environment' },
		{ t({ '\\begin{block}{Remark}', '\t' }), i(0), t({ '', '\\end{block}' }) },
		{
			condition = conds_expand.line_begin * position.in_beamer * tex.in_text,
			show_condition = position.line_begin * position.in_beamer * tex.in_text,
		}
	),
}

return nil, autosnips
