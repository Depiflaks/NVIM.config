local map = vim.keymap.set
local fzf = require("fzf-lua")

map("n", "<Leader>qq", ":bd<CR>", { desc = "Закрыть буфер" })

map("n", "<Leader>b", function()
  fzf.buffers()
end, { desc = "FZF: список буферов" })

map("n", "<Leader>nh", function()
  vim.cmd("leftabove vsplit")
  fzf.files()
end, { desc = "Открыть файл (влево)" })

map("n", "<Leader>nl", function()
  vim.cmd("rightbelow vsplit")
  fzf.files()
end, { desc = "Открыть файл (вправо)" })

map("n", "<Leader>nk", function()
  vim.cmd("leftabove split")
  fzf.files()
end, { desc = "Открыть файл (вверх)" })

map("n", "<Leader>nj", function()
  vim.cmd("rightbelow split")
  fzf.files()
end, { desc = "Открыть файл (вниз)" })

map("n", "<Leader>th", "<C-w>h", { desc = "Окно влево" })
map("n", "<Leader>tl", "<C-w>l", { desc = "Окно вправо" })
map("n", "<Leader>tj", "<C-w>j", { desc = "Окно вниз" })
map("n", "<Leader>tk", "<C-w>k", { desc = "Окно вверх" })

map("n", "<S-Space>", "<C-^>", { desc = "Предыдущий буфер" })