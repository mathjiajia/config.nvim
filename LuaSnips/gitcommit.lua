local snips = {}

local conds_expand = require('luasnip.extras.conditions.expand')

snips = {
	s(
		{ trig = 'feat', name = 'feature' },
		{ t('feat('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds_expand.line_begin }
	),
	s(
		{ trig = 'fix', name = 'fix' },
		{ t('fix('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds_expand.line_begin }
	),
	s(
		{ trig = 'chore', name = 'chore' },
		{ t('chore('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds_expand.line_begin }
	),
	s(
		{ trig = 'revert', name = 'revert' },
		{ t('revert('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds_expand.line_begin }
	),
	s(
		{ trig = 'refactor', name = 'refactor' },
		{ t('refactor('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds_expand.line_begin }
	),
	s(
		{ trig = 'cleanup', name = 'cleanup' },
		{ t('cleanup('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds_expand.line_begin }
	),
}
return snips
