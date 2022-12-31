local M = {}

local runners = {
	lua = 'lua',
	python = 'python3',
	swift = 'swift',
}

function M.code_run()
	local buf = vim.api.nvim_buf_get_name(0)
	local ftype = vim.filetype.match({ filename = buf })
	local exec = runners[ftype]
	if exec ~= nil then
		require('FTerm').scratch({ cmd = { exec, buf } })
	end
end

---@return string
function M.get_root()
	local path = vim.loop.fs_realpath(vim.api.nvim_buf_get_name(0))
	---@type string[]
	local roots = {}
	if path ~= '' then
		for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
			local workspace = client.config.workspace_folders
			local paths = workspace and vim.tbl_map(function(ws)
				return vim.uri_to_fname(ws.uri)
			end, workspace) or client.config.root_dir and { client.config.root_dir } or {}
			for _, p in ipairs(paths) do
				local r = vim.loop.fs_realpath(p)
				if path:find(r, 1, true) then
					roots[#roots + 1] = r
				end
			end
		end
	end
	---@type string?
	local root = roots[1]
	if not root then
		path = path == '' and vim.loop.cwd() or vim.fs.dirname(path)
		---@type string?
		root = vim.fs.find({ '.git' }, { path = path, upward = true })[1]
		root = root and vim.fs.dirname(root) or vim.loop.cwd()
	end
	---@cast root string
	return root
end

function M.lazygit(cwd)
	require('lazy.util').open_cmd({ 'lazygit' }, {
		cwd = cwd,
		terminal = true,
		close_on_exit = true,
		enter = true,
		float = {
			size = { width = 1, height = 1 },
			margin = { top = 0, right = 0, bottom = 0, left = 0 },
		},
	})
end

return M
