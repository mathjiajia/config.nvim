return {
	"mfussenegger/nvim-dap",

	dependencies = {

		-- fancy UI for the debugger
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
		-- virtual text for the debugger
		{ "theHamsta/nvim-dap-virtual-text", config = true },
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
		-- dap signs
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

		dap.adapters.python = function(cb, config)
			if config.request == "attach" then
				---@diagnostic disable-next-line: undefined-field
				local port = (config.connect or config).port
				---@diagnostic disable-next-line: undefined-field
				local host = (config.connect or config).host or "127.0.0.1"
				cb({
					type = "server",
					port = assert(port, "`connect.port` is required for a python `attach` configuration"),
					host = host,
					options = { source_filetype = "python" },
				})
			else
				cb({
					type = "executable",
					command = vim.fn.stdpath("data") .. "mason/packages/debugpy/venv/bin/python",
					args = { "-m", "debugpy.adapter" },
					options = { source_filetype = "python" },
				})
			end
		end

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Launch file",

				program = "${file}",
				pythonPath = function()
					local cwd = vim.fn.getcwd()
					if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
						return cwd .. "/venv/bin/python"
					elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
						return cwd .. "/.venv/bin/python"
					else
						return "/opt/homebrew/bin/python3"
					end
				end,
			},
		}

		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				sourceLanguages = { "cpp" },
			},
		}

		dap.configurations.c = dap.configurations.cpp
	end,
}
