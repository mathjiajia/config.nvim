local M = {}

M = {
	s(
		{ trig = 'todo', name = 'TODO, NOTE, FIXME', hidden = true },
		{ c(1, {
			t('TODO(jia): '),
			t('NOTE(jia): '),
			t('FIXME(jia): '),
		}) }
	),
}

return M
