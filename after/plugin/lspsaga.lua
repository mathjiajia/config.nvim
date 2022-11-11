require('lspsaga').init_lsp_saga({
	border_style = 'rounded',
	diagnostic_header = { ' ', ' ', ' ', ' ' },
	max_preview_lines = 10,
	finder_icons = {
		def = '  ',
		ref = '諭 ',
		link = '  ',
	},
	symbol_in_winbar = {
		enable = true,
		click_support = function(node, _, button)
			local st = node.range.start
			if button == 'l' then
				vim.fn.cursor(st.line + 1, st.character + 1)
			end
		end,
	},
})
