local M = {}

local api = vim.api
local fs, uv = vim.fs, vim.loop

M.root_patterns = { '.git', '/lua' }

M.runners = {
	lua = 'lua',
	python = 'python3',
	swift = 'swift',
}

function M.code_run()
	local buf = api.nvim_buf_get_name(0)
	local ftype = vim.filetype.match({ filename = buf })
	local exec = M.runners[ftype]

	if exec ~= nil then
		require('FTerm').scratch({ cmd = { exec, buf } })
	end
end

-- returns the root directory based on:
-- * lsp workspace folders
-- * lsp root_dir
-- * root pattern of filename of the current buffer
-- * root pattern of cwd
---@return string
function M.get_root()
	---@type string?
	local path = api.nvim_buf_get_name(0)
	path = path ~= '' and uv.fs_realpath(path) or nil
	---@type string[]
	local roots = {}
	if path then
		for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			local workspace = client.config.workspace_folders
			local paths = workspace and vim.tbl_map(function(ws)
				return vim.uri_to_fname(ws.uri)
			end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
			for _, p in ipairs(paths) do
				local r = uv.fs_realpath(p)
				if path:find(r, 1, true) then
					roots[#roots + 1] = r
				end
			end
		end
	end
	table.sort(roots, function(a, b)
		return #a > #b
	end)
	---@type string?
	local root = roots[1]
	if not root then
		path = path and fs.dirname(path) or uv.cwd()
		---@type string?
		root = fs.find(M.root_patterns, { path = path, upward = true })[1]
		root = root and fs.dirname(root) or uv.cwd()
	end
	---@cast root string
	return root
end

function M.telescope(builtin, opts)
	return function()
		opts = opts or {}
		opts.cwd = M.get_root()
		require('telescope.builtin')[builtin](opts)
	end
end

function M.float_term(cmd, opts)
	opts = vim.tbl_deep_extend('force', {
		terminal = true,
		close_on_exit = true,
		enter = true,
		float = {
			size = { width = 0.9, height = 0.9 },
			margin = { top = 0, right = 0, bottom = 0, left = 0 },
		},
	}, opts or {})
	require('lazy.util').open_cmd(cmd, opts)
end

return M
