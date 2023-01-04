local api, fn = vim.api, vim.fn
local augroup = api.nvim_create_augroup
local autocmd = api.nvim_create_autocmd

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Highlight yanked text
augroup("HighlightYank", {})
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = "HighlightYank",
  desc = "Highlight the yanked text",
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Opens PDF files in sioyek instead of viewing the binary in Neovim
augroup("openPDF", {})
autocmd("BufReadPost", {
  pattern = "*.pdf",
  callback = function()
    fn.jobstart("sioyek '" .. fn.expand("%") .. "'", { detach = true })
    api.nvim_buf_delete(0, {})
  end,
  group = "openPDF",
  desc = "Opens PDF file in sioyek",
})
