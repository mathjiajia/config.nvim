local M = {}

local ls = require('luasnip')
-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require('luasnip.extras').lambda
-- local rep = require('luasnip.extras').rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
-- local conds = require('luasnip.extras.expand_conditions')

M = {
	s({ trig = ',b', name = 'bold' }, { t('**'), i(1), t('**'), i(0) }),
	s({ trig = ',i', name = 'italic' }, { t('*'), i(1), t('*'), i(0) }),
	s({ trig = ',c', name = 'code' }, { t('`'), i(1), t('`'), i(0) }),
	s({ trig = ',s', name = 'strikethrough' }, { t('~~'), i(1), t('~~'), i(0) }),
}

return M
