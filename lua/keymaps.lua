local opts = { noremap = true, silent = true }
local map = vim.keymap.set
local fzf = require 'fzf-lua'

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = true
vim.opt.incsearch = true      

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("i", "jk", "<Esc>", opts)

map("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Ресурсная перезагрузка Neovim конфигов
map("n", "<leader>r", ":so %<CR>", opts)


map("n", "x", '"_x', { noremap = true, silent = true })
map("n", "s", '"_s', { noremap = true, silent = true })


-- next and prev
map("i", "<A-n>", "<C-n>", { noremap = true })
map("i", "<A-p>", "<C-p>", { noremap = true })

map("c", "<A-n>", "<C-n>", { noremap = true })
map("c", "<A-p>", "<C-p>", { noremap = true })

map("t", "<A-n>", "<C-n>", { noremap = true })
map("t", "<A-p>", "<C-p>", { noremap = true })

map("i", "<A-h>", "<Left>", { noremap = true })
map("i", "<A-l>", "<Right>", { noremap = true })

-- navigation
map("n", "gd", fzf.lsp_definitions, opts)
map("n", "gD", vim.lsp.buf.declaration, opts)
map("n", "gi", fzf.lsp_implementations, opts)
map("n", "gr", fzf.lsp_references, { noremap = true, silent = true, nowait = true })
map("n", "gt", fzf.lsp_typedefs, opts)
map("n", "<Leader>ls", fzf.lsp_document_symbols, opts)
map("n", "<Leader>ws", fzf.lsp_workspace_symbols, opts)

-- docs
map("n", "<Leader>sh", vim.lsp.buf.hover, opts)
map("n", "<Leader>sj", vim.lsp.buf.signature_help, opts)
map("n", "<Leader>su", vim.lsp.buf.incoming_calls, opts)
map("n", "<Leader>so", vim.lsp.buf.outgoing_calls, opts)

-- refactoring
map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, opts)
map("n", '<leader>rn', vim.lsp.buf.rename, opts)
-- map("v", "<Leader>rr", vim.lsp.buf.range_code_action, opts)

-- errors
map("n", "<Leader>ee", vim.diagnostic.open_float, opts)
map("n", "<Leader>en", vim.diagnostic.goto_next, opts)
map("n", "<Leader>ep", vim.diagnostic.goto_prev, opts)

-- enter
map("n", "<S-CR>", "o<Esc>", { noremap = true, silent = true })
map("n", "<A-CR>", "i<CR><Esc>", { noremap = true, silent = true })
map("n", "U", "<C-r>", { noremap = true, silent = true })
