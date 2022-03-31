local snips = {}

local require_var = function(args, _)
	local text = args[1][1] or ''
	local split = vim.split(text, '.', { plain = true })

	local options = {}
	for len = 0, #split - 1 do
		table.insert(options, t(table.concat(vim.list_slice(split, #split - len, #split), '_')))
	end

	return sn(nil, {
		c(1, options),
	})
end

snips = {
	s(
		{ trig = 'M', name = 'Module decl.', dscr = 'Declare a lua module' },
		{ t { 'local M = {}', '', '\t' }, i(0), t { '', '', 'return M' } },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'lreq', name = 'local require', dscr = 'Require module as a variable' },
		{ t('local '), d(2, require_var, { 1 }), t(' = require("'), i(1), t('")') },
		{ condition = conds.line_begin }
	),
	s(
		{ trig = 'lf', name = 'table function', dscr = 'table function' },
		{ t('local '), i(1), t(' = function('), i(2), t { ')', '\t' }, i(0), t { '', 'end' } },
		{ condition = conds.line_begin }
	),
}

return snips
