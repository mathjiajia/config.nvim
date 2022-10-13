local snips = {}

local in_comments = require 'snips.context'.in_comments

snips = {
	s(
		{ trig = 'todo', name = 'TODO, NOTE, FIXME', dscr = 'TODO, NOTE, FIXME' },
		{ c(1, {
			t 'TODO(jia): ',
			t 'NOTE(jia): ',
			t 'FIXME(jia): ',
		}) },
		{ condition = in_comments, show_condition = in_comments }
	),
}

return snips
