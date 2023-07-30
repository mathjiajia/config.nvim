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

local api, lsp = vim.api, vim.lsp
local lspconfig = require("lspconfig")

local close_env = function()
	local buf = api.nvim_get_current_buf()

	local params = lsp.util.make_position_params()
	local client = lspconfig.util.get_active_client_by_name(buf, "texlab")

	client.request("workspace/executeCommand", {
		command = "texlab.findEnvironments",
		arguments = { params },
	}, function(_, envs, _)
		if #envs == 0 then
			print("No environment found")
			return
		end
		local text = envs[#envs].name.text
		vim.api.nvim_set_current_line("\\end{" .. text .. "}")
	end, buf)
end

local cancle_build = function()
	local buf = api.nvim_get_current_buf()

	local params = lsp.util.make_position_params()
	local client = lspconfig.util.get_active_client_by_name(buf, "texlab")

	client.request("workspace/executeCommand", {
		command = "texlab.cancelBuild",
		arguments = { params },
	}, function() end, buf)
end

local toggle_star = function()
	local buf = api.nvim_get_current_buf()

	local params = lsp.util.make_position_params()
	local client = lspconfig.util.get_active_client_by_name(buf, "texlab")

	client.request("workspace/executeCommand", {
		command = "texlab.findEnvironments",
		arguments = { params },
	}, function(_, envs, _)
		if #envs == 0 then
			print("No environment found")
			return
		end
		local text = envs[#envs].name.text
		if text:sub(#text) == "*" then
			text = text:sub(1, #text - 1)
		else
			text = text .. "*"
		end
		params.newName = text
		client.request("workspace/executeCommand", {
			command = "texlab.changeEnvironment",
			arguments = { params },
		}, function() end, buf)
	end, buf)
end

vim.keymap.set("i", "]]", close_env, { buffer = true, desc = "Close the current environment/delimiter" })
vim.keymap.set("n", "<M-x>", cancle_build, { buffer = true, desc = "Cancel the currently active build" })
vim.keymap.set("n", "tse", toggle_star, { buffer = true, desc = "Toggle starred environment" })
