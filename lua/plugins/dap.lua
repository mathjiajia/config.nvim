return {
	"mfussenegger/nvim-dap",

	dependencies = {
		{ "jbyuki/one-small-step-for-vimkind" },
		{ "mfussenegger/nvim-dap-python", lazy = true },
		{ "theHamsta/nvim-dap-virtual-text" },
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
			-- stylua: ignore
			keys = {
				{ "<leader>du", function() require("dapui").toggle() end, desc = "Dap UI" },
				{ "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
			},
			config = function()
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup()
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end
			end,
		},
	},
	-- stylua: ignore
	keys = {
		{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
		{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
		{ "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
		{ "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
		{ "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
		{ "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
		{ "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
		{ "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
		{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
		{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets", mode = { "n", "v" } },
	},
	config = function()
		local icons = {
			Stopped = "󰁕 ",
			Breakpoint = " ",
			BreakpointCondition = " ",
			BreakpointRejected = " ",
			LogPoint = ".>",
		}
		for name, sign in pairs(icons) do
			name = "Dap" .. name
			vim.fn.sign_define(name, { text = sign, texthl = name, numhl = "" })
		end

		local dap = require("dap")
		require("nvim-dap-virtual-text").setup({})
		require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")

		dap.adapters.nlua = function(callback, conf)
			local adapter = {
				type = "server",
				host = conf.host or "127.0.0.1",
				port = conf.port or 8086,
			}
			if conf.start_neovim then
				local dap_run = dap.run
				dap.run = function(c)
					adapter.port = c.port
					adapter.host = c.host
				end
				require("osv").run_this()
				dap.run = dap_run
			end
			callback(adapter)
		end

		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Run this file",
				start_neovim = {},
			},
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance (port = 8086)",
				port = 8086,
			},
		}

		dap.adapters.cppdbg = {
			id = "cppdbg",
			name = "cppdbg",
			type = "executable",
			command = os.getenv("HOME")
				.. "/.vscode/extensions/ms-vscode.cpptools-1.22.9-darwin-arm64/debugAdapters/bin/OpenDebugAD7",
		}

		local enablePretty = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		}
		dap.configurations.c = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				setupCommands = enablePretty,
				program = "./${fileBasenameNoExtension}",
				cwd = "${workspaceFolder}",
				stopAtEntry = true,
			},
			{
				name = "Attach to gdbserver :1234",
				type = "cppdbg",
				setupCommands = enablePretty,
				request = "launch",
				MIMode = "gdb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "/usr/bin/gdb",
				cwd = "${workspaceFolder}",
				program = "./${fileBasenameNoExtension}",
			},
		}

		dap.configurations.cpp = dap.configurations.c
	end,
}
