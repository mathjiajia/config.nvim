local M = {
	-- builtin LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			{
				'williamboman/mason.nvim',
				config = {
					ui = { border = 'rounded' },
				},
			},
			{ 'williamboman/mason-lspconfig.nvim', config = true },
			{ 'folke/neodev.nvim', config = true },
		},
		config = function()
			local api, fn = vim.api, vim.fn
			local augroup = api.nvim_create_augroup
			local autocmd = api.nvim_create_autocmd
			local lsp = vim.lsp

			-- Diagnostic signs
			for name, icon in pairs(require('configs.icons').diagnostics) do
				name = 'DiagnosticSign' .. name
				fn.sign_define(name, { text = icon, texthl = name, numhl = '' })
			end

			-- Diagnostic keymaps
			vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Loclist Diagnostics' })

			-- common on_attach
			local on_attach = function(client, bufnr)
				vim.keymap.set('n', 'gD', lsp.buf.declaration, { buffer = bufnr, desc = 'Go to Declaration' })
				vim.keymap.set('n', 'gd', function()
					require('lspsaga.definition'):peek_definition()
				end, { buffer = bufnr, desc = 'Go to Definition' })
				vim.keymap.set('n', 'K', function()
					require('lspsaga.hover'):render_hover_doc()
				end, { buffer = bufnr, desc = 'Docs Hover' })
				vim.keymap.set('n', 'gi', lsp.buf.implementation, { buffer = bufnr, desc = 'Goto Implementation' })
				vim.keymap.set('n', '<C-k>', lsp.buf.signature_help, { buffer = bufnr, desc = 'Signature' })
				vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = 'Rename Symbol' })
				vim.keymap.set('n', 'gr', lsp.buf.references, { buffer = bufnr, desc = 'References' })

				local caps = client.server_capabilities

				-- document highligh
				if caps.documentHighlightProvider then
					augroup('lsp_document_highlight', { clear = false })
					api.nvim_clear_autocmds({
						buffer = bufnr,
						group = 'lsp_document_highlight',
					})
					autocmd('CursorHold', {
						callback = lsp.buf.document_highlight,
						buffer = bufnr,
						group = 'lsp_document_highlight',
					})
					autocmd('CursorMoved', {
						callback = lsp.buf.clear_references,
						buffer = bufnr,
						group = 'lsp_document_highlight',
					})
				end

				-- code action
				if caps.codeActionProvider then
					vim.keymap.set({ 'n', 'x' }, '<leader>ca', function()
						require('lspsaga.codeaction'):code_action()
					end, { buffer = bufnr, desc = '(Range) Code Actions' })
				end

				-- code lens
				if caps.codeLensProvider then
					augroup('lsp_codelens', { clear = true })
					autocmd('BufEnter', {
						callback = lsp.codelens.refresh,
						buffer = bufnr,
						group = 'lsp_codelens',
						once = true,
					})
					autocmd({ 'BufWritePost', 'CursorHold' }, {
						callback = lsp.codelens.refresh,
						buffer = bufnr,
						group = 'lsp_codelens',
					})
				end

				-- document formatting
				if caps.documentFormattingProvider then
					vim.keymap.set('n', '<leader>lf', function()
						lsp.buf.format({ bufnr = bufnr, async = true })
					end, { buffer = bufnr, desc = 'Format Document' })
				end
				if caps.documentRangeFormattingProvider then
					vim.keymap.set('x', '<leader>lf', function()
						lsp.buf.format({ bufnr = bufnr, async = true })
					end, { buffer = bufnr, desc = 'Format Range' })
				end
			end

			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local nvim_lsp = require('lspconfig')

			require('mason-lspconfig').setup_handlers({
				function(server_name)
					nvim_lsp[server_name].setup({
						on_attach = on_attach,
						capabilities = capabilities,
					})
				end,
				['sumneko_lua'] = function()
					nvim_lsp.sumneko_lua.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							Lua = {
								workspace = {
									checkThirdParty = false,
								},
							},
						},
					})
				end,
				['texlab'] = function()
					-- local build_executable = 'tectonic'
					-- local build_args = {
					-- 	'-X',
					-- 	'compile',
					-- 	'%f',
					-- 	'--synctex',
					-- 	'--keep-logs',
					-- 	'--keep-intermediates',
					-- }
					local build_executable = 'latexmk'
					local build_args = {
						'-xelatex',
						-- '-verbose',
						'-synctex=1',
						'-interaction=nonstopmode',
						'%f',
					}

					local binary_path = fn.stdpath('data') .. '/lazy/nvim-texlabconfig/nvim-texlabconfig'
					local cache_root = fn.stdpath('cache')

					local forward_executable = 'sioyek'
					local forward_args = {
						'--inverse-search',
						binary_path .. ' -file %1 -line %2 -cache_root ' .. cache_root,
						'--reuse-window',
						'--forward-search-file',
						'%f',
						'--forward-search-line',
						'%l',
						'%p',
					}
					-- local forward_executable = '/Applications/Skim.app/Contents/SharedSupport/displayline'
					-- local forward_args = { '%l', '%p', '%f' }

					nvim_lsp.texlab.setup({
						on_attach = on_attach,
						capabilities = capabilities,
						settings = {
							texlab = {
								build = {
									executable = build_executable,
									args = build_args,
									-- forwardSearchAfter = true,
									onSave = true,
								},
								forwardSearch = {
									executable = forward_executable,
									args = forward_args,
								},
								-- chktex = {
								-- onOpenAndSave = true,
								-- },
								diagnostics = {
									ignoredPatterns = {
										'^Overfull',
										'^Underfull',
									},
								},
							},
						},
					})
				end
			})

			-- config sourcekit alone
			nvim_lsp.sourcekit.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
		event = 'BufReadPre',
	},

	-- inject LSP
	{
		'jose-elias-alvarez/null-ls.nvim',
		config = function()
			local null_ls = require('null-ls')
			local b = null_ls.builtins

			local sources = {
				b.formatting.black,
				b.formatting.fish_indent,
				-- b.formatting.latexindent,
				b.formatting.prettierd.with({
					filetypes = { 'css', 'javascript', 'yaml', 'markdown' }
				}),
				-- b.formatting.stylua,
				-- b.diagnostics.chktex,
				b.diagnostics.fish,
				b.diagnostics.markdownlint.with({
					args = { '--config', '~/.config/markdownlint/markdownlint.yaml', '--stdin' }
				}),
			}

			null_ls.setup({
				sources = sources,
				on_attach = function(client, bufnr)
					local caps = client.server_capabilities

					if caps.documentFormattingProvider then
						vim.keymap.set('n', '<leader>lf', function()
							vim.lsp.buf.format({ bufnr = bufnr, async = true })
						end, { buffer = bufnr, desc = 'Format Document' })
					end
					if caps.documentRangeFormattingProvider then
						vim.keymap.set('x', '<leader>lf', function()
							vim.lsp.buf.format({ bufnr = bufnr, async = true })
						end, { buffer = bufnr, desc = 'Format Range' })
					end
				end,
			})
		end,
		ft = { 'python', 'fish', 'css', 'javascript', 'yaml', 'markdown' },
	},

	-- lsp enhancement
	{
		'glepnir/lspsaga.nvim',
		branch = 'version_2.3',
		config = function()
			local saga = require('lspsaga')

			saga.init_lsp_saga({
				ui = {
					border = 'rounded',
					winblend = 20,
				},
				custom_kind = require('configs.icons').saga,
			})
		end,
		cmd = 'Lspsaga',
		keys = {
			{ 'gh', function()
				require('lspsaga.finder'):lsp_finder()
			end, silent = true, desc = 'Lsp Finder' },

			{ '<leader>cd', function()
				require('lspsaga.diagnostic').show_line_diagnostics()
			end, silent = true, desc = 'Line Diagnostic' },

			{ ']d', function()
				require('lspsaga.diagnostic').goto_next()
			end, silent = true, desc = 'Next Diagnostics' },
			{ '[d', function()
				require('lspsaga.diagnostic').goto_prev()
			end, silent = true, desc = 'Previous Diagnostics' },

			{ ']e', function()
				require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, silent = true, desc = 'Next Error' },
			{ '[e', function()
				require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, silent = true, desc = 'Previous Error' },

			{ '<leader>o', function()
				require('lspsaga.outline'):render_outline()
			end, silent = true, 'Lsp Outline' },
		},
	},

	-- lsp trouble
	{
		'folke/trouble.nvim',
		enabled = false,
		config = true,
	},
}


return M
