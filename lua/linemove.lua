local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Normal-mode commands
map('n', '<A-j>', ':MoveLine(1)<CR>', opts)
map('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
map('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
map('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
map('n', '<C-l>', ':MoveWord(1)<CR>', opts)
map('n', '<C-h>', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
map('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
map('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
map('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
map('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
