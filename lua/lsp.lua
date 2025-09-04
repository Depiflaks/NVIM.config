local lspconfig = require("lspconfig")
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
  client.server_capabilities.documentFormattingProvider = true
  vim.keymap.set("n", "<leader>rc", function()
    vim.lsp.buf.format({
      async = true,
      filter = function(format_client)
        return format_client.name == "clangd"
      end,
    })
  end, { buffer = bufnr, desc = "Format with clang-format" })
end

lspconfig.clangd.setup({
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--cross-file-rename",     
    "--completion-style=detailed",
    "--all-scopes-completion", 
    "--header-insertion=never",
    "--compile-commands-dir=build",
  },
})

