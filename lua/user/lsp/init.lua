local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
require "user.lsp.php"
require "user.lsp.haskell"
require "user.lsp.docker"
require "user.lsp.lua-language-server"
