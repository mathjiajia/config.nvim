local snips, autosnips = {}, {}

local tex = require('utils.latex')

autosnips = {
	s({ trig = ';a', name = 'alpha α', wordTrig = false }, { t('\\alpha') }, { condition = tex.in_mathzone }),
	s({ trig = ';b', name = 'beta β', wordTrig = false }, { t('\\beta') }, { condition = tex.in_mathzone }),
	s({ trig = ';c', name = 'chi χ', wordTrig = false }, { t('\\chi') }, { condition = tex.in_mathzone }),
	s({ trig = ';d', name = 'delta δ', wordTrig = false }, { t('\\delta') }, { condition = tex.in_mathzone }),
	s({ trig = ';e', name = 'epsilon ε', wordTrig = false }, { t('\\epsilon') }, { condition = tex.in_mathzone }),
	s({ trig = ';f', name = 'phi φ', wordTrig = false }, { t('\\phi') }, { condition = tex.in_mathzone }),
	s({ trig = ';g', name = 'gamma γ', wordTrig = false }, { t('\\gamma') }, { condition = tex.in_mathzone }),
	s({ trig = ';h', name = 'eta η', wordTrig = false }, { t('\\eta') }, { condition = tex.in_mathzone }),
	s({ trig = ';i', name = 'iota ι', wordTrig = false }, { t('\\iota') }, { condition = tex.in_mathzone }),
	s({ trig = ';k', name = 'kappa κ', wordTrig = false }, { t('\\kappa') }, { condition = tex.in_mathzone }),
	s({ trig = ';l', name = 'lambda λ', wordTrig = false }, { t('\\lambda') }, { condition = tex.in_mathzone }),
	s({ trig = ';m', name = 'mu μ', wordTrig = false }, { t('\\mu') }, { condition = tex.in_mathzone }),
	s({ trig = ';n', name = 'nu ν', wordTrig = false }, { t('\\nu') }, { condition = tex.in_mathzone }),
	s({ trig = ';p', name = 'pi π', wordTrig = false }, { t('\\pi') }, { condition = tex.in_mathzone }),
	s({ trig = ';q', name = 'theta θ', wordTrig = false }, { t('\\theta') }, { condition = tex.in_mathzone }),
	s({ trig = ';r', name = 'rho ρ', wordTrig = false }, { t('\\rho') }, { condition = tex.in_mathzone }),
	s({ trig = ';s', name = 'sigma σ', wordTrig = false }, { t('\\sigma') }, { condition = tex.in_mathzone }),
	s({ trig = ';t', name = 'tau τ', wordTrig = false }, { t('\\tau') }, { condition = tex.in_mathzone }),
	s({ trig = ';u', name = 'upsilon υ', wordTrig = false }, { t('\\upsilon') }, { condition = tex.in_mathzone }),
	s({ trig = ';w', name = 'omega ω', wordTrig = false }, { t('\\omega') }, { condition = tex.in_mathzone }),
	s({ trig = ';x', name = 'xi ξ', wordTrig = false }, { t('\\xi') }, { condition = tex.in_mathzone }),
	s({ trig = ';y', name = 'psi ψ', wordTrig = false }, { t('\\psi') }, { condition = tex.in_mathzone }),
	s({ trig = ';z', name = 'zeta χ', wordTrig = false }, { t('\\zeta') }, { condition = tex.in_mathzone }),
	s({ trig = ';D', name = 'Delta Δ', wordTrig = false }, { t('\\Delta') }, { condition = tex.in_mathzone }),
	s({ trig = ';F', name = 'Phi Φ', wordTrig = false }, { t('\\Phi') }, { condition = tex.in_mathzone }),
	s({ trig = ';G', name = 'Gamma Γ', wordTrig = false }, { t('\\Gamma') }, { condition = tex.in_mathzone }),
	s({ trig = ';L', name = 'Lambda Λ', wordTrig = false }, { t('\\Lambda') }, { condition = tex.in_mathzone }),
	s({ trig = ';P', name = 'Pi π', wordTrig = false }, { t('\\Pi') }, { condition = tex.in_mathzone }),
	s({ trig = ';Q', name = 'Theta Θ', wordTrig = false }, { t('\\Theta') }, { condition = tex.in_mathzone }),
	s({ trig = ';S', name = 'Sigma Σ', wordTrig = false }, { t('\\delta') }, { condition = tex.in_mathzone }),
	s({ trig = ';U', name = 'Upsilon Υ', wordTrig = false }, { t('\\Upsilon') }, { condition = tex.in_mathzone }),
	s({ trig = ';W', name = 'Omega Ω', wordTrig = false }, { t('\\Omega') }, { condition = tex.in_mathzone }),
	s({ trig = ';X', name = 'Xi Ξ', wordTrig = false }, { t('\\Xi') }, { condition = tex.in_mathzone }),
	s({ trig = ';Y', name = 'Psi Ψ', wordTrig = false }, { t('\\Psi') }, { condition = tex.in_mathzone }),
	s(
		{ trig = ';ve', name = 'varepsilon ε', wordTrig = false },
		{ t('\\varepsilon') },
		{ condition = tex.in_mathzone }
	),
	s({ trig = ';vf', name = 'varphi 𝜑', wordTrig = false }, { t('\\varphi') }, { condition = tex.in_mathzone }),
	s({ trig = ';vk', name = 'varkappa ϰ', wordTrig = false }, { t('\\varkappa') }, { condition = tex.in_mathzone }),
	s({ trig = ';vi', name = 'varpi ϖ', wordTrig = false }, { t('\\varpi') }, { condition = tex.in_mathzone }),
	s({ trig = ';vq', name = 'vartheta ϑ', wordTrig = false }, { t('\\vartheta') }, { condition = tex.in_mathzone }),
	s({ trig = ';vr', name = 'varrho ϱ', wordTrig = false }, { t('\\varrho') }, { condition = tex.in_mathzone }),
}

return snips, autosnips
