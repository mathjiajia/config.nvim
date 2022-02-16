local M = {}

local ls = require('luasnip')

local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

local conds = require('luasnip.extras.expand_conditions')

M = {
	s({
		trig = ',b',
		name = 'bold',
	}, {
		t('*'),
		i(1),
		t('*'),
		i(0),
	}),
	s({
		trig = ',i',
		name = 'italic',
	}, {
		t('/'),
		i(1),
		t('/'),
		i(0),
	}),
	s({
		trig = ',u',
		name = 'underline',
	}, {
		t('_'),
		i(1),
		t('_'),
		i(0),
	}),
	s({
		trig = ',s',
		name = 'strikethrough',
	}, {
		t('-'),
		i(1),
		t('-'),
		i(0),
	}),
	s({
		trig = ',|',
		name = 'spoiler',
	}, {
		t('|'),
		i(1),
		t('|'),
		i(0),
	}),
	s({
		trig = ',c',
		name = 'inline code',
	}, {
		t('`'),
		i(1),
		t('`'),
		i(0),
	}),
	s({
		trig = ',^',
		name = 'subscript',
	}, {
		t('^'),
		i(1),
		t('^'),
		i(0),
	}),
	s({
		trig = ',_',
		name = 'subscript',
	}, {
		t(','),
		i(1),
		t(','),
		i(0),
	}),
	s({
		trig = 'mk',
		name = 'inline math',
	}, {
		t('$'),
		i(1),
		t('$'),
		i(0),
	}),
	s({
		trig = ',v',
		name = 'variable',
	}, {
		t('='),
		i(1),
		t('='),
		i(0),
	}),
	s({
		trig = ',+',
		name = 'comment',
	}, {
		t('+'),
		i(1),
		t('+'),
		i(0),
	}),
}

return M
