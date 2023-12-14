local function get_args(config)
	local args = type(config.args) == "function" and (config.args() or {}) or config.args or {}
	config = vim.deepcopy(config)
	---@cast args string[]
	config.args = function()
		local new_args = vim.fn.input("Run with args: ", table.concat(args, " "))
		return vim.split(vim.fn.expand(new_args) --[[@as string]], " ")
	end
	return config
end

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		-- fancy UI for the debugger
		{
			"rcarriga/nvim-dap-ui",
		-- stylua: ignore
		keys = {
			{ "<leader>du", function() require("dapui").toggle({ }) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
			{ "<leader>dE", function() require("dapui").eval(vim.fn.input("[DAP] Expression > ")) end, desc = "Eval Expression" },
		},
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
		},
	},
	-- stylua: ignore
  keys = {
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
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
	config = function()
		-- dap signs
		vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "DapBreakpoint", numhl = "" })
		vim.fn.sign_define("DapBreakpointRejected", { text = " ", texthl = "DapBreakpoint", numhl = "" })
		vim.fn.sign_define("DapLogPoint", { text = ".>", texthl = "DapLogPoint", linehl = "DapLogPoint", numhl = "" })
		vim.fn.sign_define("DapStopped", { text = "󰁕 ", texthl = "DapStopped", linehl = "DapStopped", numhl = "" })

		local dap = require("dap")

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
							return vim.fn.input({ prompt = "Local code folder > ", default = vim.fn.getcwd(), completion = "file" })
						end,
						remoteRoot = function()
							return vim.fn.input({ prompt = "Container code folder > ", default = "/", completion = "file" })
						end,
					},
				},
			},
		}
	end,
}
