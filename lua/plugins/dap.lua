local M = {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		config = true,
	},
}

M.keys = {
	{ '<leader>db', function()
		require('dap').toggle_breakpoint()
	end, desc = 'Toggle Breakpoint' },

	{ '<leader>dB', function()
		require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
	end, desc = 'Toggle Breakpoint' },

	{ '<leader>dc', function()
		require('dap').continue()
	end, desc = 'Continue' },

	{ '<leader>dd', function()
		require('dap').terminate()
		require('dapui').close()
	end, desc = 'Continue' },

	{ '<leader>dv', function()
		require('dap').step_over()
	end, desc = 'Step Over' },

	{ '<leader>di', function()
		require('dap').step_into()
	end, desc = 'Step Into' },

	{ '<leader>do', function()
		require('dap').step_out()
	end, desc = 'Step Out' },

	{ '<leader>dr', function()
		require('dap').repl.open()
	end, desc = 'Repl' },

	{ '<leader>dw', function()
		require('dap.ui.widgets').hover()
	end, desc = 'Widgets' },

	{ '<leader>du', function()
		require('dapui').toggle({})
	end, desc = 'Dap UI' },
}

function M.config()
	local fn = vim.fn

	-- Dap signs
	for name, icon in pairs(require('configs.icons').dap) do
		name = 'Dap' .. name
		fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
	end

	local dap, dapui = require('dap'), require('dapui')

	local python_path = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'

	dap.adapters.python = {
		type = 'executable';
		command = python_path;
		args = { '-m', 'debugpy.adapter' };
	}

	dap.configurations.python = {
		{
			type = 'python';
			request = 'launch';
			name = 'Launch file';

			program = '${file}';
			console = 'integratedTerminal',
			pythonPath = '/usr/bin/python3'
		},
	}

	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open({})
	end
	dap.listeners.before.event_terminated['dapui_config'] = function()
		dapui.close({})
	end
	dap.listeners.before.event_exited['dapui_config'] = function()
		dapui.close({})
	end
end

return M
