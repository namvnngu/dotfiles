local function augroup(name)
  return vim.api.nvim_create_augroup("namnguyen" .. name, { clear = true })
end
-- Trim spaces
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup("TrimSpaces"),
  pattern = "*",
  callback = function()
    local patterns = {
      [[%s/\s\+$//e]],
      [[%s/\%^\n\+//]],
      [[%s/\(\n\n\)\n\+/\1/]],
      [[%s/\($\n\s*\)\+\%$//]],
    }
    local save = vim.fn.winsaveview()
    for _, v in pairs(patterns) do
      vim.api.nvim_exec2(
        string.format("keepjumps keeppatterns silent! %s", v),
        { output = false }
      )
    end
    vim.fn.winrestview(save)
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("ScssToSass"),
  pattern = "*.scss",
  command = "set filetype=sass",
})

-- Resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("HighlightYank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})
