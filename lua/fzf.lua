local map = vim.keymap.set
map("n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", { desc = "Grep Text" })
map("n", "<leader>fc", "<cmd>FzfLua git_commits<CR>", { desc = "Git Commits" })

