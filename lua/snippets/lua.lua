local M = {}

local ls = require('luasnip')

local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

local conds = require('luasnip.extras.expand_conditions')

M = {
	s({
		trig = 'M',
		name = 'Module decl.',
		dscr = 'Declare a lua module',
	}, {
		t { 'local M = {}', '', '\t' },
		i(0),
		t { '', '', 'return M' },
	}, {
		condition = conds.line_begin,
	}),
	s({
		trig = 'lreq',
		name = 'local require',
		dscr = 'Require module as a variable',
	}, {
		t('local '),
		i(1, 'var'),
		t('= require("'),
		i(2, 'mod'),
		t('")'),
		i(0),
	}, {
		condition = conds.line_begin,
	}),
}

return M
