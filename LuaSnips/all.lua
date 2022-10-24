local snips = {}

local context = require('snips.context')

snips = {
	s(
		{ trig = 'todo', name = 'TODO, NOTE, FIXME', dscr = 'TODO, NOTE, FIXME' },
		{
			c(1, {
				t('TODO(jia): '),
				t('NOTE(jia): '),
				t('FIXME(jia): ')
			})
		},
		{ condition = context.in_comments, show_condition = context.in_comments }
	),
}

return snips
