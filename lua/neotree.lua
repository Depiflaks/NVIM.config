vim.keymap.set("n", "<A-1>", function()
  vim.cmd("Neotree toggle")
  vim.defer_fn(function()
    local current_file = vim.api.nvim_buf_get_name(0)
    if current_file ~= "" then
      local state = require("neo-tree.sources.manager").get_state("filesystem")
      if state then
        require("neo-tree.ui.renderer").focus_node(state, current_file, false)
      end
    end
  end, 50)
end, { desc = "Toggle Neo-Tree (float)" })

vim.keymap.set("n", "<A-2>", "<Cmd>Neotree buffers<CR>", {
  desc = "Toggle Neo-Tree (float)"
})
vim.keymap.set("n", "<A-3>", "<Cmd>Neotree git_status<CR>", {
  desc = "Toggle Neo-Tree (float)"
})
