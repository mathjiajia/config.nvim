local snips = {}

local conds_expand = require('luasnip.extras.conditions.expand')
local context = require('snips.context')
local position = require('snips.position')

snips = {
	s(
		{ trig = 'cha', name = 'Chapter', dscr = 'Insert a new chapter.' },
		{
			t({ '\\chapter{' }),
			i(1),
			t({ '}\\label{cha:' }),
			l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
			t({ '}', '', '' })
		},
		{
			condition = conds_expand.line_begin * context.in_text,
			show_condition = position.line_begin * context.in_text,
		}
	),
	s(
		{ trig = 'sec', name = 'Section', dscr = 'Insert a new section.', regTrig = true },
		{
			t({ '\\section{' }),
			i(1),
			t({ '}\\label{sec:' }),
			l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
			t({ '}', '', '' })
		},
		{
			condition = conds_expand.line_begin * context.in_text,
			show_condition = position.line_begin * context.in_text,
		}
	),
	s(
		{ trig = 'ssec', name = 'star Section', dscr = 'Insert a section without index.', regTrig = true },
		{
			t({ '\\section*{' }),
			i(1),
			t({ '}\\label{sec:' }),
			l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
			t({ '}', '', '' })
		},
		{
			condition = conds_expand.line_begin * context.in_text,
			show_condition = position.line_begin * context.in_text,
		}
	),
	s(
		{ trig = 'sub', name = 'subSection', dscr = 'Insert a new subsection.', regTrig = true },
		{
			t({ '\\subsection{' }),
			i(1),
			t({ '}\\label{sub:' }),
			l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
			t({ '}', '', '' })
		},
		{
			condition = conds_expand.line_begin * context.in_text,
			show_condition = position.line_begin * context.in_text,
		}
	),
	s(
		{ trig = 'ssub', name = 'star subSection', dscr = 'Insert a subsection without index.', regTrig = true },
		{
			t({ '\\subsection*{' }),
			i(1),
			t({ '}\\label{sub:' }),
			l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
			t({ '}', '', '' }),
		},
		{
			condition = conds_expand.line_begin * context.in_text,
			show_condition = position.line_begin * context.in_text,
		}
	),
}

return snips
