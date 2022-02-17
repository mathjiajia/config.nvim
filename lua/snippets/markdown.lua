local M = {}

local ls = require('luasnip')

local f = ls.function_node
local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

local conds = require('luasnip.extras.expand_conditions')

M = {
	s({
		trig = '#([2-6])',
		name = 'Heading',
		dscr = 'Add Heading',
		regTrig = true,
		hidden = true,
	}, {
		f(function(_, snip)
			return string.rep('#', tonumber(snip.captures[1])) .. ' '
		end, {}),
	}, {
		condition = conds.line_begin,
	}),
	s({
		trig = 'code',
		name = 'Insert fenced code block',
	}, {
		t('``` '),
		i(1, 'lang'),
		t { '', '' },
		i(0),
		t { '', '```' },
	}),
}

return M
