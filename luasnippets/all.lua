local M = {}

M = {
	-- s({ trig = 'date', name = 'Current Date' }, { f(function()
	-- 	return os.date('%Y-%m-%d')
	-- end) }),
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
