vim.keymap.set({ 'n', 't' }, '<C-\\>', function()
    require 'FTerm'.toggle()
end, { desc = 'Terminal Toggle' })
vim.keymap.set('t', '<Esc>', function()
    require 'FTerm'.exit()
end, { desc = 'Terminal Exit' })
vim.keymap.set('n', '<M-g>', function()
    require 'FTerm':new({
        cmd = 'lazygit',
        dimensions = { height = 1, width = 1 }
    }):open()
end, { desc = 'LazyGit' })

local runners = { lua = 'lua', python = 'python3', swift = 'swift' }

vim.keymap.set('n', '<leader><Enter>', function()
    local buf = vim.api.nvim_buf_get_name(0)
    local ftype = vim.filetype.match({ filename = buf })
    local exec = runners[ftype]
    if exec ~= nil then
        require('FTerm').scratch({ cmd = { exec, buf } })
    end
end)
