local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.codeLens = { dynamicRegistration = true }

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

-- function show_diagnostics_float()
--   vim.diagnostic.open_float()
-- end


require "user.lsp.mason"
require("user.lsp.handlers").setup()
-- require "user.lsp.null-ls"
require "user.lsp.php"
-- require "user.lsp.haskell"
require "user.lsp.docker"
require "user.lsp.lua-language-server"
require "user.lsp.html"
-- require "user.lsp.settings.pyright"
require "user.lsp.python-lsp"
require "user.lsp.emmet"
