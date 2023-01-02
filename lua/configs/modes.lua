-- vi modes
return {
    n         = { 'NORMAL', 'fg' },
    no        = { 'OPPEND', 'blue' },
    nov       = { 'N?', 'blue' },
    noV       = { 'N?', 'blue' },
    ['no\22'] = { 'N?', 'blue' },
    niI       = { 'Ni', 'red' },
    niR       = { 'Nr', 'red' },
    niV       = { 'Nv', 'red' },
    nt        = { 'N-TERM', 'red' },
    v         = { 'VISUAL', 'cyan' },
    vs        = { 'Vs', 'cyan' },
    V         = { 'V-LINE', 'cyan' },
    Vs        = { 'Vs', 'cyan' },
    ['\22']   = { 'V-BLCK', 'cyan' },
    ['\22s']  = { '^V', 'cyan' },
    s         = { 'SELECT', 'purple' },
    S         = { 'S-LINE', 'purple' },
    ['\19']   = { 'S-BLCK', 'purple' },
    i         = { 'INSERT', 'blue' },
    ic        = { 'ICOMPL', 'blue' },
    ix        = { 'Ix', 'blue' },
    R         = { 'RPLACE', 'orange' },
    Rc        = { 'Rc', 'orange' },
    Rx        = { 'Rx', 'orange' },
    Rv        = { 'VRPLCE', 'orange' },
    Rvc       = { 'Rv', 'orange' },
    Rvx       = { 'Rv', 'orange' },
    c         = { 'CMMAND', 'green' },
    cv        = { 'PROMPT', 'green' },
    r         = { '...', 'green' },
    rm        = { 'MORE', 'green' },
    ['r?']    = { 'CNFIRM', 'green' },
    ['!']     = { 'SHELL', 'red' },
    t         = { 'TERM', 'red' },
}