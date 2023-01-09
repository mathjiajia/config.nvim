local snips, autosnips = {}, {}

local tex = require("util.latex")

snips = {
	s(
		{ trig = "c(%u)", name = "mathcal", wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return "\\mathcal{" .. snip.captures[1] .. "}"
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = "f(%a)", name = "mathfrak", wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return "\\mathfrak{" .. snip.captures[1] .. "}"
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = "s(%u)", name = "mathscr", wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return "\\mathscr{" .. snip.captures[1] .. "}"
		end, {}) },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = "/", name = "fraction", dscr = "Insert a fraction notation.", wordTrig = false, hidden = true },
		{ t("\\frac{"), i(1), t("}{"), i(2), t("}") },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),

	s(
		{ trig = "sum", name = "sum", dscr = "Insert a sum notation.", hidden = true },
		{ t("\\sum_{"), i(1), t("}^{"), i(2), t("}") },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = "lim", name = "limit", dscr = "Insert a limit notation.", hidden = true },
		{ t("\\lim_{"), i(1, "n"), t("\\to "), i(2, "\\infty"), t("}") },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = "limsup", name = "limsup", dscr = "Insert a limit superior notation.", hidden = true },
		{ t("\\limsup_{"), i(1, "n"), t("\\to "), i(2, "\\infty"), t("}") },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
	s(
		{ trig = "prod", name = "product", dscr = "Insert a product notation.", hidden = true },
		{ t("\\prod_{"), i(1, "n"), t("="), i(2, "1"), t("}^{"), i(3, "\\infty"), t("}") },
		{ condition = tex.in_mathzone, show_condition = tex.in_mathzone }
	),
}

autosnips = {
	s({ trig = "\\varpii", name = "\\varpi_i", hidden = true }, { t("\\varpi_{i}") }, { condition = tex.in_mathzone }),
	s(
		{ trig = "\\varphii", name = "\\varphi_i", hidden = true },
		{ t("\\varphi_{i}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "\\([xX])ii", name = "\\xi_{i}", regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.format("\\%si_{i}", snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "\\([pP])ii", name = "\\pi_{i}", regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.format("\\%si_{i}", snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "\\([pP])hii", name = "\\phi_{i}", regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.format("\\%shi_{i}", snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "\\([cC])hii", name = "\\chi_{i}", regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.format("\\%shi_{i}", snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "\\([pP])sii", name = "\\psi_{i}", regTrig = true, hidden = true },
		{ f(function(_, snip)
			return string.format("\\%ssi_{i}", snip.captures[1])
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s({
		trig = "O([A-NP-Za-z])",
		name = "local ring, structure sheaf",
		wordTrig = false,
		regTrig = true,
		hidden = true,
	}, {
		f(function(_, snip)
			return "\\mathcal{O}_{" .. snip.captures[1] .. "}"
		end, {}),
	}, { condition = tex.in_mathzone }),

	s({
		trig = "(%a)(%d)",
		name = "auto subscript 1",
		dscr = "Subscript with a single number.",
		wordTrig = false,
		regTrig = true,
		hidden = true,
	}, {
		f(function(_, snip)
			return string.format("%s_%s", snip.captures[1], snip.captures[2])
		end, {}),
	}, { condition = tex.in_mathzone }),

	s({
		trig = "(%a)_(%d%d)",
		name = "auto subscript 2",
		dscr = "Subscript with two numbers.",
		wordTrig = false,
		regTrig = true,
		hidden = true,
	}, {
		f(function(_, snip)
			return string.format("%s_{%s}", snip.captures[1], snip.captures[2])
		end, {}),
	}, { condition = tex.in_mathzone }),

	s(
		{ trig = "inn", name = "belongs to ∈", wordTrig = false, hidden = true },
		{ t("\\in ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "!in", name = "does not belong to ∉", wordTrig = false, hidden = true },
		{ t("\\notin ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "!=", name = "not equal ≠", wordTrig = false, hidden = true },
		{ t("\\neq ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "<=", name = "less than or equal to ≤", wordTrig = false, hidden = true },
		{ t("\\leq ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = ">=", name = "greater than or equal to ≥", wordTrig = false, hidden = true },
		{ t("\\geq ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "<<", name = "much less than ≪", wordTrig = false, hidden = true },
		{ t("\\ll ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = ">>", name = "much greater than ≫", wordTrig = false, hidden = true },
		{ t("\\gg ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "~~", name = "similar ~", wordTrig = false, hidden = true },
		{ t("\\sim ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "~=", name = "is isomorphic to ≃", wordTrig = false, hidden = true },
		{ t("\\simeq ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "nvs", name = "inverse", wordTrig = false, hidden = true },
		{ t("^{-1}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "^-", name = "negative exponents", wordTrig = false, hidden = true },
		{ t("^{-"), i(1), t("}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "sq", name = "square root", hidden = true },
		{ t("\\sqrt{"), i(1), t("}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "__", name = "subscript", wordTrig = false, hidden = true },
		{ t("_{"), i(1), t("}") },
		{}
		-- { condition = tex.in_mathzone }
	),
	s(
		{ trig = "^^", name = "supscript", wordTrig = false, hidden = true },
		{ t("^{"), i(1), t("}") },
		{}
		-- { condition = tex.in_mathzone }
	),
	s(
		{ trig = "**", name = "upper star *", wordTrig = false, hidden = true },
		{ t("^{*}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "...", name = "dots ...", wordTrig = false, hidden = true },
		{ t("\\dots") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "||", name = "mid |", wordTrig = false, hidden = true },
		{ t("\\mid ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "::", name = "colon :", wordTrig = false, hidden = true },
		{ t("\\colon ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = ":=", name = "coloneqq :=", wordTrig = false, hidden = true },
		{ t("\\coloneqq ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "rup", name = "round up", wordTrig = false, hidden = true },
		{ t("\\rup{"), i(1), t("}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "rwn", name = "round down", wordTrig = false, hidden = true },
		{ t("\\rdown{"), i(1), t("}") },
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = "lll", name = "ell ℓ", wordTrig = false, hidden = true },
		{ t("\\ell") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "xx", name = "times ×", wordTrig = false, hidden = true },
		{ t("\\times") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "nabl", name = "nabla ∇", wordTrig = false, hidden = true },
		{ t("\\nabla") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "AA", name = "affine 𝔸", wordTrig = false, hidden = true },
		{ t("\\mathbb{A}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "CC", name = "complex ℂ", wordTrig = false, hidden = true },
		{ t("\\mathbb{C}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "DD", name = "disc 𝔻", wordTrig = false, hidden = true },
		{ t("\\mathbb{D}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "FF", name = "Hirzebruch 𝔽", wordTrig = false, hidden = true },
		{ t("\\mathbb{F}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "GG", name = "algebraic group 𝔾", wordTrig = false, hidden = true },
		{ t("\\mathbb{G}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "HH", name = "half plane ℍ", wordTrig = false, hidden = true },
		{ t("\\mathbb{H}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "NN", name = "natural ℕ", wordTrig = false, hidden = true },
		{ t("\\mathbb{N}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "OO", name = "mathcal{O}", wordTrig = false, hidden = true },
		{ t("\\mathcal{O}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "PP", name = "projective ℙ", wordTrig = false, hidden = true },
		{ t("\\mathbb{P}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "QQ", name = "rational ℚ", wordTrig = false, hidden = true },
		{ t("\\mathbb{Q}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "RR", name = "real ℝ", wordTrig = false, hidden = true },
		{ t("\\mathbb{R}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "ZZ", name = "integer ℤ", wordTrig = false, hidden = true },
		{ t("\\mathbb{Z}") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "srt", name = "square root", wordTrig = false, hidden = true },
		{ t("\\sqrt{"), i(1), t("}") },
		{ condition = tex.in_mathzone }
	),
	s({ trig = "set", name = "set", hidden = true }, { t("\\{"), i(1), t("\\}") }, { condition = tex.in_mathzone }),
	s(
		{ trig = "o+", name = "oplus", wordTrig = false, hidden = true },
		{ t("\\oplus ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "ox", name = "otimes", wordTrig = false, hidden = true },
		{ t("\\otimes") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "cap", name = "cap", wordTrig = false, hidden = true },
		{ t("\\cap ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "cup", name = "cup", wordTrig = false, hidden = true },
		{ t("\\cup ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "nnn", name = "bigcup", wordTrig = false, hidden = true },
		{ t("\\bigcap ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "uuu", name = "bigcap", wordTrig = false, hidden = true },
		{ t("\\bigcup ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "sub", name = "subseteq ⊆", wordTrig = false, hidden = true },
		{ t("\\subseteq ") },
		{ condition = tex.in_mathzone }
	),
	-- s(
	-- 	{ trig = 'sup', name = 'supseteq ⊇', wordTrig = false, hidden = true },
	-- 	{ t('\\supseteq') },
	-- 	{ condition = tex.in_mathzone }
	-- ),

	-- s(
	-- 	{ trig = '<|', name = 'triangleleft <|', wordTrig = false, hidden = true },
	-- 	{ t('\\triangleleft ') },
	-- 	{ condition = tex.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = '|>', name = 'triangleright |>', wordTrig = false, hidden = true },
	-- 	{ t('\\triangleright ') },
	-- 	{ condition = tex.in_mathzone }
	-- ),

	s(
		{ trig = "MK", name = "Mori-Kleiman cone", hidden = true },
		{ t("\\cNE("), i(1), t(")") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = "([QRZ])P", name = "positive", wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return "\\mathbb{" .. snip.captures[1] .. "}^{>0}"
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = "([QRZ])N", name = "negative", wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return "\\mathbb{" .. snip.captures[1] .. "}^{<0}"
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = "([qr])le", name = "linearly equivalent", wordTrig = false, regTrig = true, hidden = true },
		{ f(function(_, snip)
			return "\\sim_{\\mathbb{" .. string.upper(snip.captures[1]) .. "}} "
		end, {}) },
		{ condition = tex.in_mathzone }
	),

	s(
		{ trig = "==", name = "align equls", wordTrig = false, hidden = true },
		{ t("& = ") },
		{ condition = tex.in_align }
	),
	s(
		{ trig = "ar", name = "normal arrows", hidden = true },
		{ t("\\ar["), i(1), t("]") },
		{ condition = tex.in_xymatrix }
	),

	s({ trig = "(%a)ii", name = "alph i", wordTrig = false, regTrig = true, hidden = true }, {
		f(function(_, snip)
			return snip.captures[1] .. "_{i}"
		end, {}),
	}, { condition = tex.in_mathzone }),
	s({ trig = "(%a)jj", name = "alph j", wordTrig = false, regTrig = true, hidden = true }, {
		f(function(_, snip)
			return snip.captures[1] .. "_{j}"
		end, {}),
	}, { condition = tex.in_mathzone }),

	s(
		{ trig = ";=", name = "equiv ≡", wordTrig = false, hidden = true },
		{ t("\\equiv ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = ";-", name = "setminus \\", wordTrig = false, hidden = true },
		{ t("\\setminus ") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = ";A", name = "forall ∀", wordTrig = false, hidden = true },
		{ t("\\forall") },
		{ condition = tex.in_mathzone }
	),
	s(
		{ trig = ";E", name = "exists ∃", wordTrig = false, hidden = true },
		{ t("\\exists") },
		{ condition = tex.in_mathzone }
	),
	-- s(
	-- 	{ trig = 'xmm', name = 'x_m', wordTrig = false, hidden = true },
	-- 	{ t('x_{m}') },
	-- 	{ condition = tex.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'xnn', name = 'x_n', wordTrig = false, hidden = true },
	-- 	{ t('x_{n}') },
	-- 	{ condition = tex.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'ymm', name = 'y_m', wordTrig = false, hidden = true },
	-- 	{ t('y_{m}') },
	-- 	{ condition = tex.in_mathzone }
	-- ),
	-- s(
	-- 	{ trig = 'ynn', name = 'y_n', wordTrig = false, hidden = true },
	-- 	{ t('y_{n}') },
	-- 	{ condition = tex.in_mathzone }
	-- ),
}

return snips, autosnips
