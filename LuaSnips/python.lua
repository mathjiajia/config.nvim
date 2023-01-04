local snips = {}

local conds_expand = require('luasnip.extras.conditions.expand')
local position = require('util.position')

snips = {
	s(
		{ trig = 'env', name = 'python3 environment', dscr = 'Declare py3 environment' },
		{ t({ '#!/usr/bin/env python3', '' }) },
		{
			condition = position.on_top * conds_expand.line_begin,
			show_condition = position.on_top * position.line_begin
		}
	),
}

return snips
