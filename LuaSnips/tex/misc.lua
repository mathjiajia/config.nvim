local snips, autosnips = {}, {}

local api = vim.api

local conds_expand = require('luasnip.extras.conditions.expand')
local context = require('snips.context')
local position = require('snips.position')
local tex = require('snips.latex')

local appended_space_after_insert = function()
	api.nvim_create_autocmd('InsertCharPre', {
		callback = function()
			if string.find(vim.v.char, '%a') then
				vim.v.char = ' ' .. vim.v.char
			end
		end,
		buffer = 0,
		once = true,
		desc = 'Auto Add a Space after Inline Math',
	})
end

autosnips = {
	s(
		{
			trig = '(%s)([b-zB-HJ-Z0-9])([,;.%-%)]?)%s+',
			name = 'single-letter variable',
			wordTrig = false,
			regTrig = true,
			hidden = true
		},
		{
			f(function(_, snip)
				return snip.captures[1] .. '\\(' .. snip.captures[2] .. '\\)' .. snip.captures[3]
			end, {})
		},
		{ condition = context.in_text }
	),
	s(
		{
			trig = '(%s)([0-9]+[a-zA-Z]+)([,;.%)]?)%s+',
			name = 'surround word starting with number',
			wordTrig = false,
			regTrig = true,
			hidden = true
		},
		{
			f(function(_, snip)
				return snip.captures[1] .. '\\(' .. snip.captures[2] .. '\\)' .. snip.captures[3]
			end, {})
		},
		{ condition = context.in_text }
	),
	s(
		{
			trig = '(%s)(%w[-_+=><]%w)([,;.%)]?)%s+',
			name = 'surround i+1',
			wordTrig = false,
			regTrig = true,
			hidden = true
		},
		{
			f(function(_, snip)
				return snip.captures[1] .. '\\(' .. snip.captures[2] .. '\\)' .. snip.captures[3]
			end, {})
		},
		{ condition = context.in_text }
	),

	s(
		{ trig = 'mk', name = 'inline math', dscr = 'Insert inline Math Environment.' },
		{ t('\\('), i(1), t('\\)') },
		{
			condition = context.in_text,
			show_condition = context.in_text,
			callbacks = {
				[-1] = { [events.leave] = appended_space_after_insert },
			},
		}
	),
	s(
		{ trig = 'dm', name = 'dispaly math', dscr = 'Insert display Math Environment.' },
		{ t({ '\\[', '\t' }), i(1), t({ '', '\\]' }) },
		{
			condition = conds_expand.line_begin * context.in_text,
			show_condition = position.line_begin * context.in_text,
		}
	),
	s(
		{ trig = 'pha', name = 'sum', dscr = 'Insert a sum notation.', hidden = true },
		{ t('&\\phantom{\\;=\\;} ') },
		{ condition = conds_expand.line_begin * tex.in_align }
	),
	s(
		{ trig = 'ni', name = 'non-indented paragraph', dscr = 'Insert non-indented paragraph.' },
		{ t({ '\\noindent', '' }) },
		{
			condition = conds_expand.line_begin * context.in_text,
			show_condition = position.line_begin * context.in_text,
		}
	),
}

return snips, autosnips
