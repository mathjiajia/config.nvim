local snips, autosnips = {}, {}

local tex = require 'snips.latex'
local pipe = require 'snips.util'.pipe

local in_beamer = function()
	local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)
	if first_line[1]:match '\\documentclass{beamer}' then
		return true
	end
	return false
end

autosnips = {
	s(
		{ trig = 'bfr', name = 'Beamer Frame Environment' },
		{
			t { '\\begin{frame}', '\t\\frametitle{' },
			i(1, 'frame title'),
			t { '}', '\t' },
			i(0),
			t { '', '\\end{frame}' },
		},
		{ condition = pipe { conds.line_begin, in_beamer, tex.in_text } }),
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

return snips, autosnips
