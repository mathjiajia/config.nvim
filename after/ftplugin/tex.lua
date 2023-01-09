vim.g.tex_flavor = "latex"

vim.opt_local.conceallevel = 2
vim.opt_local.spell = true

vim.keymap.set("i", "<M-l>", "<C-g>u<Esc>[s1z=`]a<C-g>u", { buffer = true, desc = "Fix Last Miss-Spelling" })

vim.keymap.set("n", "<M-b>", vim.cmd.TexlabBuild, { desc = "Build LaTeX" })
vim.keymap.set("n", "<M-f>", vim.cmd.TexlabForward, { desc = "Forward Search" })

require("nvim-surround").buffer_setup({
	surrounds = {
		['"'] = {
			add = { "``", "''" },
			find = "``.-''",
			delete = "^(``)().-('')()$",
		},
		["$"] = {
			add = { "\\(", "\\)" },
			find = "\\%(.-\\%)",
			delete = "^(\\%()().-(\\%))()$",
			change = {
				target = "^\\(%()().-(\\%))()$",
				replacement = function()
					return { { "[", "\t" }, { "", "\\]" } }
				end,
			},
		},
	},
})
