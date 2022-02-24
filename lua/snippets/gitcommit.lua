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
local conds = require('luasnip.extras.expand_conditions')

M = {
	s(
		{ trig = 'feat', name = 'feature' },
		{ t('feat('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'fix', name = 'fix' },
		{ t('fix('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'chore', name = 'chore' },
		{ t('chore('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'revert', name = 'revert' },
		{ t('revert('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'refactor', name = 'refactor' },
		{ t('refactor('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'cleanup', name = 'cleanup' },
		{ t('cleanup('), i(1, 'scope'), t('): '), i(0, 'title') },
		{ condition = conds.line_begin }
	),
}
return M
