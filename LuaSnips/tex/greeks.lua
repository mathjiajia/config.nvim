local snips, autosnips = {}, {}

local context = require('snips.context')

autosnips = {
	s(
		{ trig = ';a', name = 'alpha α', wordTrig = false, hidden = true },
		{ t('\\alpha') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';b', name = 'beta β', wordTrig = false, hidden = true },
		{ t('\\beta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';c', name = 'chi χ', wordTrig = false, hidden = true },
		{ t('\\chi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';d', name = 'delta δ', wordTrig = false, hidden = true },
		{ t('\\delta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';e', name = 'epsilon ε', wordTrig = false, hidden = true },
		{ t('\\epsilon') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';f', name = 'phi φ', wordTrig = false, hidden = true },
		{ t('\\phi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';g', name = 'gamma γ', wordTrig = false, hidden = true },
		{ t('\\gamma') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';h', name = 'eta η', wordTrig = false, hidden = true },
		{ t('\\eta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';i', name = 'iota ι', wordTrig = false, hidden = true },
		{ t('\\iota') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';k', name = 'kappa κ', wordTrig = false, hidden = true },
		{ t('\\kappa') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';l', name = 'lambda λ', wordTrig = false, hidden = true },
		{ t('\\lambda') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';m', name = 'mu μ', wordTrig = false, hidden = true },
		{ t('\\mu') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';n', name = 'nu ν', wordTrig = false, hidden = true },
		{ t('\\nu') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';p', name = 'pi π', wordTrig = false, hidden = true },
		{ t('\\pi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';q', name = 'theta θ', wordTrig = false, hidden = true },
		{ t('\\theta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';r', name = 'rho ρ', wordTrig = false, hidden = true },
		{ t('\\rho') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';s', name = 'sigma σ', wordTrig = false, hidden = true },
		{ t('\\sigma') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';t', name = 'tau τ', wordTrig = false, hidden = true },
		{ t('\\tau') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';u', name = 'upsilon υ', wordTrig = false, hidden = true },
		{ t('\\upsilon') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';w', name = 'omega ω', wordTrig = false, hidden = true },
		{ t('\\omega') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';x', name = 'xi ξ', wordTrig = false, hidden = true },
		{ t('\\xi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';y', name = 'psi ψ', wordTrig = false, hidden = true },
		{ t('\\psi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';z', name = 'zeta χ', wordTrig = false, hidden = true },
		{ t('\\zeta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';D', name = 'Delta Δ', wordTrig = false, hidden = true },
		{ t('\\Delta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';F', name = 'Phi Φ', wordTrig = false, hidden = true },
		{ t('\\Phi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';G', name = 'Gamma Γ', wordTrig = false, hidden = true },
		{ t('\\Gamma') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';L', name = 'Lambda Λ', wordTrig = false, hidden = true },
		{ t('\\Lambda') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';P', name = 'Pi π', wordTrig = false, hidden = true },
		{ t('\\Pi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';Q', name = 'Theta Θ', wordTrig = false, hidden = true },
		{ t('\\Theta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';S', name = 'Sigma Σ', wordTrig = false, hidden = true },
		{ t('\\Sigma') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';U', name = 'Upsilon Υ', wordTrig = false, hidden = true },
		{ t('\\Upsilon') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';W', name = 'Omega Ω', wordTrig = false, hidden = true },
		{ t('\\Omega') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';X', name = 'Xi Ξ', wordTrig = false, hidden = true },
		{ t('\\Xi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';Y', name = 'Psi Ψ', wordTrig = false, hidden = true },
		{ t('\\Psi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';ve', name = 'varepsilon ε', wordTrig = false, hidden = true },
		{ t('\\varepsilon') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';vf', name = 'varphi 𝜑', wordTrig = false, hidden = true },
		{ t('\\varphi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';vk', name = 'varkappa ϰ', wordTrig = false, hidden = true },
		{ t('\\varkappa') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';vi', name = 'varpi ϖ', wordTrig = false, hidden = true },
		{ t('\\varpi') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';vq', name = 'vartheta ϑ', wordTrig = false, hidden = true },
		{ t('\\vartheta') },
		{ condition = context.in_mathzone }
	),
	s(
		{ trig = ';vr', name = 'varrho ϱ', wordTrig = false, hidden = true },
		{ t('\\varrho') },
		{ condition = context.in_mathzone }
	),
}

return snips, autosnips
