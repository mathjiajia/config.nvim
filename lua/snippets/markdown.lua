local M = {}

local ls = require('luasnip')
-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require('luasnip.extras').lambda
-- local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
local conds = require('luasnip.extras.expand_conditions')

M = {
	s(
		{ trig = '#([2-6])', name = 'Heading', dscr = 'Add Heading', regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.rep('#', tonumber(snip.captures[1])) .. ' '
		end, {}) },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'code', name = 'Insert fenced code block' },
		{ t('``` '), i(1, 'lang'), t { '', '' }, i(0), t { '', '```' } }
	),
	s({ trig = 'meta', name = 'Markdown front matter (YAML format)' }, {
		t { '---', 'title: ' },
		i(1),
		t { '', 'date: ' },
		p(os.date, '%Y-%m-%dT%H:%M:%S+0800'),
		t { '', 'tags: ["' },
		i(2),
		t { '"]', 'categories: ["' },
		i(3),
		t { '"]', 'series: ["' },
		i(4),
		t { '"]', '---', '', '' },
		i(0),
	}, { condition = conds.line_begin }),
	s({ trig = 'td', name = 'too long, do not read' }, { t('tl;dr: ') }, { condition = conds.line_begin }),
	s(
		{ trig = 'link', name = 'Markdown Links', dscr = 'Insert a Link' },
		{ t('['), i(1, 'title'), t(']('), i(2, 'url'), t(')'), i(0) }
	),
}

return M
