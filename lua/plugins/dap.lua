return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    config = true,
  },
  config = function()
    -- dap signs
    for name, icon in pairs(require("config.settings").icons.dap) do
      name = "Dap" .. name
      vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
    end

    local dap, dapui = require("dap"), require("dapui")

    -- dapui
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end

    -- python: debugpy
    local python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
    dap.adapters.python = {
      type = "executable",
      command = python_path,
      args = { "-m", "debugpy.adapter" },
    }
    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",

        program = "${file}",
        console = "integratedTerminal",
        pythonPath = "/usr/bin/python3",
      },
    }

    vim.keymap.set("n", "<F5>", function()
      require("dap").continue()
    end, { desc = "Continue" })

    vim.keymap.set("n", "<F17>", function() -- Shift + F5
      require("dap").terminate()
      require("dapui").close({})
    end, { desc = "Continue" })

    vim.keymap.set("n", "<F10>", function()
      require("dap").step_over()
    end, { desc = "Step Over" })

    vim.keymap.set("n", "<F11>", function()
      require("dap").step_into()
    end, { desc = "Step Into" })

    vim.keymap.set("n", "<F12>", function()
      require("dap").step_out()
    end, { desc = "Step Out" })

    vim.keymap.set("n", "<leader>dl", function()
      require("dap").run_last()
    end, { desc = "Step Out" })
  end,
  keys = {
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },

    {
      "<leader>dB",
      function()
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end,
      desc = "Toggle Breakpoint",
    },

    {
      "<leader>lp",
      function()
        require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end,
      desc = "Toggle Breakpoint",
    },

    {
      "<leader>dr",
      function()
        require("dap").repl.open()
      end,
      desc = "Repl",
    },

    {
      "<leader>dw",
      function()
        require("dap.ui.widgets").hover()
      end,
      desc = "Widgets",
    },

    {
      "<leader>du",
      function()
        require("dapui").toggle({})
      end,
      desc = "Dap UI",
    },
  },
}
