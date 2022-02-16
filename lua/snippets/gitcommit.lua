local M = {}

local ls = require('luasnip')

local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

local conds = require('luasnip.extras.expand_conditions')

M = {
	s({
		trig = 'feat',
		name = 'feature',
	}, {
		t('feat('),
		i(1, 'scope'),
		t('): '),
		i(0, 'title'),
	}, {
		condition = conds.line_begin,
	}),
	s({
		trig = 'fix',
		name = 'fix',
	}, {
		t('fix('),
		i(1, 'scope'),
		t('): '),
		i(0, 'title'),
	}, {
		condition = conds.line_begin,
	}),
	s({
		trig = 'chore',
		name = 'chore',
	}, {
		t('chore('),
		i(1, 'scope'),
		t('): '),
		i(0, 'title'),
	}, {
		condition = conds.line_begin,
	}),
	s({
		trig = 'revert',
		name = 'revert',
	}, {
		t('revert('),
		i(1, 'scope'),
		t('): '),
		i(0, 'title'),
	}, {
		condition = conds.line_begin,
	}),
	s({
		trig = 'refactor',
		name = 'refactor',
	}, {
		t('refactor('),
		i(1, 'scope'),
		t('): '),
		i(0, 'title'),
	}, {
		condition = conds.line_begin,
	}),
	s({
		trig = 'cleanup',
		name = 'cleanup',
	}, {
		t('cleanup('),
		i(1, 'scope'),
		t('): '),
		i(0, 'title'),
	}, {
		condition = conds.line_begin,
	}),
}
return M
