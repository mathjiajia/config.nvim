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
		auto_install = true,
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
