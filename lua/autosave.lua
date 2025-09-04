vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave", "FocusLost" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.filetype ~= "" then
      vim.cmd("silent! write")
    end
  end,
})
