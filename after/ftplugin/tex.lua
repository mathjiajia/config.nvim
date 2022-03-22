vim.g.tex_flavor = 'latex'
vim.wo.conceallevel = 1

-- spell
vim.opt_local.spell = true
vim.bo.spelllang = 'en_gb'
vim.keymap.set('i', '<M-l>', '<C-g>u<Esc>[s1z=`]a<C-g>u', { buffer = true, desc = 'Fix Last Miss-Spelling' })

vim.keymap.set('n', '<M-b>', '<Cmd>TexlabBuild<CR>', { buffer = true, desc = 'Compile LaTeX' })
vim.keymap.set('n', '<M-v>', '<Cmd>TexlabForward<CR>', { buffer = true, desc = 'View PDF' })

-- A list of groups that are only primitive link targets.
-- vim.api.nvim_set_hl(0, 'texCmdType', { link = 'Type' })
-- vim.api.nvim_set_hl(0, 'texError', { link = 'Error' })
-- vim.api.nvim_set_hl(0, 'texParm', { link = 'Special' })
-- vim.api.nvim_set_hl(0, 'texZone', { link = 'PreCondit' })
-- vim.api.nvim_set_hl(0, 'texSymbol', { link = 'SpecialChar' })

-- A list of the most common normal LaTeX groups.
-- vim.api.nvim_set_hl(0, 'texComment', { link = 'Comment' }) -- % COMMENT
-- vim.api.nvim_set_hl(0, 'texCommentTodo', { link = 'Todo' }) -- % TODO
-- vim.api.nvim_set_hl(0, 'texDelim', { link = 'Delimiter' }) -- {, }, [, and ]
vim.api.nvim_set_hl(0, 'texCmd', { link = 'Statement' }) -- \CMD
vim.api.nvim_set_hl(0, 'texOpt', { link = 'Identifier' }) -- \cmd[OPT]
vim.api.nvim_set_hl(0, 'texOptSep', { link = 'NormalNC' }) -- [a, b] (commas)
vim.api.nvim_set_hl(0, 'texOptEqual', { link = 'texSymbol' }) -- [a=b]
vim.api.nvim_set_hl(0, 'texArg', { link = 'Include' }) -- \cmd[...]{ARG}
vim.api.nvim_set_hl(0, 'texSpecialChar', { link = 'SpecialChar' }) -- \S, \P, \$, \;, ...
vim.api.nvim_set_hl(0, 'texCmdInput', { link = 'texCmd' }) -- \INPUT, \INCLUDE, \INCLUDEONLY, \INCLUDEGRAPHICS
vim.api.nvim_set_hl(0, 'texCmdBib', { link = 'texCmd' }) -- \BIBLIOGRAPHY, \BIBLIOGRAPHYSTYLE
vim.api.nvim_set_hl(0, 'texCmdClass', { link = 'texCmd' }) -- \DOCUMENTCLASS
vim.api.nvim_set_hl(0, 'texCmdPackage', { link = 'texCmd' }) -- \USEPACKAGE, \REQUIREPACKAGE
vim.api.nvim_set_hl(0, 'texFileOpt', { link = 'texOpt' }) -- \includegraphics[PACKAGE OPTIONS], \documentclass[CLASS OPTIONS]
vim.api.nvim_set_hl(0, 'texFileArg', { link = 'texArg' }) -- \input{FILE}, \include{FILE}, \includegraphics[...]{FILE}, \bibliographystyle{FILE}, \documentclass[...]{CLASS}
vim.api.nvim_set_hl(0, 'texFilesOpt', { link = 'texFileOpt' }) -- \usepackage[PACKAGE OPTIONS], \RequirePackage[PACKAGE OPTIONS]
vim.api.nvim_set_hl(0, 'texFilesArg', { link = 'texFileArg' }) -- \includeonly{FILE1, FILE2}, \bibliography{FILE1, FILE2}, \usepackage[...]{PACKAGE1, PACKAGE2}, \RequirePackage[...]{PACKAGE1, PACKAGE2}
vim.api.nvim_set_hl(0, 'texCmdTitle', { link = 'texCmd' }) -- \TITLE
vim.api.nvim_set_hl(0, 'texTitleArg', { link = 'Underlined' }) -- \title{MAIN TITLE}
vim.api.nvim_set_hl(0, 'texCmdAuthor', { link = 'texCmd' }) -- \AUTHOR
vim.api.nvim_set_hl(0, 'texAuthorOpt', { link = 'texOpt' }) -- \author[OPT]
vim.api.nvim_set_hl(0, 'texAuthorArg', { link = 'NONE' }) -- \author[...]{AUTHOR LIST}
vim.api.nvim_set_hl(0, 'texCmdPart', { link = 'texCmd' }) -- \(SUB*)SECTION
vim.api.nvim_set_hl(0, 'texPartArgTitle', { link = 'Title' }) -- \(sub*)section{TITLE}
vim.api.nvim_set_hl(0, 'texCmdEnv', { link = 'TSEnvironment' }) -- \BEGIN; \END
vim.api.nvim_set_hl(0, 'texEnvArgName', { link = 'TSEnvironmentName' }) -- PreCondit -- \begin{ENVNAME}
vim.api.nvim_set_hl(0, 'texTheoremEnvBgn', { link = 'TSEnvironment' }) -- \begin{theorem}
vim.api.nvim_set_hl(0, 'texTheoremEnvOpt', { link = 'TSParameter' }) -- \begin{theorem}
vim.api.nvim_set_hl(0, 'texCmdRef', { link = 'texCmd' }) -- \CITE; \LABEL
vim.api.nvim_set_hl(0, 'texRefArg', { link = 'Special' }) -- \cite{REFERENCE}; \label{REF}
-- vim.api.nvim_set_hl(0, 'texE3Variable', { link = 'texCmd' }) -- \G_MYFILE_NAME_STR
-- vim.api.nvim_set_hl(0, 'texE3Constant', { link = 'texE3Variabl' }) -- \C_MYFILE_NAME_STR
-- vim.api.nvim_set_hl(0, 'texE3Function', { link = 'texCmdType' }) -- \STR_NEW:n
-- vim.api.nvim_set_hl(0, 'texE3Type', { link = 'texParm' }) -- \str_new:N
vim.api.nvim_set_hl(0, 'texCmdParbox', { link = 'texCmd' }) -- \PARBOX[p][h][i]{w}{c}
vim.api.nvim_set_hl(0, 'texBoxOptPosVal', { link = 'texSymbol' }) -- parbox[P][h][i]{w}{c}, \begin{minipage}[P][h][i]{w}
vim.api.nvim_set_hl(0, 'texBoxOptIPosVal', { link = 'texBoxOptPosVal' }) -- \parbox[p][h][I]{w}{c}, \begin{minipage}[p][h][I]{w}

-- A list of math mode groups.
vim.api.nvim_set_hl(0, 'texMathZone', { link = 'TSMath' }) -- Special \( HERE \); \[ HERE \]
vim.api.nvim_set_hl(0, 'texMathZoneEnv', { link = 'texMathZone' }) -- \begin{menv} HERE \end{menv}
vim.api.nvim_set_hl(0, 'texMathZoneEnvStarred', { link = 'texMathZone' }) -- \begin{menv*} HERE \end{menv*}
-- vim.api.nvim_set_hl(0, 'texMathZoneX', { link = 'texMathZone' }) -- $ HERE $
-- vim.api.nvim_set_hl(0, 'texMathZoneXX', { link = 'texMathZone' }) -- $$ HERE $$
vim.api.nvim_set_hl(0, 'texMathZoneEnsured', { link = 'texMathZone' }) -- \ensuremath{HERE}
vim.api.nvim_set_hl(0, 'texCmdMathEnv', { link = 'texCmdEnv' }) -- \BEGIN; \END (for math environments)
vim.api.nvim_set_hl(0, 'texMathEnvArgName', { link = 'Delimiter' }) -- \begin{EQUATION}
vim.api.nvim_set_hl(0, 'texCmdMath', { link = 'texCmd' }) -- \ENSUREMATH
vim.api.nvim_set_hl(0, 'texMathDelim', { link = 'Type' }) -- LVERT
vim.api.nvim_set_hl(0, 'texMathDelimMod', { link = 'texMathDelim' }) -- \LEFT\lvert \RIGHT\rvert
-- vim.api.nvim_set_hl(0, 'texMathOper', { link = 'Operator' }) -- Basic operators: + -= /
vim.api.nvim_set_hl(0, 'texMathSuperSub', { link = 'texMathOper' }) -- Sub and super operators (^, _)
-- vim.api.nvim_set_hl(0, 'texMathError', { link = 'texError' }) -- Unmatched region endings

-- A list of other important groups.
vim.api.nvim_set_hl(0, 'texLength', { link = 'Number' }) -- Length units, e.g. "4 cm". Only when contained e.g. in option groups.
vim.api.nvim_set_hl(0, 'texLigature', { link = 'texSymbol' }) -- --; ---; ``; '';,,
vim.api.nvim_set_hl(0, 'texCmdAccent', { link = 'texCmd' }) -- \"{a}
vim.api.nvim_set_hl(0, 'texCmdLigature', { link = 'texSpecialChar' }) -- \ss; \ae
vim.api.nvim_set_hl(0, 'texCmdSpaceCodeChar', { link = 'Special' }) -- Catcodes. For more info, see: https://en.wikibooks.org/wiki/TeX/catcode
vim.api.nvim_set_hl(0, 'texCmdTodo', { link = 'Todo' }) -- \TODOSOMETHING
vim.api.nvim_set_hl(0, 'texCmdVerb', { link = 'texCmd' }) -- \VERB
vim.api.nvim_set_hl(0, 'texVerbZoneInline', { link = 'texZone' }) -- \verb+VERB TEXT+
vim.api.nvim_set_hl(0, 'texVerbZone', { link = 'texZone' }) -- \begin{verbatim} VERB TEXT \end{verbatim}
vim.api.nvim_set_hl(0, 'texCmdDef', { link = 'texCmdNew' }) -- \DEF
vim.api.nvim_set_hl(0, 'texDefArgName', { link = 'texArgNew' }) -- \def\NAME
vim.api.nvim_set_hl(0, 'texDefParm', { link = 'texParm' }) -- \def\name #1
vim.api.nvim_set_hl(0, 'texCmdItem', { link = 'texCmd' }) -- \item
