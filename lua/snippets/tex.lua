local M = {}

local ls = require('luasnip')

-- some shorthands...
-- some shorthands...
local s = ls.snippet
-- local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
local l = require('luasnip.extras').lambda
-- local rep = require('luasnip.extras').rep
-- local p = require("luasnip.extras").partial
-- local m = require("luasnip.extras").match
-- local n = require("luasnip.extras").nonempty
-- local dl = require("luasnip.extras").dynamic_lambda
-- local fmt = require("luasnip.extras.fmt").fmt
-- local fmta = require("luasnip.extras.fmt").fmta
-- local types = require("luasnip.util.types")
local conds = require('luasnip.extras.expand_conditions')

local vimtex = {}
vimtex.in_mathzone = function()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
vimtex.in_text = function()
	return not vimtex.in_mathzone()
end
-- vimtex.in_comment = function()
-- 	return vim.fn['vimtex#syntax#in_comment']() == 1
-- end
-- vimtex.in_beamer = function()
-- 	return vim.b.vimtex['documentclass'] == 'beamer'
-- end
-- vimtex.env_align = function()
-- 	local x, y = unpack(vim.eval('vimtex#env#is_inside("align")'))
-- 	return x ~= '0' and y ~= '0'
-- end

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

M = {
	-- priority 1:
	s(
		{ trig = 'c(%u)', name = 'mathcal', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\mathcal{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),
	s(
		{ trig = 'f(%a)', name = 'mathfrak', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\mathfrak{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),
	s(
		{ trig = 's(%u)', name = 'mathscr', wordTrig = false, regTrig = true },
		{ f(function(_, snip)
			return '\\mathscr{' .. snip.captures[1] .. '}'
		end, {}) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),

	-- priority 0:

	-- variations of brackets
	s(
		{ trig = 'lr', name = 'left( right)' },
		{ t { '\\left( ' }, i(1), t { '\\right)' }, i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),
	s(
		{ trig = 'lr(', name = 'left( right)' },
		{ t { '\\left( ' }, i(1), t { '\\right)' }, i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),
	s(
		{ trig = 'lr|', name = 'leftvert rightvert' },
		{ t { '\\left\\lvert ' }, i(1), t { '\\right\\lvert' }, i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),
	s(
		{ trig = 'lr{', name = 'left\\{ right\\}' },
		{ t { '\\left\\{ ' }, i(1), t { '\\right\\}' }, i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),
	s(
		{ trig = 'lrb', name = 'left\\{ right\\}' },
		{ t { '\\left\\{ ' }, i(1), t { '\\right\\}' }, i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),
	s(
		{ trig = 'lr[', name = 'left[ right]' },
		{ t { '\\left[ ' }, i(1), t { '\\right]' }, i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),

	-- General text styling like bold and so on
	s(
		{ trig = 'bf', name = 'bold', dscr = 'Insert bold text.' },
		{ t('\\textbf{'), i(1), t('}'), i(0) },
		{ condition = vimtex.in_text, show_condition = vimtex.in_text }
	),
	s(
		{ trig = 'it', name = 'italic', dscr = 'Insert italic text.' },
		{ t('\\textit{'), i(1), t('}'), i(0) },
		{ condition = vimtex.in_text, show_condition = vimtex.in_text }
	),
	s(
		{ trig = 'em', name = 'emphasize', dscr = 'Insert emphasize text.' },
		{ t('\\emph{'), i(1), t('}'), i(0) },
		{ condition = vimtex.in_text, show_condition = vimtex.in_text }
	),
	s(
		{ trig = 'ni', name = 'non-indented paragraph', dscr = 'Insert non-indented paragraph.' },
		{ t { '\\noindent', '' }, i(0) },
		{ condition = pipe { conds.line_begin, vimtex.in_text }, show_condition = vimtex.in_text }
	),
	s(
		{ trig = 'cite', name = '\\cite[]{}' },
		{ t('\\cite['), i(1), t(']{'), i(2), t('}'), i(0) },
		{ condition = vimtex.in_text, show_condition = vimtex.in_text }
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
		{ t('\\frac{'), i(1), t('}{'), i(2), t('}'), i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),

	s(
		{ trig = 'sum', name = 'sum', dscr = 'Insert a sum notation.' },
		{ t('\\sum_{'), i(1), t('}^{'), i(2), t('}'), i(3), i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),

	s(
		{ trig = 'lim', name = 'limit', dscr = 'Insert a limit notation.' },
		{ t('\\lim_{n='), i(1, 'n'), t('\\to '), i(2, '\\infty'), t('} '), i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),

	s(
		{ trig = 'limsup', name = 'limsup', dscr = 'Insert a limit superior notation.' },
		{ t('\\limsup_{n='), i(1, 'n'), t('\\to '), i(2, '\\infty'), t('} '), i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),

	s(
		{ trig = 'prod', name = 'product', dscr = 'Insert a product notation.' },
		{ t('\\prod_{'), i(1, 'n'), t('='), i(2, '1'), t('}^{'), i(3, '\\infty'), t('}'), i(4), t(' '), i(0) },
		{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	),

	-- phrases which are often used
	s(
		{ trig = 'ses', name = 'short exact sequence', dscr = 'text: short exact sequence.' },
		{ t('short exact sequence') },
		{ condition = vimtex.in_text, show_condition = vimtex.in_text }
	),

	s(
		{ trig = 'klt', name = 'Kawamata log terminal', dscr = 'text: Kawamata log terminal.' },
		{ t('Kawamata log terminal') },
		{ condition = vimtex.in_text, show_condition = vimtex.in_text }
	),

	-- cycle change sequences
	-- s(
	-- 	{ trig = 'spaceseq', name = 'set a white space', dscr = 'Select from 3/4/5/normal/18/36/-3mu.' },
	-- 	{ c(1, { t('\\, '), t('\\: '), t('\\; '), t('\\  '), t('\\quad '), t('\\qquad '), t('\\! ') }), i(0) },
	-- 	{ condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }
	-- ),
	-- s({
	-- 	trig = 'larrowseq',
	-- 	name = 'set a left arrow',
	-- 	dscr = 'leftarrow\nlongleftarrow\nLeftarrow\nLongleftarrow\nxleftarrow',
	-- }, {
	-- 	c(1, { t('\\leftarrow '), t('\\longleftarrow '), t('\\Leftarrow '), t('\\Longleftarrow '), t('\\xleftarrow ') }),
	-- 	i(0),
	-- }, { condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }),
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
	-- }, { condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }),
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
	-- }, { condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }),
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
	-- }, { condition = vimtex.in_mathzone, show_condition = vimtex.in_mathzone }),

	s({ trig = 'tempb', name = 'Basic template', dscr = 'Use the basic template' }, {
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
	}, { condition = conds.line_begin }),
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
	}, {
		condition = conds.line_begin,
	}),
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
	}, { condition = conds.line_begin }),
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
	}, { condition = conds.line_begin }),
}

return M
