local M = {}

local ls = require('luasnip')

local i = ls.insert_node
local s = ls.snippet
local t = ls.text_node

local conds = require('luasnip.extras.expand_conditions')

M = {
	s({ trig = ',b', name = 'bold' }, { t('**'), i(1), t('**'), i(0) }),
	s({ trig = ',i', name = 'italic' }, { t('*'), i(1), t('*'), i(0) }),
	s({ trig = ',c', name = 'code' }, { t('`'), i(1), t('`'), i(0) }),
	s({ trig = ',s', name = 'strikethrough' }, { t('~~'), i(1), t('~~'), i(0) }),
}

return M
