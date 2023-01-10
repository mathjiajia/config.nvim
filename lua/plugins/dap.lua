return {
	"mfussenegger/nvim-dap",
	dependencies = { "rcarriga/nvim-dap-ui", config = true },
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
			dap.repl.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close({})
			dap.repl.close()
		end

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
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/a.out", "file")
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
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
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
				cwd = vim.fn.getcwd(),
				pathMappings = {
					{
						localRoot = function()
							return vim.fn.input("Local code folder > ", vim.fn.getcwd(), "file")
						end,
						remoteRoot = function()
							return vim.fn.input("Container code folder > ", "/", "file")
						end,
					},
				},
			},
		}

		-- stylua: ignore start
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
		vim.keymap.set("n", "<F17>", function()
			dap.terminate()
			dapui.close({})
		end, { desc = "Terminate" })

		vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
		vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Eval" })
		vim.keymap.set("n", "<leader>dE", function()
			dapui.eval(vim.fn.input("[DAP] Expression > "), {})
		end, { desc = "Eval Expression" })
		-- stylua: ignore end
	end,
		-- stylua: ignore
		keys = {
			{ "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Breakpoint" },
			{ "<leader>dB", function() require("dapui").toggle({}) end, desc = "Dap UI" },
			{ "<leader>dc", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, desc = "Conditional Breakpoint" },
			{ "<leader>lp", function()
				require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
			end, desc = "Log point message" },
			{ "<leader>dr", function() require("dap").repl.open() end, desc = "Repl" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
	},
}
