vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Automatically save all modified buffers when any buffer is saved
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    vim.cmd("silent! wall")
  end,
  desc = "Save all modified buffers when any buffer is saved",
})
