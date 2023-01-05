return {

  -- filesype plugin for `latex`
  {
    "ryleelyman/latex.nvim",
    config = {
      conceals = {
        add = {
          ["colon"] = ":",
          ["coloneqq"] = "≔",
        },
      },
      imaps = {
        add = { ["\\emptyset"] = "0" },
        default_leader = ";",
      },
      surrounds = { enabled = true },
    },
    ft = "tex",
  },

  -- inverse serach for latex
  {
    "f3fora/nvim-texlabconfig",
    build = "go build",
    config = true,
    ft = "tex",
  },

  -- neorg
  {
    "nvim-neorg/neorg",
    config = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
        ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
      },
    },
    ft = "norg",
  },
}
