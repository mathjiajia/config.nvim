local snips, autosnips = {}, {}

local tex = {}

tex.in_beamer = function()
	local first_line = vim.api.nvim_buf_get_lines(0, 0, 1, false)
	if first_line[1]:match('\\documentclass{beamer}') then
		return true
	end
	return false
end
tex.on_top = function()
	local cursor = vim.api.nvim_win_get_cursor(0)
	if cursor[1] <= 3 then
		return true
	end
	return false
end

local ts = require('vim.treesitter')
local query = require('vim.treesitter.query')

local MATH_ENVIRONMENTS = {
	['{displaymath}'] = true,
	['{equation}'] = true,
	['{multline}'] = true,
	['{eqnarray}'] = true,
	['{align}'] = true,
	['{array}'] = true,
	['{split}'] = true,
	['{alignat}'] = true,
	['[gather]'] = true,
	['{flalign}'] = true,
}
local MATH_NODES = {
	displayed_equation = true,
	inline_formula = true,
}
local ALIGN_ENVIRONMENTS = {
	['{multline}'] = true,
	['{eqnarray}'] = true,
	['{align}'] = true,
	['{array}'] = true,
	['{split}'] = true,
	['{alignat}'] = true,
	['[gather]'] = true,
	['{flalign}'] = true,
}

local COMMENT = {
	['comment'] = true,
	['line_comment'] = true,
	['block_comment'] = true,
	['comment_environment'] = true,
}

local function get_node_at_cursor()
	local cursor = vim.api.nvim_win_get_cursor(0)
	local cursor_range = { cursor[1] - 1, cursor[2] }
	local buf = vim.api.nvim_get_current_buf()
	local ok, parser = pcall(ts.get_parser, buf, 'latex')
	if not ok or not parser then
		return
	end
	local root_tree = parser:parse()[1]
	local root = root_tree and root_tree:root()

	if not root then
		return
	end

	return root:named_descendant_for_range(cursor_range[1], cursor_range[2], cursor_range[1], cursor_range[2])
end

function tex.in_comment()
	local node = get_node_at_cursor()
	while node do
		if COMMENT[node:type()] then
			return true
		end
		node = node:parent()
	end
	return false
end

function tex.in_text()
	local buf = vim.api.nvim_get_current_buf()
	local node = get_node_at_cursor()

	while node do
		if node:type() == 'text_mode' then
			return true
		end
		if MATH_NODES[node:type()] then
			return false
		end
		if node:type() == 'generic_environment' then
			local begin = node:child(0)
			local names = begin and begin:field('name')

			if names and names[1] and MATH_ENVIRONMENTS[query.get_node_text(names[1], buf)] then
				return false
			end
		end
		node = node:parent()
	end

	return true
end

function tex.in_mathzone()
	local buf = vim.api.nvim_get_current_buf()
	local node = get_node_at_cursor()

	while node do
		if node:type() == 'text_mode' then
			return false
		end
		if MATH_NODES[node:type()] then
			return true
		end
		if node:type() == 'generic_environment' then
			local begin = node:child(0)
			local names = begin and begin:field('name')

			if names and names[1] and MATH_ENVIRONMENTS[query.get_node_text(names[1], buf)] then
				return true
			end
		end
		node = node:parent()
	end

	return false
end

function tex.in_align()
	local buf = vim.api.nvim_get_current_buf()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'generic_environment' then
			local begin = node:child(0)
			local names = begin and begin:field('name')

			if names and names[1] and ALIGN_ENVIRONMENTS[query.get_node_text(names[1], buf)] then
				return true
			end
		end
		node = node:parent()
	end
	return false
end

function tex.in_xymatrix()
	local buf = vim.api.nvim_get_current_buf()
	local node = get_node_at_cursor()
	while node do
		if node:type() == 'generic_command' then
			local names = node:child(0)
			if names and query.get_node_text(names, buf) == '\\xymatrix' then
				return true
			end
		end
		node = node:parent()
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

local appended_space_after_insert = function()
	vim.api.nvim_create_autocmd('InsertCharPre', {
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

-- local smart_space = function(args, _)
-- 	local space = ''
-- 	if string.find(args[1][1], '^%a') then
-- 		space = ' '
-- 	end
-- 	return sn(nil, t(space))
-- end

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			t { '' },
			sn(nil, { t { '', '\t\\item ' }, i(1), d(2, rec_ls, {}) }),
		}),
	})
end

autosnips = {

	-- priority 60:

	s({ trig = 'ee' }, { t('works') }, { condition = tex.in_mathzone }),

	s({ trig = '([hH])_(%d)(%u)', name = 'cohomology-d', regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1] .. '^{' .. snip.captures[2] .. '}(' .. snip.captures[3] .. ','
		end, {}),
		i(1),
		t(')'),
		i(0),
	}, { condition = tex.in_mathzone }),
	s(
		{ trig = '(%a)p(%d)', name = 'x[n+1]', regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. '_{n+' .. snip.captures[2] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	-- priority 50:

	s({ trig = '\\varpii', name = '\\varpi_i' }, { t('\\varpi_{i}') }, { condition = tex.in_mathzone }),
	s({ trig = '\\varphii', name = '\\varphi_i' }, { t('\\varphi_{i}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '\\([xX])ii', name = '\\xi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%si_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([pP])ii', name = '\\pi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%si_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([pP])hii', name = '\\phi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%shi_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([cC])hii', name = '\\chi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%shi_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '\\([pP])sii', name = '\\psi_{i}', regTrig = true },
		{ f(function(_, snip)
			return string.format('\\%ssi_{i}', snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	-- priority 40:

	s({ trig = 'cod', name = 'codimension' }, { t('\\codim') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'dint', name = 'integral', dscr = 'Insert integral notation.' },
		{ t('\\int_{'), i(1, '-\\infty'), t('}^{'), i(2, '\\infty'), t('} ') },
		{ condition = tex.in_mathzone }
	),

	-- priority 30:

	s({ trig = 'coker', name = 'cokernel' }, { t('\\coker') }, { condition = tex.in_mathzone }),

	-- priority 20:

	s({
		trig = '(%s)([b-zB-HJ-Z0-9])([,;.%-%)]?)%s+',
		name = 'single-letter variable',
		wordTrig = false,
		regTrig = true,
	}, {
		f(function(_, snip)
			return snip.captures[1] .. '\\(' .. snip.captures[2] .. '\\)' .. snip.captures[3]
		end, {}),
	}, { condition = tex.in_text }),
	s({
		trig = '(%s)([0-9]+[a-zA-Z]+)([,;.%)]?)%s+',
		name = 'surround word starting with number',
		wordTrig = false,
		regTrig = true,
	}, {
		f(function(_, snip)
			return snip.captures[1] .. '\\(' .. snip.captures[2] .. '\\)' .. snip.captures[3]
		end, {}),
	}, { condition = tex.in_text }),
	s({ trig = '(%s)(%w[-_+=><]%w)([,;.%)]?)%s+', name = 'surround i+1', wordTrig = false, regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1] .. '\\(' .. snip.captures[2] .. '\\)' .. snip.captures[3]
		end, {}),
	}, { condition = tex.in_text }),

	s({ trig = 'ses', name = 'short exact sequence' }, {
		c(1, { t('0'), t('1') }),
		t('\\longrightarrow '),
		i(2),
		t('\\longrightarrow '),
		i(3),
		t('\\longrightarrow '),
		i(4),
		t('\\longrightarrow '),
		rep(1),
		i(0),
	}, { condition = tex.in_mathzone }),

	-- s({ trig = 'arcsin', name = 'arcsin' }, { t('\\arcsin') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arccos', name = 'arccos' }, { t('\\arccos') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arctan', name = 'arctan' }, { t('\\arctan') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arccot', name = 'arccot' }, { t('\\arccot') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arccsc', name = 'arccsc' }, { t('\\arccsc') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'arcsec', name = 'arcsec' }, { t('\\arcsec') }, { condition = tex.in_mathzone }),

	s({ trig = 'int', name = 'int' }, { t('\\int') }, { condition = tex.in_mathzone }),
	s({ trig = 'sin', name = 'sin' }, { t('\\sin') }, { condition = tex.in_mathzone }),
	s({ trig = 'cos', name = 'cos' }, { t('\\cos') }, { condition = tex.in_mathzone }),
	s({ trig = 'tan', name = 'tan' }, { t('\\tan') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'cot', name = 'cot' }, { t('\\cot') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'csc', name = 'csc' }, { t('\\csc') }, { condition = tex.in_mathzone }),
	-- s({ trig = 'sec', name = 'sec' }, { t('\\sec') }, { condition = tex.in_mathzone }),

	s({ trig = 'abs', name = 'abs' }, { t('\\abs{'), i(1), t('}') }, { condition = tex.in_mathzone }),
	s({ trig = 'deg', name = 'deg' }, { t('\\deg') }, { condition = tex.in_mathzone }),
	s({ trig = 'det', name = 'det' }, { t('\\det') }, { condition = tex.in_mathzone }),
	s({ trig = 'dim', name = 'dim' }, { t('\\dim') }, { condition = tex.in_mathzone }),
	s({ trig = 'hom', name = 'hom' }, { t('\\hom') }, { condition = tex.in_mathzone }),
	s({ trig = 'inf', name = 'inf' }, { t('\\inf') }, { condition = tex.in_mathzone }),
	s({ trig = 'max', name = 'max' }, { t('\\max') }, { condition = tex.in_mathzone }),
	s({ trig = 'min', name = 'min' }, { t('\\min') }, { condition = tex.in_mathzone }),
	s({ trig = 'ker', name = 'ker' }, { t('\\ker') }, { condition = tex.in_mathzone }),
	s({ trig = 'sup', name = 'sup' }, { t('\\sup') }, { condition = tex.in_mathzone }),

	s(
		{ trig = '(%a)ii', name = 'alph i', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. '_{i}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '(%a)jj', name = 'alph j', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. '_{j}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s({ trig = 'xmm', wordTrig = false, name = 'x_m' }, { t('x_{m}') }, { condition = tex.in_mathzone }),
	s({ trig = 'xnn', wordTrig = false, name = 'x_n' }, { t('x_{n}') }, { condition = tex.in_mathzone }),
	s({ trig = 'ymm', wordTrig = false, name = 'y_m' }, { t('y_{m}') }, { condition = tex.in_mathzone }),
	s({ trig = 'ynn', wordTrig = false, name = 'y_n' }, { t('y_{n}') }, { condition = tex.in_mathzone }),

	s({ trig = '([hH])([i-npq])(%u)', name = 'cohomology-a', regTrig = true }, {
		f(function(_, snip)
			return snip.captures[1] .. '^{' .. snip.captures[2] .. '}(' .. snip.captures[3] .. ','
		end, {}),
		i(1),
		t(')'),
		i(0),
	}, { condition = tex.in_mathzone }),

	s(
		{ trig = '<->', wordTrig = false, name = 'leftrightarrow <->' },
		{ t('\\leftrightarrow ') },
		{ condition = tex.in_mathzone }
	),

	-- priority 10:

	s(
		{ trig = '(%a)bar', name = 'overline', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\overline{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '(%a)hat', name = 'widehat', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\widehat{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '(%a)td', name = 'widetilde', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\widetilde{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	-- priority 1:

	-- phrases which are often used
	s({ trig = 'iee', name = 'id est' }, { t('i.e., ') }, { condition = tex.in_text }),
	s({ trig = 'egg', name = 'exempli gratia' }, { t('e.g., ') }, { condition = tex.in_text }),
	s({ trig = 'stt', name = 'such that' }, { t('such that') }, { condition = tex.in_text }),
	s({ trig = 'qf', name = 'Q-factorial' }, { t('\\(\\mathbb{Q}\\)-factorial') }, { condition = tex.in_text }),
	s(
		{ trig = '([qr])c', name = 'Cartier', regTrig = true },
		{ f(function(_, snip)
			return '\\(\\mathbb{' .. string.upper(snip.captures[1]) .. '}\\)-Cartier'
		end, {}) },
		{ condition = tex.in_text }
	),
	s(
		{ trig = '([qr])d', name = 'divisor', regTrig = true },
		{ f(function(_, snip)
			return '\\(\\mathbb{' .. string.upper(snip.captures[1]) .. '}\\)-divisor'
		end, {}) },
		{ condition = tex.in_text }
	),
	s({ trig = 'cd', name = 'Cartier divisor' }, { t('Cartier divisor') }, { condition = tex.in_text }),
	s({ trig = 'wd', name = 'Weil divisor' }, { t('Weil divisor') }, { condition = tex.in_text }),
	s({ trig = 'nc', name = '-1-curve' }, { t('\\((-1)\\)-curve') }, { condition = tex.in_text }),
	s({ trig = 'iff', name = 'if and only if' }, { t('if and only if ') }, { condition = tex.in_text }),
	s({ trig = 'wrt', name = 'with respect to' }, { t('with respect to ') }, { condition = tex.in_text }),
	s({ trig = 'nbhd', name = 'neighbourhood' }, { t('neighbourhood') }, { condition = tex.in_text }),
	s({ trig = 'pef', name = 'pseudo-effective' }, { t('pseudo-effective') }, { condition = tex.in_text }),
	s(
		{ trig = 'gbgs', name = 'generated by global sections' },
		{ t('generated by global sections') },
		{ condition = tex.in_text }
	),
	s({ trig = 'fgd', name = 'finitely generated' }, { t('finitely generated') }, { condition = tex.in_text }),
	s({ trig = 'mfs', name = 'Mori fibre space' }, { t('Mori fibre space') }, { condition = tex.in_text }),
	s({ trig = 'bpf', name = 'base point free' }, { t('base point free') }, { condition = tex.in_text }),
	s({ trig = 'snc', name = 'simple normal crossing' }, { t('simple normal crossing') }, {
		condition = tex.in_text,
	}),
	s({ trig = 'lmm', name = 'log minimal model' }, { t('log minimal model') }, { condition = tex.in_text }),
	s(
		{ trig = '([tT])fae', name = 'the following are equivalent', regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. 'he following are equivalent'
		end, {}) },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = '([wW])log', name = 'without loss of generality', regTrig = true },
		{ f(function(_, snip)
			return snip.captures[1] .. 'ithout loss of generality'
		end, {}) },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s({ trig = 'quad', name = 'quad' }, { t('\\quad ') }, { condition = tex.in_mathzone }),

	s({ trig = 'bar', name = 'overline' }, { t('\\overline{'), i(1), t('}') }, { condition = tex.in_mathzone }),
	s({ trig = 'hat', name = 'widehat' }, { t('\\widehat{'), i(1), t('}') }, { condition = tex.in_mathzone }),
	s({ trig = 'td', name = 'widetilde' }, { t('\\widetilde{'), i(1), t('}') }, {
		condition = tex.in_mathzone,
	}),

	s({ trig = 'O([A-NP-Za-z])', name = 'local ring, structure sheaf', wordTrig = false, regTrig = true }, {
		f(function(_, snip)
			return '\\mathcal{O}_{' .. snip.captures[1] .. '}'
		end, {}),
	}, { condition = tex.in_mathzone }),

	-- priority 0:

	-- s({ trig = 'mk', name = 'inline math', dscr = 'Insert inline Math Environment.' }, {
	-- 	t('\\('),
	-- 	i(1),
	-- 	t('\\)'),
	-- 	d(2, smart_space, { 3 }),
	-- 	i(3),
	-- }),
	s({ trig = 'mk', name = 'inline math', dscr = 'Insert inline Math Environment.' }, {
		t('\\('),
		i(1),
		t('\\)'),
		i(0),
	}, {
		condition = tex.in_text,
		callbacks = {
			[-1] = { [events.leave] = appended_space_after_insert },
		},
	}),
	s(
		{ trig = 'dm', name = 'dispaly math', dscr = 'Insert display Math Environment.' },
		{ t { '\\[', '\t' }, i(1), t { '', '\\]' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),

	s({ trig = 'cref', name = '\\cref{}' }, { t('\\cref{'), i(1), t('}') }, { condition = tex.in_text }),
	s(
		{ trig = '(%w)//', name = 'fraction with a single numerator', regTrig = true },
		{ t('\\frac{'), f(function(_, snip)
			return snip.captures[1]
		end, {}), t('}{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '//', name = 'fraction' },
		{ t('\\frac{'), i(1), t('}{'), i(2), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '==', name = 'align equls', wordTrig = false },
		{ t { '&= ' }, i(1), t { ' \\\\', '' } },
		{ condition = tex.in_align }
	),

	s(
		{ trig = 'rij', name = '(x_n) n ∈ N' },
		{ t('('), i(1, 'x'), t('_'), i(2, 'n'), t(')_{'), rep(2), t('\\in '), i(3, '\\mathbb{N}'), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'rg', name = 'i = 1, ..., n' },
		{ i(1, 'i'), t(' = '), i(2, '1'), t(' \\dots, '), i(0, 'n') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'ls', name = 'a_1, ..., a_n' },
		{ i(1, 'a'), t('_{'), i(2, '1'), t('}, \\dots, '), rep(1), t('_{'), i(3, 'n'), t('}') },
		{ condition = tex.in_mathzone }
	),

	-- All arrows shortcuts
	s(
		{ trig = 'rmap', name = 'rational map arrow' },
		{ t { '\\ar@{-->}[' }, i(1), t { ']' } },
		{ condition = tex.in_xymatrix }
	),
	s(
		{ trig = 'emb', name = 'embeddeing map arrow' },
		{ t { '\\ar@{^{(}->}[' }, i(1), t { ']' } },
		{ condition = tex.in_xymatrix }
	),
	s(
		{ trig = 'rmap', wordTrig = false, name = 'dashrightarrow' },
		{ t('\\dashrightarrow ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'emb', wordTrig = false, name = 'embedding' },
		{ t('\\hookrightarrow ') },
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = '->', wordTrig = false, name = 'rightarrow -->' },
		{ t('\\longrightarrow ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '!>', wordTrig = false, name = 'mapsto' }, { t('\\mapsto ') }, { condition = tex.in_mathzone }),
	s({ trig = '=>', name = 'implies', wordTrig = false }, { t('\\implies ') }, { condition = tex.in_mathzone }),
	s({ trig = '=<', name = 'impliedby', wordTrig = false }, { t('\\impliedby ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'iff', name = 'if and only if <=>', wordTrig = false },
		{ t('\\iff ') },
		{ condition = tex.in_mathzone }
	),

	-- variations of brackets
	s(
		{ trig = 'bpm', name = 'pmatrix Environment' },
		{ t { '\\begin{pmatrix}', '\t' }, i(1), t { '', '\\end{pmatrix}' } },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'bbm', name = 'bmatrix Environment' },
		{ t { '\\begin{bmatrix}', '\t' }, i(1), t { '', '\\end{bmatrix}' } },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'cvec', name = 'column vector' }, {
		t { '\\begin{pmatrix}', '\t' },
		i(1, 'x'),
		t('}_'),
		i(2, '1'),
		t { '\\\\', '\\vdots \\\\', '' },
		rep(1),
		t('_'),
		i(3, 'n'),
		t { '', '\\end{pmatrix}' },
		i(0),
	}, { condition = tex.in_mathzone }),
	s(
		{ trig = 'lra', name = 'leftangle rightangle' },
		{ t { '\\left\\langle ' }, i(1), t { '\\right\\rangle' } },
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = 'beq', name = 'Equation Environment', dscr = 'Create an equation environment.' },
		{ t { '\\begin{equation}', '\t' }, i(1), t { '', '\\end{equation}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'bseq', name = 'Equation Environment without number', dscr = 'Create a star equation environment.' },
		{ t { '\\begin{equation*}', '\t' }, i(1), t { '', '\\end{equation*}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'proof', name = 'Proof Environment', dscr = 'Create a proof environment.' },
		{ t { '\\begin{proof}', '\t' }, i(0), t { '', '\\end{proof}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'thm', name = 'Theorem Environment', dscr = 'Create a theorem environment.' },
		{ t { '\\begin{theorem}', '\t' }, i(0), t { '', '\\end{theorem}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'lem', name = 'Lemma Environment', dscr = 'Create a lemma environment.' },
		{ t { '\\begin{lemma}', '\t' }, i(0), t { '', '\\end{lemma}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'def', name = 'Definition Environment', dscr = 'Create a definition environment.' },
		{ t { '\\begin{definition}', '\t' }, i(0), t { '', '\\end{definition}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'prop', name = 'Proposition Environment', dscr = 'Create a proposition environment.' },
		{ t { '\\begin{proposition}', '\t' }, i(0), t { '', '\\end{proposition}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'cor', name = 'Corollary Environment', dscr = 'Create a corollary environment.' },
		{ t { '\\begin{corollary}', '\t' }, i(0), t { '', '\\end{corollary}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'rem', name = 'Remark Environment', dscr = 'Create a remark environment.' },
		{ t { '\\begin{remark}', '\t' }, i(0), t { '', '\\end{remark}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'conj', name = 'Conjecture Environment', dscr = 'Create a conjecture environment.' },
		{ t { '\\begin{conjecture}', '\t' }, i(0), t { '', '\\end{conjecture}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),

	s(
		{ trig = 'lprf', name = 'Titled Proof', dscr = 'Create a titled proof environment.' },
		{ t('\\begin{proof}[Proof of \\cref{'), i(1), t { '}]', '\t' }, i(0), t { '', '\\end{proof}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s({
		trig = 'lthm',
		name = 'Theorem Environment with name and lable',
		dscr = 'Create a theorem environment with name and lable.',
	}, {
		t { '\\begin{theorem}[' },
		i(1),
		t { ']\\label{thm:' },
		l(l._1:gsub('[^%w]', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{theorem}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),
	s({
		trig = 'llem',
		name = 'Lemma Environment with name and lable',
		dscr = 'Create a lemma environment with name and lable.',
	}, {
		t { '\\begin{lemma}[' },
		i(1),
		t { ']\\label{lem:' },
		l(l._1:gsub('[^%w]', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{lemma}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),
	s({
		trig = 'ldef',
		name = 'Definition Environment with name and lable',
		dscr = 'Create a definition environment with name and lable.',
	}, {
		t { '\\begin{definition}[' },
		i(1),
		t { ']\\label{def:' },
		l(l._1:gsub('[^%w]', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{definition}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),
	s({
		trig = 'lprop',
		name = 'Proposition Environment with name and lable',
		dscr = 'Create a proposition environment with name and lable.',
	}, {
		t { '\\begin{proposition}[' },
		i(1),
		t { ']\\label{prop:' },
		l(l._1:gsub('[^%w]', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{proposition}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),
	s({
		trig = 'lcor',
		name = 'Corollary Environment with name and lable',
		dscr = 'Create a corollary environment with name and lable.',
	}, {
		t { '\\begin{corollary}[' },
		i(1),
		t { ']\\label{cor:' },
		l(l._1:gsub('[^%w]', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{corollary}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),
	s({
		trig = 'lrem',
		name = 'Remark Environment with name and lable',
		dscr = 'Create a remark environment with name and lable.',
	}, {
		t { '\\begin{remark}[' },
		i(1),
		t { ']\\label{rem:' },
		l(l._1:gsub('[^%w]', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{remark}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),
	s({
		trig = 'lconj',
		name = 'Conjecture Environment with name and lable',
		dscr = 'Create a conjecture environment with name and lable.',
	}, {
		t { '\\begin{conjecture}[' },
		i(1),
		t { ']\\label{conj:' },
		l(l._1:gsub('[^%w]', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{conjecture}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),

	s(
		{ trig = 'xym', name = 'xymatrix Environment', dscr = 'Create a xymatrix environment.' },
		{ t { '\\[', '\t\\xymatrix{', '\t' }, i(1), t { ' \\\\', '\t}', '\\]' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'bal', name = 'Align Environment', dscr = 'Create an align environment' },
		{ t { '\\begin{align}', '\t' }, i(1), t { '', '\\end{align}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'bsal', name = 'Align without a number', dscr = 'Create an align environment without number' },
		{ t { '\\begin{align*}', '\t' }, i(1), t { '', '\\end{align*}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'bit', name = 'Itemize Environment', dscr = 'Create an itemize environment' },
		{ t { '\\begin{itemize}', '\t\\item ' }, i(1), d(2, rec_ls, {}), t { '', '\\end{itemize}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s(
		{ trig = 'ben', name = 'Enumerate Environment' },
		{ t { '\\begin{enumerate}', '\t\\item ' }, i(1), d(2, rec_ls, {}), t { '', '\\end{enumerate}' } },
		{ condition = pipe { conds.line_begin, tex.in_text } }
	),
	s({ trig = 'lben', name = 'Enumerate with labels' }, {
		t { '\\begin{enumerate}[label=(\\' },
		c(1, {
			t('alph'),
			t('roman'),
			t('arabic'),
		}),
		t { '*)]', '\t\\item ' },
		i(2),
		d(3, rec_ls, {}),
		t { '', '\\end{enumerate}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),
	s({ trig = 'bfr', name = 'Beamer Frame Environment' }, {
		t { '\\begin{frame}', '\t\\frametitle{' },
		i(1, 'frame title'),
		t { '}', '\t' },
		i(0),
		t { '', '\\end{frame}' },
	}, { condition = pipe { conds.line_begin, tex.in_beamer, tex.in_text } }),
	s(
		{ trig = 'bcor', name = 'Beamer Corollary Environment' },
		{ t { '\\begin{block}{Corollary}', '\t' }, i(0), t { '', '\\end{block}' } },
		{ condition = pipe { conds.line_begin, tex.in_beamer, tex.in_text } }
	),
	s(
		{ trig = 'bdef', name = 'Beamer Definition Environment' },
		{ t { '\\begin{block}{Definition}', '\t' }, i(0), t { '', '\\end{block}' } },
		{ condition = pipe { conds.line_begin, tex.in_beamer, tex.in_text } }
	),
	s(
		{ trig = 'brem', name = 'Beamer Remark Environment' },
		{ t { '\\begin{block}{Remark}', '\t' }, i(0), t { '', '\\end{block}' } },
		{ condition = pipe { conds.line_begin, tex.in_beamer, tex.in_text } }
	),
	s({ trig = 'bfu', name = 'function' }, {
		t { '\\begin{equation*}', '\t' },
		i(1),
		t('\\colon '),
		i(2),
		t('\\longrightarrow '),
		i(3),
		t(', \\quad '),
		i(4),
		t('\\longmapsto '),
		rep(1),
		t('('),
		rep(4),
		t(') = '),
		i(0),
		t { '', '\\end{equation*}' },
	}, { condition = pipe { conds.line_begin, tex.in_text } }),

	s(
		{ trig = 'tt', wordTrig = false, name = 'text' },
		{ t('\\text{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'tss', wordTrig = false, name = 'text subscript' },
		{ t('_{\\mathrm{'), i(1), t('}}') },
		{ condition = tex.in_mathzone }
	),

	-- math symbols
	s({
		trig = '([%a])(%d)',
		name = 'auto subscript 1',
		dscr = 'Subscript with a single number.',
		wordTrig = false,
		regTrig = true,
	}, {
		f(function(_, snip)
			return string.format('%s_%s', snip.captures[1], snip.captures[2])
		end, {}),
	}, { condition = tex.in_mathzone }),
	s({ trig = '(%a)_(%d%d)', name = 'auto subscript 2', dscr = 'Subscript with two numbers.', regTrig = true }, {
		f(function(_, snip)
			return string.format('%s_{%s}', snip.captures[1], snip.captures[2])
		end, {}),
	}, { condition = tex.in_mathzone }),

	s({ trig = 'inn', name = 'belongs to ∈', wordTrig = false }, { t('\\in ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '!in', name = 'does not belong to ∉', wordTrig = false },
		{ t('\\notin ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '!=', name = 'not equal ≠', wordTrig = false }, { t('\\neq ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '<=', name = 'less than or equal to ≤', wordTrig = false },
		{ t('\\leq ') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '>=', name = 'greater than or equal to ≥', wordTrig = false },
		{ t('\\geq ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '<<', name = 'much less than ≪', wordTrig = false }, { t('\\ll ') }, {
		condition = tex.in_mathzone,
	}),
	s(
		{ trig = '>>', name = 'much greater than ≫', wordTrig = false },
		{ t('\\gg ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '~~', name = 'similar ~', wordTrig = false }, { t('\\sim ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '~=', name = 'is isomorphic to ≃', wordTrig = false },
		{ t('\\simeq ') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'nvs', name = 'inverse', wordTrig = false }, { t('^{-1}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '^-', name = 'negative exponents', wordTrig = false },
		{ t('^{-'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'sq', name = 'square root' }, { t('\\sqrt{'), i(1), t('}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '__', name = 'subscript', wordTrig = false },
		{ t('_{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '^^', name = 'supscript', wordTrig = false },
		{ t('^{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = '**', name = 'upper star *', wordTrig = false }, { t('^{*}') }, { condition = tex.in_mathzone }),
	s({ trig = '...', name = 'dots ...', wordTrig = false }, { t('\\dots') }, { condition = tex.in_mathzone }),
	s({ trig = '||', name = 'mid |', wordTrig = false }, { t('\\mid ') }, { condition = tex.in_mathzone }),
	s({ trig = '::', name = 'colon :', wordTrig = false }, { t('\\colon ') }, { condition = tex.in_mathzone }),
	s({ trig = ':=', name = 'coloneqq :=', wordTrig = false }, { t('\\coloneqq ') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'rup', name = 'round up', wordTrig = false },
		{ t('\\rup{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'rwn', name = 'round down', wordTrig = false },
		{ t('\\rdown{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),

	s({ trig = 'lll', wordTrig = false, name = 'ell ℓ' }, { t('\\ell') }, { condition = tex.in_mathzone }),
	s({ trig = 'xx', wordTrig = false, name = 'times ×' }, { t('\\times') }, { condition = tex.in_mathzone }),
	s({ trig = 'nabl', wordTrig = false, name = 'nabla ∇' }, { t('\\nabla') }, { condition = tex.in_mathzone }),
	s({ trig = 'AA', wordTrig = false, name = 'affine 𝔸' }, { t('\\mathbb{A}') }, { condition = tex.in_mathzone }),
	s({ trig = 'CC', wordTrig = false, name = 'complex ℂ' }, { t('\\mathbb{C}') }, { condition = tex.in_mathzone }),
	s({ trig = 'DD', wordTrig = false, name = 'disc 𝔻' }, { t('\\mathbb{D}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'FF', wordTrig = false, name = 'Hirzebruch 𝔽' },
		{ t('\\mathbb{F}') },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = 'HH', wordTrig = false, name = 'half plane ℍ' },
		{ t('\\mathbb{H}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'NN', wordTrig = false, name = 'natural ℕ' }, { t('\\mathbb{N}') }, { condition = tex.in_mathzone }),
	s({ trig = 'OO', wordTrig = false, name = 'mathcal{O}' }, { t('\\mathcal{O}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'PP', wordTrig = false, name = 'projective ℙ' },
		{ t('\\mathbb{P}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'QQ', wordTrig = false, name = 'rational ℚ' }, { t('\\mathbb{Q}') }, {
		condition = tex.in_mathzone,
	}),
	s({ trig = 'RR', wordTrig = false, name = 'real ℝ' }, { t('\\mathbb{R}') }, { condition = tex.in_mathzone }),
	s({ trig = 'ZZ', wordTrig = false, name = 'integer ℤ' }, { t('\\mathbb{Z}') }, { condition = tex.in_mathzone }),
	s(
		{ trig = 'srt', wordTrig = false, name = 'square root' },
		{ t('\\sqrt{'), i(1), t('}') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = 'set', name = 'set' }, { t('\\{'), i(1), t('\\}') }, { condition = tex.in_mathzone }),
	s({ trig = 'o+', wordTrig = false, name = 'oplus' }, { t('\\oplus') }, { condition = tex.in_mathzone }),
	s({ trig = 'ox', wordTrig = false, name = 'otimes' }, { t('\\otimes') }, { condition = tex.in_mathzone }),
	s({ trig = 'cap', wordTrig = false, name = 'cap' }, { t('\\cap ') }, { condition = tex.in_mathzone }),
	s({ trig = 'cup', wordTrig = false, name = 'cup' }, { t('\\cup ') }, { condition = tex.in_mathzone }),
	s({ trig = 'nnn', wordTrig = false, name = 'bigcup' }, { t('\\bigcup') }, { condition = tex.in_mathzone }),
	s({ trig = 'uuu', wordTrig = false, name = 'bigcap' }, { t('\\bigcap') }, { condition = tex.in_mathzone }),

	-- notations which are often used in math
	s({ trig = 'MK', name = 'Mori-Kleiman cone' }, { t('\\cNE('), i(1), t(')') }, { condition = tex.in_mathzone }),
	s(
		{ trig = '([QRZ])P', name = 'positive', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\mathbb{' .. snip.captures[1] .. '}^{>0}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '([QRZ])N', name = 'negative', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\mathbb{' .. snip.captures[1] .. '}^{<0}'
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = '([qr])le', name = 'linearly equivalent', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\sim_{\\mathbb{' .. string.upper(snip.captures[1]) .. '}} '
		end, {}) },
		{ condition = tex.in_mathzone }
	),
}

snips = {
	-- priority 1:
	s(
		{ trig = 'c(%u)', name = 'mathcal', wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return '\\mathcal{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'f(%a)', name = 'mathfrak', wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return '\\mathfrak{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 's(%u)', name = 'mathscr', wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return '\\mathscr{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	-- priority 0:

	-- variations of brackets
	s(
		{ trig = 'lr', name = 'left( right)' },
		{ t { '\\left( ' }, i(1), t { '\\right)' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr(', name = 'left( right)' },
		{ t { '\\left( ' }, i(1), t { '\\right)' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr|', name = 'leftvert rightvert' },
		{ t { '\\left\\lvert ' }, i(1), t { '\\right\\lvert' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr{', name = 'left\\{ right\\}' },
		{ t { '\\left\\{ ' }, i(1), t { '\\right\\}' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lrb', name = 'left\\{ right\\}' },
		{ t { '\\left\\{ ' }, i(1), t { '\\right\\}' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lr[', name = 'left[ right]' },
		{ t { '\\left[ ' }, i(1), t { '\\right]' } },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	-- General text styling like bold and so on
	s(
		{ trig = 'bf', name = 'bold', dscr = 'Insert bold text.' },
		{ t('\\textbf{'), i(1), t('}') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = 'it', name = 'italic', dscr = 'Insert italic text.' },
		{ t('\\textit{'), i(1), t('}') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = 'em', name = 'emphasize', dscr = 'Insert emphasize text.' },
		{ t('\\emph{'), i(1), t('}') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),
	s(
		{ trig = 'ni', name = 'non-indented paragraph', dscr = 'Insert non-indented paragraph.' },
		{ t { '\\noindent', '' } },
		{ condition = pipe { conds.line_begin, tex.in_text }, show_condition = tex.in_text }
	),
	s(
		{ trig = 'cite', name = '\\cite[]{}' },
		{ t('\\cite['), i(1), t(']{'), i(2), t('}') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),

	-- All kind of sections
	s({ trig = 'cha', name = 'Chapter', dscr = 'Insert a new chapter.' }, {
		t { '\\chapter{' },
		i(1),
		t { '}\\label{cha:' },
		l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '', '' },
		i(0),
	}, { condition = conds.line_begin }),
	s({ trig = 'sec', name = 'Section', dscr = 'Insert a new section.', regTrig = true }, {
		t { '\\section{' },
		i(1),
		t { '}\\label{sec:' },
		l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '', '' },
		i(0),
	}, { condition = conds.line_begin }),
	s({ trig = 'ssec', name = 'star Section', dscr = 'Insert a section without index.', regTrig = true }, {
		t { '\\section*{' },
		i(1),
		t { '}\\label{sec:' },
		l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '', '' },
		i(0),
	}, { condition = conds.line_begin }),
	s({ trig = 'sub', name = 'subSection', dscr = 'Insert a new subsection.', regTrig = true }, {
		t { '\\subsection{' },
		i(1),
		t { '}\\label{sub:' },
		l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '', '' },
		i(0),
	}, { condition = conds.line_begin }),
	s({ trig = 'ssub', name = 'star subSection', dscr = 'Insert a subsection without index.', regTrig = true }, {
		t { '\\subsection*{' },
		i(1),
		t { '}\\label{sub:' },
		l(l._1:gsub('[^%w]+', '_'):gsub('_*$', ''):lower(), 1),
		t { '}', '', '' },
		i(0),
	}, { condition = conds.line_begin }),

	s(
		{ trig = '/', name = 'fraction', dscr = 'Insert a fraction notation.', wordTrig = false },
		{ t('\\frac{'), i(1), t('}{'), i(2), t('}') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = 'sum', name = 'sum', dscr = 'Insert a sum notation.' },
		{ t('\\sum_{'), i(1), t('}^{'), i(2), t('}'), i(3) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'lim', name = 'limit', dscr = 'Insert a limit notation.' },
		{ t('\\lim_{'), i(1, 'n'), t('\\to '), i(2, '\\infty'), t('} ') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'limsup', name = 'limsup', dscr = 'Insert a limit superior notation.' },
		{ t('\\limsup_{'), i(1, 'n'), t('\\to '), i(2, '\\infty'), t('} ') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = 'prod', name = 'product', dscr = 'Insert a product notation.' },
		{ t('\\prod_{'), i(1, 'n'), t('='), i(2, '1'), t('}^{'), i(3, '\\infty'), t('}'), i(4), t(' ') },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = 'pha', name = 'sum', dscr = 'Insert a sum notation.' },
		{ t('&\\phantom{\\;=\\;} ') },
		{ condition = pipe { conds.line_begin, tex.in_mathzone }, show_condition = tex.in_mathzone }
	),

	-- phrases which are often used
	s(
		{ trig = 'ses', name = 'short exact sequence', dscr = 'text: short exact sequence.' },
		{ t('short exact sequence') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),

	s(
		{ trig = 'klt', name = 'Kawamata log terminal', dscr = 'text: Kawamata log terminal.' },
		{ t('Kawamata log terminal') },
		{ condition = tex.in_text, show_condition = tex.in_text }
	),

	-- cycle change sequences
	-- s(
	-- 	{ trig = 'spaceseq', name = 'set a white space', dscr = 'Select from 3/4/5/normal/18/36/-3mu.' },
	-- 	{ c(1, { t('\\, '), t('\\: '), t('\\; '), t('\\  '), t('\\quad '), t('\\qquad '), t('\\! ') }) },
	-- 	{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	-- ),
	-- s({
	-- 	trig = 'larrowseq',
	-- 	name = 'set a left arrow',
	-- 	dscr = 'leftarrow\nlongleftarrow\nLeftarrow\nLongleftarrow\nxleftarrow',
	-- }, {
	-- 	c(1, { t('\\leftarrow '), t('\\longleftarrow '), t('\\Leftarrow '), t('\\Longleftarrow '), t('\\xleftarrow ') }),
	-- 	i(0),
	-- }, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),
	-- s({
	-- 	trig = 'rarrowseq',
	-- 	name = 'set a right arrow',
	-- 	dscr = 'rightarrow\nlongrightarrow\nRightarrow\nLongrightarrow\nxrightarrow',
	-- }, {
	-- 	c(
	-- 		1,
	-- 		{ t('\\rightarrow '), t('\\longrightarrow '), t('\\Rightarrow '), t('\\Longrightarrow '), t('\\xrightarrow ') }
	-- 	),
	-- 	i(0),
	-- }, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),
	-- s({
	-- 	trig = 'ltrarrowseq',
	-- 	name = 'set a left to right arrow',
	-- 	dscr = '\nleftrightarrow\nlongleftrightarrow\nLeftrightarrow\nLongleftrightarrow\nxleftrightarrow',
	-- }, {
	-- 	c(1, {
	-- 		t('\\leftrightarrow '),
	-- 		t('\\longleftrightarrow '),
	-- 		t('\\Leftrightarrow '),
	-- 		t('\\Longleftrightarrow '),
	-- 		t('\\iff '),
	-- 	}),
	-- 	i(0),
	-- }, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),
	-- s({
	-- 	trig = 'fontseq',
	-- 	name = 'set a font size',
	-- 	dscr = 'tiny\nscriptsize\nfootnotesize\nsmall\nnormalsize\nlarge\nLarge\nLARGE\nhuge\nHuge',
	-- }, {
	-- 	c(1, {
	-- 		t('\\tiny '),
	-- 		t('\\scriptsize '),
	-- 		t('\\footnotesize '),
	-- 		t('\\small '),
	-- 		t('\\normalsize '),
	-- 		t('\\large '),
	-- 		t('\\Large '),
	-- 		t('\\LARGE '),
	-- 		t('\\huge '),
	-- 		t('\\Huge '),
	-- 	}),
	-- 	i(0),
	-- }, { condition = tex.in_mathzone, show_condition = tex.in_mathzone }),

	s({ trig = 'onic template', dscr = 'Use the basic template' }, {
		t {
			'\\documentclass{article}',
			'\\input{~/Tex/preamble_pac}',
			'',
			'% Bibtex KEEP THIS ORDER',
			'\\usepackage[colorlinks]{hyperref}',
			'\\usepackage[alphabetic]{amsrefs}',
			'\\usepackage[capitalise]{cleveref}',
			'',
			'\\input{~/Tex/preamble_env}',
			'\\input{~/Tex/preamble_cmd}',
			'',
			'% Pagestyle',
			'\\pagestyle{headings}',
			'\\linespread{1.3}',
			'',
			'% Title, authors',
			'\\title{',
		},
		i(1),
		t {
			'}',
			'% \\author{}',
			'',
			'% The main document',
			'',
			'\\begin{document}',
			'',
			'',
		},
		i(0),
		t {
			'',
			'',
			'\\end{document}',
		},
	}, { condition = pipe { tex.on_top, conds.line_begin }, show_condition = tex.on_top }),
	s({ trig = 'temps', name = 'Slides template', dscr = 'Use the slides template' }, {
		t {
			'\\documentclass[8pt]{beamer}',
			'\\input{~/Tex/preamble_pac}',
			'\\input{~/Tex/preamble_env}',
			'\\input{~/Tex/preamble_cmd}',
			'',
			'% Setup appearance:',
			'\\usetheme{CambridgeUS}',
			'\\usecolortheme{dolphin}',
			'\\usefonttheme[onlylarge]{structurebold}',
			'\\setbeamerfont*{frametitle}{size=\\normalsize,series=\\bfseries}',
			'\\setbeamertemplate{navigation symbols}{}',
			'\\setbeamertemplate{enumerate items}[square]',
			'',
			'\\linespread{1.2}',
			'',
			'% Standard packages',
			'\\usepackage{times}',
			'',
			'% Author, Title, etc.',
			'',
			'\\title[short title]{long}',
			'\\author{Jia Jia}',
			'\\institute[short institute]{long institute}',
			'\\date{\\today}',
			'',
			'% The main document',
			'',
			'\\begin{document}',
			'\\frame{\\titlepage}',
			'',
			'%',
			'',
			'\\section{Introduction}',
			'',
			'\\begin{frame}',
			'\\frametitle{Introduction}',
			'',
			'',
		},
		i(0),
		t {
			'',
			'',
			'\\end{frame}',
			'',
			'%',
			'',
			'\\section{Main Results}',
			'',
			'%',
			'',
			'\\section{Question?}',
			'',
			'\\end{document}',
		},
	}, { condition = pipe { tex.on_top, conds.line_begin }, show_condition = tex.on_top }),
	s({ trig = 'tempa', name = 'AMS template', dscr = 'Use the AMS template' }, {
		t {
			'\\documentclass[11pt]{amsart}',
			'',
			'% Standard',
			'\\usepackage{amsmath}',
			'\\usepackage{amssymb}',
			'\\usepackage{amsthm}',
			'\\usepackage{enumitem}',
			'\\usepackage[T1]{fontenc}',
			'\\usepackage{mathtools}',
			'\\usepackage{microtype}',
			'\\usepackage{xcolor}',
			'\\usepackage[all,cmtip]{xy}',
			'',
			'% BibLaTeX',
			'% \\usepackage[',
			'%   backend=biber,',
			'%   style=alphabetic,',
			'%   sorting=ynt,',
			'%   doi=false,',
			'%   isbn=false,',
			'%   url=false',
			'% ]{biblatex}',
			'% \\addbibresource{~/Tex/mathjiajia.bib}',
			'\\usepackage[colorlinks,',
			'	linkcolor=blue,',
			'	anchorcolor=blue,',
			'	citecolor=green',
			']{hyperref}',
			'\\usepackage[capitalise]{cleveref}',
			'',
			'% Pagestyle',
			'% \\pagestyle{headings}',
			'% \\linespread{1.3}',
			'',
			'% Geometry',
			'% \\setlength{\\topmargin}{0cm}',
			'% \\setlength{\\oddsidemargin}{0cm}',
			'% \\setlength{\\evensidemargin}{0cm}',
			'% \\setlength{\\marginparwidth}{0cm}',
			'% \\setlength{\\marginparsep}{0cm}',
			'',
			'% \\setlength{\\textheight}{\\paperheight-2in-35pt}',
			'% \\setlength{\\textwidth}{\\paperwidth-2in}',
			'% \\setlength{\\headheight}{12.5pt}',
			'% \\setlength{\\headsep}{25pt}',
			'% \\setlength{\\footskip}{30pt}',
			'',
			'% Environments.',
			'\\theoremstyle{plain}',
			'\\newtheorem{theorem}{Theorem}[section]',
			'\\newtheorem{axiom}[theorem]{Axiom}',
			'\\newtheorem{conjecture}[theorem]{Conjecture}',
			'\\newtheorem{corollary}[theorem]{Corollary}',
			'\\newtheorem{hypothesis}[theorem]{Hypothesis}',
			'\\newtheorem{lemma}[theorem]{Lemma}',
			'\\newtheorem{proposition}[theorem]{Proposition}',
			'',
			'\\theoremstyle{definition}',
			'\\newtheorem{definition}[theorem]{Definition}',
			'\\newtheorem{assumption}[theorem]{Assumption}',
			'\\newtheorem{example}[theorem]{Example}',
			'\\newtheorem{question}[theorem]{Question}',
			'\\newtheorem*{ack}{Acknowledgment}',
			'\\newtheorem*{mainthm}{Main Theorem}',
			'',
			'\\theoremstyle{remark}',
			'\\newtheorem{claim}[theorem]{Claim}',
			'\\newtheorem{notation}[theorem]{Notation}',
			'\\newtheorem{fact}[theorem]{Fact}',
			'\\newtheorem{remark}[theorem]{Remark}',
			'\\newtheorem{setup}[theorem]{}',
			'\\newtheorem*{remark*}{Remark}',
			'\\newtheorem*{notation*}{Notation and Terminology}',
			'',
			'\\numberwithin{equation}{section}',
			'',
			'% Commands',
			'',
			'% Algebra',
			'\\DeclareMathOperator{\\Ann}{Ann}',
			'\\DeclareMathOperator{\\Ass}{Ass}',
			'\\DeclareMathOperator{\\Aut}{Aut}',
			'\\DeclareMathOperator{\\Frac}{Frac}',
			'\\DeclareMathOperator{\\HN}{HN}',
			'\\DeclareMathOperator{\\Span}{Span}',
			'\\DeclareMathOperator{\\Sym}{Sym}',
			'\\DeclareMathOperator{\\Tr}{Tr} % trace',
			'\\DeclareMathOperator{\\coeff}{coeff}',
			'\\DeclareMathOperator{\\length}{length}',
			'\\DeclareMathOperator{\\mult}{mult}',
			'\\DeclareMathOperator{\\ord}{ord}',
			'\\DeclareMathOperator{\\rank}{rank}',
			'\\DeclareMathOperator{\\rk}{rk}',
			'\\DeclareMathOperator{\\sign}{sign}',
			'\\DeclareMathOperator{\\trdeg}{tr.deg}',
			'',
			'% Groups',
			'\\DeclareMathOperator{\\GL}{GL}',
			'\\DeclareMathOperator{\\Gal}{Gal}',
			'\\DeclareMathOperator{\\PGL}{PGL}',
			'\\DeclareMathOperator{\\PSL}{PSL}',
			'\\DeclareMathOperator{\\SL}{SL}',
			'',
			'% Homological Algebra',
			'\\DeclareMathOperator{\\coker}{coker}',
			'\\DeclareMathOperator{\\Ext}{Ext}',
			'\\DeclareMathOperator{\\Hm}{H} % homology/cohomology',
			'\\DeclareMathOperator{\\Hom}{Hom}',
			'\\DeclareMathOperator{\\SExt}{\\mathcal{E}\\!\\mathit{xt}}',
			'\\DeclareMathOperator{\\SHom}{\\mathcal{H}\\!\\mathit{om}}',
			'\\DeclareMathOperator{\\Tor}{Tor}',
			'\\DeclareMathOperator{\\id}{id}',
			'\\DeclareMathOperator{\\im}{Im} % image',
			'',
			'\\DeclarePairedDelimiter{\\abs}{\\lvert}{\\rvert}',
			'\\DeclarePairedDelimiter{\\norm}{\\lVert}{\\rVert}',
			'',
			'% Geometry',
			'\\DeclareMathOperator{\\Alb}{Alb}',
			'\\DeclareMathOperator{\\Amp}{Amp}',
			'\\DeclareMathOperator{\\Bir}{Bir}',
			'\\DeclareMathOperator{\\Bs}{Bs}',
			'\\DeclareMathOperator{\\CH}{CH}',
			'\\DeclareMathOperator{\\Chow}{Chow}',
			'\\DeclareMathOperator{\\Cl}{Cl}',
			'\\DeclareMathOperator{\\Diff}{Diff}',
			'\\DeclareMathOperator{\\Div}{Div}',
			'\\DeclareMathOperator{\\End}{End}',
			'\\DeclareMathOperator{\\Exc}{Exc}',
			'\\DeclareMathOperator{\\Fix}{Fix}',
			'\\DeclareMathOperator{\\Grass}{Grass}',
			'\\DeclareMathOperator{\\Nklt}{Nklt}',
			'\\DeclareMathOperator{\\Pic}{Pic}',
			'\\DeclareMathOperator{\\Proj}{Proj}',
			'\\DeclareMathOperator{\\Res}{Res}',
			'\\DeclareMathOperator{\\SBs}{SBs}',
			'\\DeclareMathOperator{\\SEnd}{SEnd}',
			'\\DeclareMathOperator{\\Sing}{Sing}',
			'\\DeclareMathOperator{\\Spec}{Spec} % Spectrum',
			'\\DeclareMathOperator{\\Supp}{Supp} % Support',
			'\\DeclareMathOperator{\\Val}{Val}',
			'\\DeclareMathOperator{\\Vol}{Vol}',
			'\\DeclareMathOperator{\\ch}{ch}',
			'\\DeclareMathOperator{\\codim}{codim}',
			'\\DeclareMathOperator{\\discrep}{discrep} % discrepancy',
			'\\DeclareMathOperator{\\lct}{lct}',
			'\\DeclareMathOperator{\\td}{td}',
			'\\DeclareMathOperator{\\var}{\\mathcal{Var}}',
			'',
			'\\DeclarePairedDelimiterX{\\pair}[2]{\\langle}{\\rangle}{#1,#2}',
			'',
			'% Cones',
			'\\DeclareMathOperator{\\Nef}{Nef}',
			'\\DeclareMathOperator{\\NE}{NE}',
			'\\DeclareMathOperator{\\cNE}{\\overline{NE}} % Mori cone',
			'\\DeclareMathOperator{\\NS}{NS}',
			'\\DeclareMathOperator{\\Mob}{Mob}',
			'\\DeclareMathOperator{\\Mov}{Mov}',
			'\\DeclareMathOperator{\\PE}{PE}',
			'',
			'% Stacks/spaces',
			'\\DeclareMathOperator{\\Coh}{\\mathcal{C}\\!\\mathit{oh}} % Cohstack',
			'\\DeclareMathOperator{\\Hilb}{Hilb}',
			'\\DeclareMathOperator{\\QCoh}{\\mathcal{QC}\\!\\mathit{oh}} % QCohstack',
			'\\DeclareMathOperator{\\Quot}{Quot} % Quotfunctor',
			'',
			'% Categorical Term',
			'\\DeclareMathOperator{\\Mor}{Mor} % Morphisms',
			'\\DeclareMathOperator{\\Obj}{Ob} % Objects',
			'\\DeclareMathOperator{\\op}{op}',
			'',
			'\\newcommand{\\indlim}{\\ensuremath{\\underrightarrow{\\lim}}}',
			'\\newcommand{\\prolim}{\\ensuremath{\\underleftarrow{\\lim}}}',
			'',
			'% General things...',
			'\\newcommand{\\Romannum}[1]{\\uppercase\\expandafter{\\romannumeral #1}}',
			'\\newcommand{\\romannum}[1]{\\romannumeral #1\\relax}',
			'',
			'\\DeclarePairedDelimiter{\\rup}{\\lceil}{\\rceil}',
			'\\DeclarePairedDelimiter{\\rdown}{\\lfloor}{\\rfloor}',
			'',
			'% Author, Title, etc.',
			'\\title[short title]',
			'{long title}',
			'\\author{Jia Jia}',
			'',
			'\\address{',
			'National University of Singapore,',
			'Singapore 119076,',
			'Republic of Singapore',
			'}',
			'',
			'\\email{jia\\_jia@u.nus.edu}',
			'',
			'% \\date{\\today}',
			'',
			'\\subjclass[2020]{',
			'% 37P55, % Arithmetic dynamics on general algebraic varieties',
			'% 14G05, % Rational points',
			'% 14E30, % Minimal model program (Mori theory, extremal rays)',
			'% 08A35. % Automorphisms and endomorphisms of algebraic structures',
			'}',
			'\\keywords{keywords}',
			'',
			'\\begin{document}',
			'',
			'\\begin{abstract}',
			'abstract',
			'\\end{abstract}',
			'',
			'\\maketitle',
			'\\tableofcontents',
			'',
			'%',
			'%',
			'\\section{Introduction}\\label{sec:introduction}',
			'%',
			'%',
			'',
			'',
		},
		i(0),
		t {
			'',
			'',
			'% References',
			'',
			'% \\printbibliography{}',
			'',
			'\\end{document}',
		},
	}, { condition = pipe { tex.on_top, conds.line_begin }, show_condition = tex.on_top }),
	s({ trig = 'tempr', name = 'report template' }, {
		t {
			'',
			'% version 15 January 2022',
			'',
			'\\documentclass[11pt,a4paper]{amsart}',
			'',
			'\\input{~/Tex/preamble_pac}',
			'',
			'% BibLaTeX',
			'% \\usepackage[',
			'%   backend=biber,',
			'%   style=alphabetic,',
			'%   sorting=ynt,',
			'%   doi=false,',
			'%   isbn=false,',
			'%   url=false',
			'% ]{biblatex}',
			'% \\addbibresource{~/Tex/mathjiajia.bib}',
			'\\usepackage[colorlinks,',
			'	linkcolor=blue,',
			'	anchorcolor=blue,',
			'	citecolor=green',
			']{hyperref}',
			'\\usepackage[capitalise]{cleveref}',
			'',
			'\\setlength{\\topmargin}{0cm}',
			'\\setlength{\\oddsidemargin}{0cm}',
			'\\setlength{\\evensidemargin}{0cm}',
			'\\setlength{\\marginparwidth}{0cm}',
			'\\setlength{\\marginparsep}{0cm}',
			'',
			'\\setlength{\\textheight}{\\paperheight-2in-35pt}',
			'\\setlength{\\textwidth}{\\paperwidth-2in}',
			'\\setlength{\\headheight}{12.5pt}',
			'\\setlength{\\headsep}{25pt}',
			'\\setlength{\\footskip}{30pt}',
			'',
			'\\linespread{1.3}',
			'\\pagestyle{headings}',
			'',
			'\\input{~/Tex/preamble_env}',
			'\\input{~/Tex/preamble_cmd}',
			'',
			'\\begin{document}',
			'',
			'\\title{Answers to  queries of the referee}',
			'',
			'\\maketitle',
			'',
			'Many thanks to the referee for very careful reading, critical questions, and the valuable suggestions',
			'to improve the paper.',
			'The following are the main changes based on the suggestions.',
			'',
			'\\par \\vskip 1pc',
			'\\textbf{Changes according to the comments of the referee:}',
			'',
			'{\\color{blue}(1)}.',
			'',
		},
		i(0),
		t {
			'',
			'',
			'\\normalsize',
			'\\textbf{Revision}:',
			'',
			'\\par \\vskip 1pc',
			'	{\\color{blue}(2)}.',
			'',
			'',
			'% References',
			'',
			'% \\printbibliography{}',
			'',
			'\\end{document}',
		},
	}, { condition = pipe { tex.on_top, conds.line_begin }, show_condition = tex.on_top }),
}

return snips, autosnips
