local M = {
	'mfussenegger/nvim-dap',
	dependencies = {
		{
			'rcarriga/nvim-dap-ui',
			config = true,
		},
		'mfussenegger/nvim-dap-python',
	},
}

M.keys = {
	{ '<leader>db', function()
		require('dap').toggle_breakpoint()
	end, desc = 'Toggle Breakpoint' },

	{ '<leader>dc', function()
		require('dap').continue()
	end, desc = 'Continue' },

	{ '<leader>do', function()
		require('dap').step_over()
	end, desc = 'Step Over' },

	{ '<leader>di', function()
		require('dap').step_into()
	end, desc = 'Step Into' },

	{ '<leader>dw', function()
		require('dap.ui.widgets').hover()
	end, desc = 'Widgets' },

	{ '<leader>dr', function()
		require('dap').repl.open()
	end, desc = 'Repl' },

	{ '<leader>du', function()
		require('dapui').toggle({})
	end, desc = 'Dap UI' },
}

function M.config()
	require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

	local dap, dapui = require('dap'), require('dapui')

	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated['dapui_config'] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited['dapui_config'] = function()
		dapui.close()
	end
end

return M
