local snips = {}

snips = {
	s(
		{ trig = 'M', name = 'Module decl.', dscr = 'Declare a lua module' },
		{ t { 'local M = {}', '', '\t' }, i(0), t { '', '', 'return M' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'lreq', name = 'local require', dscr = 'Require module as a variable' },
		{ t('local '), i(1, 'var'), t('= require("'), i(2, 'mod'), t('")'), i(0) },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'ignore', name = 'stylua ignore', dscr = 'Ignoring parts of a file with stylua' },
		{ t('-- stylua: ignore '), i(0) },
		{ condition = conds.line_begin }
	),
}

return snips
