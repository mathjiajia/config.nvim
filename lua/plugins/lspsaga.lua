local M = {
	'glepnir/lspsaga.nvim',
	branch = 'main',
}

M.config = function()
	local saga = require('lspsaga')

	saga.init_lsp_saga({
		border_style = 'rounded',
		saga_winblend = 20,
		diagnostic_header = { ' ', ' ', ' ', '' },
		custom_kind = {
			File          = { ' ', '#D4D4D4' },
			Module        = { ' ', '#D4D4D4' },
			Namespace     = { ' ', '#4EC9B0' },
			Package       = { ' ', '#C586C0' },
			Class         = { ' ', '#f28b25' },
			Method        = { ' ', '#C586C0' },
			Property      = { ' ', '#9CDCFE' },
			Field         = { ' ', '#4EC9B0' },
			Constructor   = { ' ', '#4EC9B0' },
			Enum          = { ' ', '#4EC9B0' },
			Interface     = { ' ', '#9CDCFE' },
			Function      = { ' ', '#C586C0' },
			Variable      = { ' ', '#9CDCFE' },
			Constant      = { ' ', '#569CD6' },
			String        = { ' ', '#4EC9B0' },
			Number        = { ' ', '#B5CEA8' },
			Boolean       = { ' ', '#569CD6' },
			Array         = { ' ', '#569CD6' },
			Object        = { ' ', '#CE9178' },
			Key           = { ' ', '#D4D4D4' },
			Null          = { '  ', '#F44747' },
			EnumMember    = { ' ', '#4EC9B0' },
			Struct        = { ' ', '#569CD6' },
			Event         = { ' ', '#DCDCAA' },
			Operator      = { ' ', '#D4D4D4' },
			TypeParameter = { ' ', '#9CDCFE' },
			-- ccls
			TypeAlias     = { 'ﰠ ', '#4EC9B0' },
			Parameter     = { ' ', '#569CD6' },
			StaticMethod  = { ' ', '#6A9955' },
			Macro         = { ' ', '#F44747' },
		},
	})
end

M.keys = {
	{ 'gh', function()
		require('lspsaga.finder'):lsp_finder()
	end, silent = true },

	{ '<leader>cl', function()
		require('lspsaga.diagnostic').show_line_diagnostics()
	end, silent = true },

	{ '<leader>cc', function()
		require('lspsaga.diagnostic').show_cursor_diagnostics()
	end, silent = true },

	{ ']d', function()
		require('lspsaga.diagnostic').goto_next()
	end, silent = true },
	{ '[d', function()
		require('lspsaga.diagnostic').goto_prev()
	end, silent = true },

	{ ']e', function()
		require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
	end, silent = true },
	{ '[e', function()
		require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
	end, silent = true },

	{ '<M-o>', function()
		require('lspsaga.outline'):render_outline()
	end, silent = true },
}

return M
