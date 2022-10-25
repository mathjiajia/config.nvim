require('gitsigns').setup({
	on_attach = function(bufnr)
		local gs = package.loaded.gitsigns

		vim.keymap.set(
			'n',
			']c',
			function()
				if vim.wo.diff then return ']c' end
				vim.schedule(function() gs.next_hunk() end)
				return '<Ignore>'
			end,
			{ expr = true, buffer = bufnr }
		)

		vim.keymap.set(
			'n',
			'[c',
			function()
				if vim.wo.diff then return '[c' end
				vim.schedule(function() gs.prev_hunk() end)
				return '<Ignore>'
			end,
			{ expr = true, buffer = bufnr }
		)
	end
})
