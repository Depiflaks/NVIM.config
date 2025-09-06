local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.opt.clipboard = "unnamedplus"
vim.env.PATH = "/opt/homebrew/opt/llvm/bin:" .. vim.env.PATH
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
vim.o.mouse = ""

vim.o.cursorline = true

vim.o.list = true
vim.o.listchars = "tab:→ ,trail:·,extends:»,precedes:«"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("plugins")

require("lsp")
require("keymaps")
require("fzf")
require("linemove")
require("wordmotion")
require("autosave")
require("buffers")
require("multicursor")
require("neovide")
require("noneckpain")
