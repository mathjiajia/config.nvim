return {

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "mason.nvim",
      { "folke/neodev.nvim", config = true },
    },
    servers = nil,
    config = function()
      -- diagnostics
      require("plugins.lsp.diagnostic")

      -- lspconfig
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local function on_attach(client, bufnr)
        require("plugins.lsp.format").on_attach(client, bufnr)
        require("plugins.lsp.keymaps").on_attach(client, bufnr)
        require("plugins.lsp.highlight").on_attach(client, bufnr)
        -- require('plugins.lsp.codelens').on_attach(client, bufnr)
      end

      local servers = require("plugins.lsp.servers")
      for server, opts in pairs(servers) do
        opts.capabilities = capabilities
        opts.on_attach = on_attach
        require("lspconfig")[server].setup(opts)
      end
    end,
    event = "BufReadPre",
  },

  -- cmdline tools and lsp servers
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({ ui = { border = "rounded" } })

      local ensure_installed = {
        "black",
        "debugpy",
        "lua-language-server",
        "markdownlint",
        "prettierd",
        "pyright",
        "stylua",
        "tectonic",
        "texlab",
      }

      local mr = require("mason-registry")
      for _, tool in ipairs(ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  -- inject LSP
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = "mason.nvim",
    event = "BufReadPre",
    config = function()
      local null_ls = require("null-ls")

      local function on_attach(client, bufnr)
        require("plugins.lsp.format").on_attach(client, bufnr)
      end

      null_ls.setup({
        on_attach = on_attach,
        sources = {
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.fish_indent,
          null_ls.builtins.formatting.latexindent,
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettierd.with({
            filetypes = { "css", "javascript", "yaml", "markdown" },
          }),
          null_ls.builtins.diagnostics.fish,
          null_ls.builtins.diagnostics.markdownlint.with({
            args = { "--config", "~/.config/markdownlint/markdownlint.yaml", "--stdin" },
          }),
        },
      })
    end,
  },

  -- lsp enhancement
  {
    "glepnir/lspsaga.nvim",
    branch = "version_2.3",
    config = function()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        ui = {
          border = "rounded",
          winblend = 20,
        },
        custom_kind = require("config.settings").icons.lspsaga,
      })
    end,
    cmd = "Lspsaga",
    keys = {
      {
        "gh",
        function()
          require("lspsaga.finder"):lsp_finder()
        end,
        silent = true,
        desc = "Lsp Finder",
      },

      {
        "<leader>cd",
        function()
          require("lspsaga.diagnostic").show_line_diagnostics()
        end,
        silent = true,
        desc = "Line Diagnostic",
      },

      {
        "<leader>o",
        function()
          require("lspsaga.outline"):render_outline()
        end,
        silent = true,
        "Lsp Outline",
      },
    },
  },
}
