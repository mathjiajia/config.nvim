require 'impatient'.enable_profile()

vim.g.mapleader = ','

-- PLUGINS LIST
vim.defer_fn(function()
    require 'plugins'
end, 800)
