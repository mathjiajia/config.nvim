local offset_first_n = function(match, _, _, pred, metadata)
	---@cast pred integer[]
	local capture_id = pred[2]
	if not metadata[capture_id] then
		metadata[capture_id] = {}
	end

	local range = metadata[capture_id].range or { match[capture_id]:range() }
	local offset = pred[3] or 0

	range[4] = range[2] + offset
	metadata[capture_id].range = range
end

vim.treesitter.query.add_directive("offset-first-n!", offset_first_n, true)

return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	-- branch = 'main',
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			config = function()
				-- Disable class keymaps in diff mode
				vim.api.nvim_create_autocmd("BufReadPost", {
					callback = function(event)
						if vim.wo.diff then
							for _, key in ipairs({ "[c", "]c", "[C", "]C" }) do
								pcall(vim.keymap.del, "n", key, { buffer = event.buf })
							end
						end
					end,
				})
			end,
		},
	},
	opts = {
		ensure_installed = {
			"bash",
			"bibtex",
			"c",
			"diff",
			"fish",
			"git_rebase",
			"gitcommit",
			"gitignore",
			"html",
			"javascript",
			"jsdoc",
			"json",
			"jsonc",
			"latex",
			"lua",
			"luadoc",
			"luap",
			"markdown",
			"markdown_inline",
			"matlab",
			"norg",
			"python",
			"query",
			"regex",
			"swift",
			"toml",
			"vim",
			"vimdoc",
			"yaml",
		},
		highlight = { enable = true },
		incremental_selection = { enable = true },
		indent = { enable = true },
		textobjects = {
			move = {
				enable = true,
				goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
				goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
				goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
				goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
			},
		},
	},
}
