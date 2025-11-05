if _G.__LSP_BOOTSTRAP_DONE__ then return end
_G.__LSP_BOOTSTRAP_DONE__ = true

local servers = {
	"lua_ls",
	-- "cssls",
	-- "html",
	-- "tsserver",
	"pyright",
	-- "bashls",
	"jsonls",
    "ruff"
	-- "yamlls",
    -- "ts_ls", "eslint", "intelephense", "emmet_ls", "gopls", "bashls", "dockerls", "html",
}

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	-- log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = false,
})

_G.__LSP_SERVER_DONE__ = _G.__LSP_SERVER_DONE__ or {}

for _, server in ipairs(servers) do
  server = vim.split(server, "@")[1]

  if not _G.__LSP_SERVER_DONE__[server] then
    local opts = {
      on_attach = require("user.lsp.handlers").on_attach,
      capabilities = require("user.lsp.handlers").capabilities,
    }

    local ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if ok and type(conf_opts) == "table" then
      opts = vim.tbl_deep_extend("force", opts, conf_opts)
    end

    -- Use new Neovim 0.11 API
    vim.lsp.config(server, opts)
    vim.lsp.enable(server)
    _G.__LSP_SERVER_DONE__[server] = true
  end
end
