local M = {}

local ls = require('luasnip')
-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
-- local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local l = require('luasnip.extras').lambda
-- local rep = require('luasnip.extras').rep
local p = require('luasnip.extras').partial
-- local m = require('luasnip.extras').match
-- local n = require('luasnip.extras').nonempty
-- local dl = require('luasnip.extras').dynamic_lambda
-- local fmt = require('luasnip.extras.fmt').fmt
-- local fmta = require('luasnip.extras.fmt').fmta
-- local types = require('luasnip.util.types')
-- local conds = require('luasnip.extras.expand_conditions')

-- local events = require('luasnip.util.events')

M = {
	s({ trig = 'fixme', name = 'FIXME:', hidden = true }, { t('FIXME('), p(os.getenv, 'USER'), t('): ') }),
	s({ trig = 'note', name = 'NOTE:', hidden = true }, { t('NOTE('), p(os.getenv, 'USER'), t('): ') }),
	s({ trig = 'todo', name = 'TODO:', hidden = true }, { t('TODO('), p(os.getenv, 'USER'), t('): ') }),
}

return M
