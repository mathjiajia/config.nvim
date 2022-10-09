local snips, autosnips = {}, {}
local conds = require 'luasnip.extras.conditions.expand'

local on_top = function()
	local cursor = vim.api.nvim_win_get_cursor(0)
	if cursor[1] <= 3 then
		return true
	end
	return false
end

snips = {
	s(
		{ trig = '#([2-6])', name = 'Heading', dscr = 'Add Heading', regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.rep('#', tonumber(snip.captures[1], 10)) .. ' '
		end, {}) },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'code', name = 'Insert fenced code block' },
		{ t '``` ', i(1, 'lang'), t { '', '' }, i(0), t { '', '```' } }
	),
	s(
		{ trig = 'meta', name = 'Markdown front matter (YAML format)' },
		{
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
		},
		{ condition = on_top * conds.line_begin, show_condition = on_top }
	),
	s(
		{ trig = 'td', name = 'too long, do not read' },
		{ t 'tl;dr: ' },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'link', name = 'Markdown Links', dscr = 'Insert a Link' },
		{ t '[', i(1, 'title'), t '](', i(2, 'url'), t ')' }
	),
}

autosnips = {
	s({ trig = ',b', name = 'bold' }, { t '**', i(1), t '**' }),
	s({ trig = ',i', name = 'italic' }, { t '*', i(1), t '*' }),
	s({ trig = ',c', name = 'code' }, { t '`', i(1), t '`' }),
	s({ trig = ',s', name = 'strikethrough' }, { t '~~', i(1), t '~~' }),
}

return snips, autosnips
