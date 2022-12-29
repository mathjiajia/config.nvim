local M = {
	'frabjous/knap',
	enabled = false,
	ft = 'tex',
}

M.keys = {
	{ '<F5>', function() require('knap').process_once() end, mode = { 'i', 'n', 'v' } },
	{ '<F6>', function() require('knap').close_viewer() end, mode = { 'i', 'n', 'v' } },
	{ '<F7>', function() require('knap').toggle_autopreviewing() end, mode = { 'i', 'n', 'v' } },
	{ '<F8>', function() require('knap').forward_jump() end, mode = { 'i', 'n', 'v' } },
}

return M
