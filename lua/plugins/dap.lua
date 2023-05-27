local fn = vim.fn

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
			-- stylua: ignore
      keys = {
        { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
        { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
        { "<leader>dE", function() require("dapui").eval(fn.input("[DAP] Expression > ")) end, desc = "Eval Expression" },
      },
	},
	config = function()
		-- dap signs
		local icons = require("config").icons.dap
		for name, icon in pairs(icons) do
			name = "Dap" .. name
			fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
		end

		local dap = require("dap")

		-- c, c++, rust: cpptools
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "OpenDebugAD7",
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return fn.input({
						prompt = "Path to executable: ",
						default = fn.getcwd() .. "/a.out",
						completion = "file",
					})
				end,
				cwd = "${workspaceFolder}",
				MIMode = "lldb",
				stopAtEntry = true,
				setupCommands = {
					{
						text = "-enable-pretty-printing",
						description = "enable pretty printing",
						ignoreFailures = false,
					},
				},
			},
			{
				name = "Attach to lldbserver :1234",
				type = "cppdbg",
				request = "launch",
				MIMode = "lldb",
				miDebuggerServerAddress = "localhost:1234",
				miDebuggerPath = "usr/bin/lldb",
				cwd = "${workspaceFolder}",
				program = function()
					return fn.input({
						prompt = "Path to executable: ",
						default = fn.getcwd() .. "/",
						completion = "file",
					})
				end,
				preLaunchTask = "C/C++: clang build active file",
				setupCommands = {
					{
						text = "-enable-pretty-printing",
						description = "enable pretty printing",
						ignoreFailures = false,
					},
				},
			},
		}
		dap.configurations.c = dap.configurations.cpp

		-- python: debugpy
		dap.adapters.python = {
			type = "executable",
			command = "debugpy-adapter",
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
			{
				type = "python",
				request = "attach",
				connect = {
					port = 5678,
					host = "127.0.0.1",
				},
				mode = "remote",
				name = "Container Attach Debug",
				cwd = fn.getcwd(),
				pathMappings = {
					{
						localRoot = function()
							return fn.input({
								prompt = "Local code folder > ",
								default = fn.getcwd(),
								completion = "file",
							})
						end,
						remoteRoot = function()
							return fn.input({
								prompt = "Container code folder > ",
								default = "/",
								completion = "file",
							})
						end,
					},
				},
			},
		}
	end,
		-- stylua: ignore
  keys = {
    { "<leader>dB", function() require("dap").set_breakpoint(fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
}
