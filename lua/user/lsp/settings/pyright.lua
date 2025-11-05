-- require'lspconfig'.pyright.setup {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.codeLens = { dynamicRegistration = true }

return {
  capabilites = capabilites,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "on",
        extraPaths = {
          "src",
          ".",
          "test",
        },
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}
