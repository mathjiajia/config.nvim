local snips = {}

snips = {
	s(
		{ trig = 'M', name = 'Module decl.', dscr = 'Declare a lua module' },
		{ t { 'local M = {}', '', '\t' }, i(0), t { '', '', 'return M' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'lreq', name = 'local require', dscr = 'Require module as a variable' },
		{ t 'local ', dl(2, l._1:match '%.([%w_]+)$', { 1 }), t ' = require("', i(1), t '")' },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'lf', name = 'table function', dscr = 'table function' },
		{ t 'local ', i(1), t ' = function(', i(2), t { ')', '\t' }, i(0), t { '', 'end' } },
		{ condition = conds.line_begin }
	),
}

return snips
