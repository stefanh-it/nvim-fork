
if _G.__LSP_INIT_DONE__ then return end
_G.__LSP_INIT_DONE__ = true

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.codeLens = { dynamicRegistration = true }

-- Disable stylua as an LSP (it's a formatter, not an LSP server)
-- We use it through none-ls instead
vim.lsp.config('stylua', {
  filetypes = {},  -- Disable by setting empty filetypes
  autostart = false,
})

-- function show_diagnostics_float()
--   vim.diagnostic.open_float()
-- end


require "user.lsp.mason"
require("user.lsp.handlers").setup()
-- require "user.lsp.null-ls"
require "user.lsp.none-ls"
-- require "user.lsp.php"
-- require "user.lsp.haskell"
-- require "user.lsp.docker"
-- require "user.lsp.lua-language-server"
-- require "user.lsp.html"
-- require "user.lsp.settings.pyright"
-- require "user.lsp.python-lsp"
-- require "user.lsp.lint"
-- require "user.lsp.emmet"
-- require "user.lsp.gopls"
-- require "user.lsp.javascript"
-- require "user.lsp.bashls"

-- Stop duplicate clients (same name + same root)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_dedupe", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or not client.config or not client.config.root_dir then return end
    for _, c in pairs(vim.lsp.get_clients()) do
      if c.id ~= client.id and c.name == client.name
         and c.config and c.config.root_dir == client.config.root_dir then
        client.stop()
        vim.notify(("Stopped duplicate %s for %s"):format(client.name, client.config.root_dir), vim.log.levels.WARN)
        return
      end
    end
  end,
})

