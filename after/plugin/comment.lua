require('Comment').setup({
    padding = function()
        return vim.bo.filetype ~= 'norg'
    end
})
