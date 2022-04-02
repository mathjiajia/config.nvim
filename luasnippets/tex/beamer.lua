local autosnips = {}

local tex = require('utils.latex')
local in_beamer = function()
	local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)
	if first_line[1]:match('\\documentclass{beamer}') then
		return true
	end
	return false
end

local pipe = function(fns)
	return function(...)
		for _, fn in ipairs(fns) do
			if not fn(...) then
				return false
			end
		end
		return true
	end
end

autosnips = {
	s({ trig = 'bfr', name = 'Beamer Frame Environment' }, {
		t { '\\begin{frame}', '\t\\frametitle{' },
		i(1, 'frame title'),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{frame}' },
	}, { condition = pipe { conds.line_begin, in_beamer, tex.in_text } }),
	s(
		{ trig = 'bcor', name = 'Beamer Corollary Environment' },
		{ t { '\\begin{block}{Corollary}', '\t' }, i(0), t { '', '\\end{block}' } },
		{ condition = pipe { conds.line_begin, in_beamer, tex.in_text } }
	),
	s(
		{ trig = 'bdef', name = 'Beamer Definition Environment' },
		{ t { '\\begin{block}{Definition}', '\t' }, i(0), t { '', '\\end{block}' } },
		{ condition = pipe { conds.line_begin, in_beamer, tex.in_text } }
	),
	s(
		{ trig = 'brem', name = 'Beamer Remark Environment' },
		{ t { '\\begin{block}{Remark}', '\t' }, i(0), t { '', '\\end{block}' } },
		{ condition = pipe { conds.line_begin, in_beamer, tex.in_text } }
	),
}

return nil, autosnips
