local M = {}

function M.on_attach(client, bufnr)
    local caps = client.server_capabilities
    -- code lens
    if caps.codeLensProvider then
        local api, lsp = vim.api, vim.lsp
        local augroup = api.nvim_create_augroup
        local autocmd = api.nvim_create_autocmd

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
end

return M
