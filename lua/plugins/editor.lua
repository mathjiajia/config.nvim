local util = require("util")

return {

  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
    end,
    config = {
      window = {
        position = "float",
        popup = {
          position = { row = 0, col = "100%" },
          size = function(state)
            local root_name = vim.fn.fnamemodify(state.path, ":~")
            local root_len = string.len(root_name) + 2
            return { width = math.max(root_len, 32), height = "60%" }
          end,
          border = { style = "rounded" },
        },
      },
      filesystem = { follow_current_file = true, hijack_netrw_behavior = "open_current" },
      source_selector = { winbar = true, tab_labels = { buffers = "  Bufs " } },
    },
    cmd = "Neotree",
    -- stylua: ignore
    keys = {
      { "<leader>ft", function() require("neo-tree.command").execute({ toggle = true, dir = util.get_root() }) end, desc = "Toggle NeoTree" },
    },
  },

  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "natecraddock/telescope-zf-native.nvim",
      "nvim-telescope/telescope-bibtex.nvim",
      {
        "nvim-telescope/telescope-frecency.nvim",
        keys = { { "<leader>fr", util.tele_extn("frecency"), desc = "Recent Files" } },
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        keys = { { "<leader><space>", util.tele_extn("file_browser", { path = "%:p:h" }), desc = "File Browser" } },
      },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local actions_layout = require("telescope.actions.layout")

      local home = vim.fn.expand("~")

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_config = { horizontal = { prompt_position = "top" } },
          prompt_prefix = "   ",
          selection_caret = " ",
          mappings = {
            i = {
              ["<M-a>"] = actions.toggle_all,
              ["<M-o>"] = actions_layout.toggle_preview,
            },
            n = {
              ["<M-a>"] = actions.toggle_all,
              ["<M-o>"] = actions_layout.toggle_preview,
            },
          },
          set_env = { ["COLORTERM"] = "truecolor" },
          file_ignore_patterns = { "%.jpeg$", "%.jpg$", "%.png$", ".DS_Store" },
        },
        pickers = {
          buffers = { theme = "dropdown", sort_lastused = true, previewer = false },
          current_buffer_fuzzy_find = { previewer = false },
          find_files = { theme = "ivy", follow = true },
          grep_string = { path_display = { "shorten" } },
          live_grep = { path_display = { "shorten" } },
        },
        extensions = {
          frecency = {
            show_scores = true,
            workspaces = {
              ["conf"] = home .. "/.config",
              ["dev"] = home .. "/Developer",
              ["doc"] = home .. "/Documents",
              ["tex"] = home .. "/TeX",
            },
          },
          bibtex = { format = "plain", wrap = true },
          file_browser = { theme = "ivy", hijack_netrw = true },
        },
      })

      local extns = {
        "zf-native",
        "file_browser",
        "frecency",
        "bibtex",
        "aerial",
        "noice",
      }
      for _, extn in ipairs(extns) do
        telescope.load_extension(extn)
      end
    end,
    cmd = "Telescope",
    -- stylua: ignore
    keys = {
      { "<leader>fb", util.tele_builtin("buffers"), desc = "Buffers" },
      { "<leader>fd", util.telescope("find_files"), desc = "Find Files" },
      { "<leader>ff", util.tele_builtin("current_buffer_fuzzy_find"), desc = "Current_Buf Fuzzy Find" },
      { "<leader>fg", util.telescope("live_grep"), desc = "Live Grep" },
      { "<leader>fh", util.tele_builtin("help_tags"), desc = "Help Tags" },
      { "<leader>fm", util.tele_builtin("builtin"), desc = "Telescope Meta" },
      { "<leader>fn", util.tele_builtin("find_files", { cwd = "~/.config/nvim" }), desc = "Neovim Config Files" },

      { "<leader>fz", function()
        require("telescope.builtin").find_files({
          cwd = util.get_root(),
          find_command = { "rg", "--files", "--type", vim.fn.input({ prompt = "Type: " }) }
        })
      end, desc = "Search Certain Type Files" },

      { "<leader>f/", function()
        require("telescope.builtin").grep_string({
          cwd = util.get_root(),
          search = vim.fn.input({ prompt = "Grep String > " })
        })
      end, desc = "Grep Strings" },
    },
  },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    dependencies = { "ggandor/flit.nvim", config = { labeled_modes = "nv" } },
    config = function()
      require("leap").add_default_mappings(true)
    end,
  },

  -- which-key
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     local wk = require("which-key")
  --     wk.setup({
  --       plugins = { spelling = true },
  --       key_labels = { ["<leader>"] = "SPC" },
  --     })
  --     wk.register({
  --       mode = { "n", "v" },
  --       ["g"] = { name = "+goto" },
  --       ["]"] = { name = "+next" },
  --       ["["] = { name = "+prev" },
  --       ["<leader>b"] = { name = "+buffer" },
  --       ["<leader>c"] = { name = "+code" },
  --       ["<leader>f"] = { name = "+file" },
  --       ["<leader>g"] = { name = "+git" },
  --       ["<leader>h"] = { name = "+help" },
  --       ["<leader>n"] = { name = "+noice" },
  --       ["<leader>q"] = { name = "+quit/session" },
  --       ["<leader>s"] = { name = "+search" },
  --       ["<leader>x"] = { name = "+diagnostics/quickfix" },
  --     })
  --   end,
  -- },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    config = {
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        vim.keymap.set("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(gitsigns.next_hunk)
          return "<Ignore>"
        end, { expr = true, buffer = bufnr })

        vim.keymap.set("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(gitsigns.prev_hunk)
          return "<Ignore>"
        end, { expr = true, buffer = bufnr })

        vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { buffer = bufnr, desc = "Stage Hunk" })
        vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { buffer = bufnr, desc = "Reset Hunk" })
        vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { buffer = bufnr, desc = "Preview Hunk" })
        vim.keymap.set("n", "<leader>hd", gitsigns.diffthis, { buffer = bufnr, desc = "Diff This" })
      end,
    },
    event = "BufReadPre",
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  -- symbols outline
  {
    "stevearc/aerial.nvim",
    config = {
      backends = { "lsp", "treesitter", "markdown", "man" },
      filter_kind = false,
      icons = require("config.settings").icons.aerial,
      show_guides = true,
      layout = { min_width = 30 },
    },
    -- stylua: ignore
    keys = {
      { "<M-o>", function() require("aerial").toggle() end, desc = "Toggle Aerial" },
    },
  },

  -- diffview
  {
    "sindrets/diffview.nvim",
    config = { enhanced_diff_hl = true },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
  },

  -- terminal
  {
    "numtostr/FTerm.nvim",
    -- stylua: ignore
    keys = {
      { "<M-i>", function() require("FTerm").toggle() end, mode = { "n", "t" }, desc = "Toggle Terminal" },
      { "<leader><Enter>", function() util.code_run() end, desc = "Code Runner" },
    },
    config = function()
      -- stylua: ignore start
      vim.keymap.set("t", "<Esc>", function() require("FTerm").exit() end, { desc = "Exit Terminal" })
      -- stylua: ignore end
    end,
  },
}
