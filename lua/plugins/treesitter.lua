return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "p00f/nvim-ts-rainbow",
    -- "nvim-treesitter/nvim-treesitter-context",
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.install").compilers = { "/opt/homebrew/bin/gcc-12" }
    require("nvim-treesitter.configs").setup({
      ensure_installed = require('config.settings').ts_install,
      highlight = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = true },
      rainbow = { enable = true },
    })
  end,
  event = "BufReadPost",
}
